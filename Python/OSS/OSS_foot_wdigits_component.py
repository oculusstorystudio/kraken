import re

from kraken.core.maths import Vec3
from kraken.core.maths.xfo import Xfo, xfoFromDirAndUpV, aimAt
from kraken.core.maths.rotation_order import RotationOrder
from kraken.core.maths.constants import *

from kraken.core.objects.components.base_example_component import BaseExampleComponent

from kraken.core.objects.attributes.attribute_group import AttributeGroup
from kraken.core.objects.attributes.scalar_attribute import ScalarAttribute
from kraken.core.objects.attributes.bool_attribute import BoolAttribute
from kraken.core.objects.attributes.string_attribute import StringAttribute
from kraken.core.objects.attributes.integer_attribute import IntegerAttribute

from kraken.core.objects.constraints.pose_constraint import PoseConstraint

from kraken.core.objects.component_group import ComponentGroup
from kraken.core.objects.hierarchy_group import HierarchyGroup
from kraken.core.objects.transform import Transform
from kraken.core.objects.joint import Joint
from kraken.core.objects.space import Space
from kraken.core.objects.control import Control
from kraken.core.objects.transform import Transform

from kraken.core.objects.operators.kl_operator import KLOperator

from kraken.core.profiler import Profiler
from kraken.helpers.utility_methods import logHierarchy

from OSS.OSS_control import *
from OSS.OSS_component import OSS_Component


COMPONENT_NAME = "foot"

class OSSFootComponent(OSS_Component):
    """Foot Component"""

    def __init__(self, name=COMPONENT_NAME, parent=None):

        super(OSSFootComponent, self).__init__(name, parent)

        # ===========
        # Declare IO
        # ===========
        # Declare Inputs Xfos

        # Declare Output Xfos
        self.foot_cmpOut = self.createOutput('foot', dataType='Xfo', parent=self.outputHrcGrp).getTarget()
        self.ball_cmpOut = self.createOutput('ball', dataType='Xfo', parent=self.outputHrcGrp).getTarget()
        self.ballEnd_cmpOut = self.createOutput('ballEnd', dataType='Xfo', parent=self.outputHrcGrp).getTarget()
        self.ikgoal_cmpOut = self.createOutput('ikgoal', dataType='Xfo', parent=self.outputHrcGrp).getTarget()

        # Declare Input Attrs

        # Declare Output Attrs
        self.ikBlend_cmpOutAttr = self.createOutput('ikBlend', dataType='Float', value=0.0, parent=self.cmpOutputAttrGrp).getTarget()
        self.softIK_cmpOutAttr = self.createOutput('softIK', dataType='Float', value=0.0, parent=self.cmpOutputAttrGrp).getTarget()
        self.squash_cmpOutAttr = self.createOutput('squash', dataType='Float', value=0.0, parent=self.cmpOutputAttrGrp).getTarget()
        self.stretch_cmpOutAttr = self.createOutput('stretch', dataType='Float', value=0.0, parent=self.cmpOutputAttrGrp).getTarget()


class OSSFootComponentGuide(OSSFootComponent):
    """Foot Component Guide"""

    def __init__(self, name=COMPONENT_NAME, parent=None):

        Profiler.getInstance().push("Construct Foot Guide Component:" + name)
        super(OSSFootComponentGuide, self).__init__(name, parent)

        # =========
        # Controls
        # ========

        # Guide Settings
        self.addPartialJoints = BoolAttribute('addPartialJoints', value=False, parent=self.guideSettingsAttrGrp)

        self.ikHandleSizeInputAttr = ScalarAttribute('ikHandleSize', value=1, minValue=0.0,   maxValue=50.0, parent=self.guideSettingsAttrGrp)
        # Maybe we can make this an option, to have the heel as fk or channels on the main ik ctrl
        #self.heelOffsetAsChannelsAttr = BoolAttribute('heelOffsetAsChannels', value=False, parent=self.guideSettingsAttrGrp)

        # Guide Controls
        # Guide Controls must have a consistent and unique name so that their data can be set and stored regardless of config settings
        self.footName = StringAttribute('footName', value="foot", parent=self.guideSettingsAttrGrp)
        self.ballName = StringAttribute('ballName', value="ball", parent=self.guideSettingsAttrGrp)
        self.heelName = StringAttribute('heelName', value="heel", parent=self.guideSettingsAttrGrp)


        self.digit3SegmentNames = StringAttribute('Digit3SegmentNames', value="index middle ring pinky", parent=self.guideSettingsAttrGrp)
        self.digit2SegmentNames = StringAttribute('Digit2SegmentNames', value="thumb", parent=self.guideSettingsAttrGrp)
        self.digit1SegmentNames = StringAttribute('Digit1SegmentNames', value="", parent=self.guideSettingsAttrGrp)


        self.digit3SegmentNames.setValueChangeCallback(self.updateDigit3SegmentControls)
        self.digit2SegmentNames.setValueChangeCallback(self.updateDigit2SegmentControls)
        self.digit1SegmentNames.setValueChangeCallback(self.updateDigit1SegmentControls)

        self.digit3SegmentCtrls = []
        self.digit2SegmentCtrls = []
        self.digit1SegmentCtrls = []


        self.footCtrl = Control(self.getName(), parent=self.ctrlCmpGrp, shape="sphere")
        self.pivotCtrl = Control("pivot", parent=self.ctrlCmpGrp, shape="circle")  #don't set metaData here
        self.ballFKCtrl = Control('ball', parent=self.ctrlCmpGrp, shape="sphere")
        self.ballTipCtrl = Control('ballTip', parent=self.ctrlCmpGrp, shape="sphere")
        self.heelPivotCtrl = Control('heelPivot', parent=self.ctrlCmpGrp, shape="sphere")
        self.ballTipPivotCtrl = Control('ballTipPivot', parent=self.ctrlCmpGrp, shape="sphere")
        self.innerPivotCtrl = Control('innerPivot', parent=self.ctrlCmpGrp, shape="sphere")
        self.outerPivotCtrl = Control('outerPivot', parent=self.ctrlCmpGrp, shape="sphere")
        self.handleCtrl = Control('handle', parent=self.ctrlCmpGrp, shape="jack")


        data = {
                "name": name,
                "location": "L",
                "footXfo": Xfo(Vec3(1.85, 1.2, -1.2)),
                "pivotXfo": Xfo(Vec3(1.85, 0.0, 0.25)),
                "ballXfo": Xfo(Vec3(1.85, 0.4, 0.25)),
                "ballTipXfo": Xfo(Vec3(1.85, 0.4, 1.5)),
                "heelPivotXfo": Xfo(Vec3(1.85, 0.0, -1.6)),
                "ballTipPivotXfo": Xfo(Vec3(1.85, 0.0, 1.5)),
                "innerPivotXfo": Xfo(Vec3(1., 0.0, 0.25)),
                "outerPivotXfo": Xfo(Vec3(2.67, 0.0, 0.25)),
                "handleXfo" : Xfo(Vec3(1.85, 0.0, -1.6)),
               }

        
        self.loadData(data)

        Profiler.getInstance().pop()

    # ==========
    # Callbacks
    # ==========
    def updateNumDigitsControls(self, numSegments, controlsList, digitNames):
        """Load a saved guide representation from persisted data.

        Arguments:
        numDigits -- object, The number of ball/toes

        Return:
        True if successful.

        """

        self.controlXforms = []

        # Store current values if guide controls already exist
        current = 0
        for i, ctrl in enumerate(controlsList):

            if ctrl.getParent() is self.ballFKCtrl:
                self.controlXforms.append([ctrl.xfo])
                current = len(self.controlXforms) -1
            else:
                self.controlXforms[current].append(ctrl.xfo)


        # Delete current controls
        for ctrl in reversed(controlsList):
            ctrl.getParent().removeChild(ctrl)
        del controlsList[:]

        # Lets build all new digits
        digitNameList = getDigitNameList(digitNames)

        if not digitNameList:  # Nothing to build
            return True

        segments = ["ball", "base", "mid", "tip", "end"]
        if numSegments == 2:
            segments.remove("mid")
        elif numSegments == 1:
            segments.remove("mid")
            segments.remove("tip")

        offset = 0.0
        for i, digitName in enumerate(digitNameList):
            parent = self.ballFKCtrl
            for j, segment in enumerate(segments):
                newCtrl = Control(digitName+"_"+segment, parent=parent, shape="squarePointed")
                newCtrl.rotatePoints(0,0,90)
                #newCtrl.scalePoints(Vec3(0.25, 0.25, 0.25))
                if j == 0:
                    newCtrl.xfo = parent.xfo.multiply(Xfo(Vec3(2, 0.0, -offset)))
                    offset += 2.0
                else:
                    newCtrl.xfo = parent.xfo.multiply(Xfo(Vec3(2.0, 0.0, 0.0)))

                controlsList.append(newCtrl)
                parent = newCtrl

                if i < len(self.controlXforms):
                    if j < len(self.controlXforms[i]):
                        newCtrl.xfo = self.controlXforms[i][j]
        return True


    def updateDigit3SegmentControls(self, digitNames):
        self.updateNumDigitsControls(3, self.digit3SegmentCtrls, digitNames)

    def updateDigit2SegmentControls(self, digitNames):
        self.updateNumDigitsControls(2, self.digit2SegmentCtrls, digitNames)

    def updateDigit1SegmentControls(self, digitNames):
        self.updateNumDigitsControls(1, self.digit1SegmentCtrls, digitNames)


    # =============
    # Data Methods
    # =============
    def saveData(self):
        """Save the data for the component to be persisted.


        Return:
        The JSON data object

        """

        data = super(OSSFootComponentGuide, self).saveData()

        # this should live in the GuideClase - also should considere Inherited Types
        data = self.saveAllObjectData(data, "Control")
        data = self.saveAllObjectData(data, "Transform")

        for ctrlListName in ["digit3SegmentCtrls", "digit2SegmentCtrls", "digit1SegmentCtrls"]:
            ctrls = getattr(self, ctrlListName)
            xfos = []
            for i in xrange(len(ctrls)):
                xfos.append(ctrls[i].xfo)
            data[ctrlListName+"Xfos"] = xfos


        return data



    def loadData(self, data):
        """Load a saved guide representation from persisted data.

        Arguments:
        data -- object, The JSON data object.

        Return:
        True if successful.

        """
        #Grab the guide settings in case we want to use them here (and are not stored in data arg)
        existing_data = self.saveData()
        existing_data.update(data)
        data = existing_data


        globalScale = self.globalComponentCtrlSizeInputAttr.getValue()
        globalScaleVec =Vec3(globalScale, globalScale, globalScale)

        #Reset all shapes, but really we should just recreate all controls from loadData instead of init
        for ctrl in self.getHierarchyNodes(classType="Control"):
            ctrl.setShape(ctrl.getShape())
            ctrl.scalePoints(globalScaleVec)

        #saveData() will grab the guide settings values (and are not stored in data arg)
        existing_data = self.saveData()
        existing_data.update(data)
        data = existing_data


        globalScale = self.globalComponentCtrlSizeInputAttr.getValue()
        self.globalScaleVec =Vec3(globalScale, globalScale, globalScale)

        super(OSSFootComponentGuide, self).loadData( data )

        self.loadAllObjectData(data, "Control")
        self.loadAllObjectData(data, "Transform")
        self.handleCtrl.scalePoints(Vec3(data["ikHandleSize"], data["ikHandleSize"], data["ikHandleSize"]))

        for ctrlListName in ["digit3SegmentCtrls", "digit2SegmentCtrls", "digit1SegmentCtrls"]:
            ctrls = getattr(self, ctrlListName)
            if ctrlListName+"Xfos" in data.keys():
                for i in xrange(len(data[ctrlListName+"Xfos"])):
                    if i < len(ctrls):
                        ctrls[i].xfo = data[ctrlListName+"Xfos"][i]
                        ctrls[i].scalePoints(self.globalScaleVec)

        return True





    def getRigBuildData(self):
        """Returns the Guide data used by the Rig Component to define the layout of the final rig..

        Return:
        The JSON rig data object.

        """

        data = super(OSSFootComponentGuide, self).getRigBuildData()

        # TODO: make this a property of the component
        self.boneAxisStr = "POSX"
        if self.getLocation() == 'R':
            self.boneAxisStr = "NEGX"
        self.boneAxis = AXIS_NAME_TO_TUPLE_MAP[self.boneAxisStr]

        self.upAxisStr = "POSZ"
        if self.getLocation() == 'R':
            self.upAxisStr = "NEGZ"
        self.upAxis = AXIS_NAME_TO_TUPLE_MAP[self.upAxisStr]


        # Values

        footPosition = self.footCtrl.xfo.tr
        ballPosition = self.ballFKCtrl.xfo.tr
        ballTipPosition = self.ballTipCtrl.xfo.tr
        heelPivotPosition = self.heelPivotCtrl.xfo.tr
        ballTipPivotPosition = self.ballTipPivotCtrl.xfo.tr
        innerPivotPosition = self.innerPivotCtrl.xfo.tr
        outerPivotPosition = self.outerPivotCtrl.xfo.tr


        pivotXfo = self.pivotCtrl.xfo
        # Get lengths
        footLen = footPosition.subtract(ballPosition).length()
        ballLen = ballPosition.subtract(ballTipPosition).length()

        footXfo = Xfo()
        footXfo.tr = footPosition

        heelPivotXfo = Xfo()
        heelPivotXfo.tr = heelPivotPosition

        ballTipPivotXfo = Xfo()
        ballTipPivotXfo.tr = ballTipPivotPosition

        innerPivotXfo = Xfo()
        innerPivotXfo.tr = innerPivotPosition

        outerPivotXfo = Xfo()
        outerPivotXfo.tr = outerPivotPosition

        # Calculate Foot Xfo
        footToBall = ballPosition.subtract(footPosition).unit()

        ballXfo = Xfo(self.ballFKCtrl.xfo)
        ballPivotXfo = Xfo(ballXfo)

        aimAt(heelPivotXfo, aimPos=ballTipPivotPosition, upPos=footPosition, aimAxis=(0, 0, 1), upAxis=(0, 1, 0))
        # In the complete guide system, have live constraint for ball upvec, this assumes foot is higher than ball
        aimAt(ballXfo, aimPos=ballTipPosition, upPos=footPosition, aimAxis=self.boneAxis, upAxis=self.upAxis)
        # Same here
        aimAt(footXfo, aimPos=ballXfo.tr, upPos=ballTipPosition, aimAxis=self.boneAxis, upAxis=self.upAxis)

        heelXfo = Xfo(ballXfo)
        #aimAt(heelXfo, aimPos=footPosition, upPos=ballTipPosition, aimAxis=self.boneAxis, upAxis=self.upAxis)

        ballTipXfo = Xfo(self.ballTipCtrl.xfo)
        ballTipXfo.ori = ballXfo.ori

        
        ballTipPivotXfo.ori = heelPivotXfo.ori
        innerPivotXfo.ori = heelPivotXfo.ori
        outerPivotXfo.ori = heelPivotXfo.ori
        ballPivotXfo.ori = heelPivotXfo.ori

        handleXfo = self.handleCtrl.xfo
        # Not great.  This assumes that guide ctrl has been mirrored from left side
        # Another case where the guide system should feed in correct values
        # Fix how Kraken mirrors guides!!!
        #if self.getLocation() == 'R':
        #    handleXfo.ori = handleXfo.ori.mirror(0)

        # ===============
        # Calculate Xfos
        # ===============

        # setting Values by Object Type
        data = self.saveAllObjectData(data, "Control")
        data = self.saveAllObjectData(data, "Transform")

        # setting Values Directly
        data['footXfo']         = footXfo
        data['ballXfo']         = ballXfo
        data['ballTipXfo']      = ballTipXfo
        data['heelXfo']         = heelXfo #from ball to foot
        data['pivotXfo']        = pivotXfo #from ball to foot
        data['footLen']         = footLen
        data['ballLen']         = ballLen
        data['heelPivotXfo']    = heelPivotXfo
        data['ballPivotXfo']    = ballPivotXfo
        data['ballTipPivotXfo'] = ballTipPivotXfo
        data['innerPivotXfo']   = innerPivotXfo
        data['outerPivotXfo']   = outerPivotXfo
        data['handleXfo']       = handleXfo

        for ctrlListName in ["digit3SegmentCtrls", "digit2SegmentCtrls", "digit1SegmentCtrls"]:
            ctrls = getattr(self, ctrlListName)
            xfos = []
            for i in xrange(len(ctrls)):
                xfos.append(ctrls[i].xfo)
            data[ctrlListName+"Xfos"] = xfos

        return data

    # ==============
    # Class Methods
    # ==============
    @classmethod
    def getComponentType(cls):
        """Enables introspection of the class prior to construction to determine if it is a guide component.

        Return:
        The true if this component is a guide component.

        """

        return 'Guide'

    @classmethod
    def getRigComponentClass(cls):
        """Returns the corresponding rig component class for this guide component class

        Return:
        The rig component class.

        """

        return OSSFootComponentRig


class OSSFootComponentRig(OSSFootComponent):
    """Foot Component"""

    def __init__(self, name=COMPONENT_NAME, parent=None):

        Profiler.getInstance().push("Construct Leg Rig Component:" + name)
        super(OSSFootComponentRig, self).__init__(name, parent)

    # =============
    # Data Methods
    # =============



    def createControls(self, numSegments, digitNames, data):

        digitNameList = getDigitNameList(digitNames)

        segments = ["ball", "base", "mid", "tip", "end"]
        if numSegments == 2:
            segments.remove("mid")
        elif numSegments == 1:
            segments.remove("mid")
            segments.remove("tip")

        globalScale = Vec3(data['globalComponentCtrlSize'], data['globalComponentCtrlSize'], data['globalComponentCtrlSize'])

        self.footCtrl.xfo.ori.getZaxis()




        for i, digitName in enumerate(digitNameList):
            parent = self.ball_cmpOut
            defParent = self.ballDef
            digiSegCtrls = []
            digiSegDefs = []
            for j, segment in enumerate(segments):
                #Eventually, we need outputs and ports for this component for each digit segment
                #spineOutput = ComponentOutput(digitName+"_"+segment, parent=self.outputHrcGrp)

                if segment == "end":
                    continue  # don't create control for end (but we need it to loop through control positions correctly)
                digiSegCtrl = FKControl(digitName+"_"+segment, parent=parent, shape="squarePointed")
                digiSegCtrl.ro = RotationOrder(ROT_ORDER_STR_TO_INT_MAP["XZY"])  #Set with component settings later
                digiSegCtrl.rotatePoints(0,0,90)
                digiSegCtrl.scalePoints(globalScale)
                digiSegCtrls.append(digiSegCtrl)

                digiSegDef = Joint(digitName+"_"+segment, parent=defParent)
                digiSegDef.setComponent(self)
                digiSegDefs.append(digiSegDef)

                defParent = digiSegDef

                parent = digiSegCtrl
                ctrlListName = "digit"+str(numSegments)+"SegmentCtrls"

                if (ctrlListName+"Xfos") in data.keys():

                    index = i*len(segments) + j

                    if (i*numSegments + j) < len(data[ctrlListName+"Xfos"]):
                        digiSegCtrl.xfo = data[ctrlListName+"Xfos"][index]

            #Aim Control at ch`ild
            for j in range(len(digiSegCtrls)):
                if j == 0:
                    upVectorAxisStr = self.upAxisStr[-1]
                    upVectorFunction = getattr(digiSegCtrls[j].xfo.ori, "get"+upVectorAxisStr+"axis")
                    upVector = upVectorFunction()
                    if self.upAxisStr.startswith("NEG"):
                        upVector = upVector.negate()

                # if j == len(digiSegCtrls) - 1:
                #     digiSegCtrls[j].xfo.ori = digiSegCtrls[j-1].xfo.ori
                # else:
                #     aimAt(digiSegCtrls[j].xfo, aimPos=digiSegCtrls[j+1].xfo.tr, upVector=upVector, aimAxis=self.boneAxis, upAxis=self.upAxis)

                digiSegCtrls[j].insertSpace()
                digiSegDefs[j].constrainTo(digiSegCtrls[j]).evaluate()

                if self.addPartialJoints:
                    twistXfo = self.createOutput(digiSegDefs[j].getName()+"_partial", dataType='Xfo', parent=self.outputHrcGrp).getTarget()
                    twistXfo.xfo = digiSegDefs[j].xfo
                    twistXfo.constrainTo(digiSegDefs[j].getParent(), maintainOffset=True)
                    self.createPartialJoint(digiSegDefs[j], baseTranslate=twistXfo, baseRotate=twistXfo, parent=digiSegDefs[j].getParent())



        return True



    def loadData(self, data=None):
        """Load a saved guide representation from persisted data.

        Arguments:
        data -- object, The JSON data object.

        Return:
        True if successful.

        """

        super(OSSFootComponentRig, self).loadData( data )

        self.footName = data['footName']
        self.ballName = data['ballName']
        self.heelName = data['heelName']
        self.addPartialJoints = bool(data['addPartialJoints'])  #This should be a simple method instead


        # =========
        # Controls
        # =========


        # IK Handle
        self.handleCtrl = IKControl(self.footName, parent=self.ctrlCmpGrp, shape="jack")
        self.handleCtrl.ro = RotationOrder(ROT_ORDER_STR_TO_INT_MAP["ZXY"])  #Set with component settings later careful when combining with foot!
        self.handleSpace = self.handleCtrl.insertSpace(name=self.footName + "_ik")

        # FK Foot
        self.footCtrl = FKControl(self.footName, parent=self.ctrlCmpGrp, shape="cube")
        self.footCtrl.ro = RotationOrder(ROT_ORDER_STR_TO_INT_MAP["ZYX"])  #Set with component settings later
        self.footSpace = self.footCtrl.insertSpace(name=self.footName +"_fk") #avoid name clash with ik spacectrl

        # IK Heel
        self.heelCtrl = IKControl(self.heelName, parent=self.ctrlCmpGrp, shape="cube")
        self.heelCtrl.ro = RotationOrder(ROT_ORDER_STR_TO_INT_MAP["ZYX"])  #Set with component settings later
        self.heelSpace = self.heelCtrl.insertSpace()

        # FK Ball
        self.ballFKCtrl = FKControl(self.ballName, parent=self.footCtrl, shape="cube")
        self.ballFKCtrl.ro = RotationOrder(ROT_ORDER_STR_TO_INT_MAP["ZYX"])  #Set with component settings later
        self.ballFKSpace = self.ballFKCtrl.insertSpace()

        # IK Ball
        self.ballIKCtrl = IKControl(self.ballName, parent=self.footCtrl, shape="cube")
        self.ballIKCtrl.ro = RotationOrder(ROT_ORDER_STR_TO_INT_MAP["ZYX"])  #Set with component settings later
        self.ballIKSpace = self.ballIKCtrl.insertSpace()

        self.heelIKCtrl_footTransform = Transform(self.heelName + '_foot_transform', parent=self.heelCtrl)

        self.pivotCtrl = Control(self.getName(), parent=self.handleCtrl, shape="circle", metaData={"altType": "PivotControl"})
        self.pivotCtrl.ro = RotationOrder(ROT_ORDER_STR_TO_INT_MAP["ZYX"])  #Set with component settings later
        self.pivotCtrl.scalePoints(Vec3(2,2,2))
        self.pivotSpace = self.pivotCtrl.insertSpace()

        # Rig Ref objects

        # Add Component Params to IK control
        self.handleCtrlAttrGrp = AttributeGroup("DisplayInfo_FootSettings", parent=self.handleCtrl)
        self.ikBlendAttr = ScalarAttribute('ikBlend', value=0.0, minValue=0.0, maxValue=1.0, parent=self.handleCtrlAttrGrp)
        self.ikBlend_cmpOutAttr.connect(self.ikBlendAttr)

        self.heelCtrl.getVisibilityAttr().connect(self.ikBlendAttr, lock=True)
        self.ballIKCtrl.getVisibilityAttr().connect(self.ikBlendAttr, lock=True)
        self.pivotCtrl.getVisibilityAttr().connect(self.ikBlendAttr, lock=True)


        self.footIKAttr = ScalarAttribute(self.footName + 'IK', value=0.0, minValue=0.0, maxValue=1.0, parent=self.handleCtrlAttrGrp)
        footRockerAttr = ScalarAttribute(self.footName + 'Rocker', value=0.0, minValue=-180.0, maxValue=180.0, parent=self.handleCtrlAttrGrp)
        ballBreakAttr = ScalarAttribute(self.ballName+ 'Break', value=45.0, minValue=0, maxValue=90.0, parent=self.handleCtrlAttrGrp)

        # Add a component setting option to add these channels later...
        #footBendAttr = ScalarAttribute('footBend', value=0.0, minValue=-180, maxValue=180.0, parent=self.handleCtrlAttrGrp)
        #footTiltAttr = ScalarAttribute('footTilt', value=0.0, minValue=-180, maxValue=180.0, parent=self.handleCtrlAttrGrp)
        #footSwivelAttr = ScalarAttribute('footSwivel', value=0.0, minValue=-180, maxValue=180.0, parent=self.handleCtrlAttrGrp)

        #ballBendAttr = ScalarAttribute('ballBend', value=0.0, minValue=-180, maxValue=180.0, parent=self.handleCtrlAttrGrp)
        #ballTwistAttr = ScalarAttribute('ballTwist', value=0.0, minValue=-180, maxValue=180.0, parent=self.handleCtrlAttrGrp)
        #ballSwivelAttr = ScalarAttribute('ballSwivel', value=0.0, minValue=-180, maxValue=180.0, parent=self.handleCtrlAttrGrp)

        self.softIKAttr = ScalarAttribute('softIK', value=0.0, minValue=0.0, parent=self.handleCtrlAttrGrp)
        self.softIK_cmpOutAttr.connect(self.softIKAttr)
        self.squashAttr = ScalarAttribute('squash', value=0.0, minValue=0.0, maxValue=1.0, parent=self.handleCtrlAttrGrp)
        self.squash_cmpOutAttr.connect(self.squashAttr)
        self.stretchAttr = ScalarAttribute('stretch', value=0.0, minValue=0.0, maxValue=1.0, parent=self.handleCtrlAttrGrp)
        self.stretch_cmpOutAttr.connect(self.stretchAttr)

        # Don't want this stuff displayed for animators, maybe create this and hide in channelBox later
        #drawDebugAttr = BoolAttribute('drawDebug', value=False, parent=self.handleCtrlAttrGrp)
        #self.drawDebugInputAttr.connect(drawDebugAttr)


        self.connectReverse(self.footIKAttr, self.footCtrl.getVisibilityAttr())
        self.connectReverse(self.footIKAttr, self.ballFKCtrl.getVisibilityAttr())

        self.heelCtrl.getVisibilityAttr().connect(self.footIKAttr)
        self.ballIKCtrl.getVisibilityAttr().connect(self.footIKAttr)
        self.pivotCtrl.getVisibilityAttr().connect(self.footIKAttr)


        self.ikGoalRefTransform = Transform(self.footName + 'ikGoalRef', parent=self.handleCtrl)

        # =========
        # Nulls for foot pivot
        # =========
        self.ballJointTransform = Transform(self.ballName+ 'Joint', parent=self.handleCtrl)
        self.footJointTransform = Transform(self.footName + 'Joint', parent=self.handleCtrl)
        self.heelPivotTransform = Transform(self.heelName + 'Pivot', parent=self.handleCtrl)
        self.ballPivotTransform = Transform(self.ballName+ 'Pivot', parent=self.handleCtrl)
        self.ballTipPivotTransform = Transform(self.ballName+ 'TipPivot', parent=self.handleCtrl)
        self.innerPivotTransform = Transform(self.footName + 'InnerPivot', parent=self.handleCtrl)
        self.outerPivotTransform = Transform(self.footName + 'OuterPivot', parent=self.handleCtrl)


        # ==========
        # Deformers
        # ==========

        self.footDef = Joint(self.footName, parent=self.deformersLayer)
        self.footDef.setComponent(self)
        self.footDef.constrainTo(self.foot_cmpOut)
        self.foot_cmpOut.parentJoint =  self.footDef


        self.ballDef = Joint(self.ballName, parent=self.footDef)
        self.ballDef.setComponent(self)
        self.ballDef.constrainTo(self.ball_cmpOut)
        self.ball_cmpOut.parentJoint =  self.ballDef

        self.ballEndDef = Joint(self.ballName + 'End', parent=self.ballDef)
        self.ballEndDef.setComponent(self)
        self.ballEndDef.constrainTo(self.ballEnd_cmpOut)
        self.ballEnd_cmpOut.parentJoint =  self.ballEndDef

        self.parentSpaceInputTgt.childJoints = [self.footDef]



        # ==============
        # Constrain I/O
        # ==============
        # Constraint inputs

        self.handleSpaceConstraint = self.handleSpace.constrainTo(self.globalSRTInputTgt, maintainOffset=True)
        self.footSpaceConstraint = self.footSpace.constrainTo(self.parentSpaceInputTgt, maintainOffset=True)

        # Constraint outputs
        self.ikgoal_cmpOutConstraint = self.ikgoal_cmpOut.constrainTo(self.heelIKCtrl_footTransform, maintainOffset=False)


        # ===============
        # Add KL Ops
        # ===============

        # Add FootRocker KL Op
        self.footRockerKLOp = KLOperator(self.getName(), 'OSS_FootRockerSystem', 'OSS_Kraken')
        self.addOperator(self.footRockerKLOp)
        # Add Att Inputs
        self.footRockerKLOp.setInput('drawDebug', self.drawDebugInputAttr)
        self.footRockerKLOp.setInput('rigScale', self.rigScaleInputAttr)
        #self.footRockerKLOp.setInput('rightSide', self.getLocation() == 'R')
        self.footRockerKLOp.setInput('footRocker', footRockerAttr)
        self.footRockerKLOp.setInput('ballBreak', ballBreakAttr)

        #self.footRockerKLOp.setInput('footBend', footBendAttr)
        #self.footRockerKLOp.setInput('footTilt', footTiltAttr)
        #self.footRockerKLOp.setInput('footSwivel', footSwivelAttr)

        #self.footRockerKLOp.setInput(self.ballName+ 'Bend', ballBendAttr)
        #self.footRockerKLOp.setInput(self.ballName+ 'Twist', ballTwistAttr)
        #self.footRockerKLOp.setInput(self.ballName+ 'Swivel', ballSwivelAttr)

        # Add Xfo Inputs

        self.footRockerKLOp.setInput('pivot', self.pivotCtrl)
        self.footRockerKLOp.setInput('pivotSpace', self.pivotSpace)
        self.footRockerKLOp.setInput('ikCtrl', self.ikGoalRefTransform)
        self.footRockerKLOp.setInput('heelPivot', self.heelPivotTransform)
        self.footRockerKLOp.setInput('ballPivot', self.ballPivotTransform)
        self.footRockerKLOp.setInput('tipPivot', self.ballTipPivotTransform)
        self.footRockerKLOp.setInput('footJointLoc', self.footJointTransform)
        self.footRockerKLOp.setInput('ballJointLoc', self.ballJointTransform)
        self.footRockerKLOp.setInput('innerPivotLoc', self.innerPivotTransform)
        self.footRockerKLOp.setInput('outerPivotLoc', self.outerPivotTransform)
        # Add Xfo Outputs
        #self.legEndXfo_cmpOut = self.createOutput('legEndXfo', dataType='Xfo', parent=self.outputHrcGrp).getTarget()
        self.footRockerFoot_out = Transform(self.footName + 'Rocker' + self.footName + '_out', parent=self.outputHrcGrp)
        self.footRockerBall_out = Transform(self.footName + self.ballName.capitalize() + '_out', parent=self.outputHrcGrp)
        #self.footRockerKLOp.setOutput('ikGoal', self.ikgoal_cmpOut)
        self.footRockerKLOp.setOutput('footJoint', self.footRockerFoot_out)
        self.footRockerKLOp.setOutput('ballJoint', self.footRockerBall_out)


        self.ballIKSpace.setParent(self.footRockerBall_out)
        self.heelSpace.setParent(self.footRockerFoot_out)


        # Wait, can this be a hier blend op?  Don't like having this explicit OSS_IKFootBlendSolver Op
        # Add Foot Blend KL Op, no footBlend puts the position of the fk always at the ikOSS_IKFootBlendSolver Op pos, so maybe another kind of network
        self.IKFootBlendKLOp = KLOperator(self.footName +"_blend", 'OSS_IKFootBlendSolver', 'OSS_Kraken')
        self.addOperator(self.IKFootBlendKLOp)
        # Add Att Inputs
        self.IKFootBlendKLOp.setInput('drawDebug', self.drawDebugInputAttr)
        self.IKFootBlendKLOp.setInput('rigScale', self.rigScaleInputAttr)
        self.IKFootBlendKLOp.setInput('blend', self.footIKAttr)
        # Add Xfo Inputs)
        self.IKFootBlendKLOp.setInput('ikFoot', self.heelIKCtrl_footTransform)
        self.IKFootBlendKLOp.setInput('fkFoot', self.footCtrl)
        self.IKFootBlendKLOp.setInput('ikBall', self.ballIKCtrl)
        self.IKFootBlendKLOp.setInput('fkBall', self.ballFKCtrl)
        # Add Xfo Outputs
        self.IKFootBlendKLOpFoot_out = Transform('IK' + self.footName.capitalize() + 'BlendKLOp' + self.footName.capitalize() + '_out', parent=self.outputHrcGrp)
        self.IKFootBlendKLOpBall_out = Transform('IK' + self.footName.capitalize() + 'BlendKLOp' + self.ballName.capitalize() + '_out', parent=self.outputHrcGrp)
        self.IKFootBlendKLOp.setOutput('foot', self.IKFootBlendKLOpFoot_out)
        self.IKFootBlendKLOp.setOutput('ball', self.IKFootBlendKLOpBall_out)

        # Add Deformer Joint Constrain




        self.mocap = bool(data["mocap"])

        # TODO: make this a property of the component
        self.boneAxisStr = "POSX"
        if self.getLocation() == 'R':
            self.boneAxisStr = "NEGX"
        self.boneAxis = AXIS_NAME_TO_TUPLE_MAP[self.boneAxisStr]

        self.upAxisStr = "POSZ"
        if self.getLocation() == 'R':
            self.upAxisStr = "NEGZ"
        self.upAxis = AXIS_NAME_TO_TUPLE_MAP[self.upAxisStr]


        self.handleCtrl.xfo = data['handleXfo']
        self.handleSpace.xfo = self.handleCtrl.xfo

        self.footCtrl.xfo = data['footXfo']
        self.footCtrl.alignOnXAxis()
        self.footCtrl.scalePointsOnAxis(data['footLen'], self.boneAxisStr)
        self.footSpace.xfo = self.footCtrl.xfo

        self.pivotCtrl.xfo = data['pivotXfo']
        self.pivotSpace.xfo = self.pivotCtrl.xfo

        self.heelCtrl.xfo = data['heelXfo']
        self.heelCtrl.alignOnXAxis()
        self.heelCtrl.scalePointsOnAxis(-data['footLen'], self.boneAxisStr)
        self.heelSpace.xfo = self.heelCtrl.xfo

        self.ballFKCtrl.xfo = data['ballXfo']
        self.ballFKCtrl.alignOnXAxis()
        self.ballFKCtrl.scalePointsOnAxis(data['ballLen'], self.boneAxisStr)
        self.ballFKSpace.xfo = self.ballFKCtrl.xfo

        self.ballIKCtrl.xfo = data['ballXfo']
        self.ballIKCtrl.alignOnXAxis()
        self.ballIKCtrl.scalePointsOnAxis(data['ballLen'], self.boneAxisStr)
        self.ballIKSpace.xfo = self.ballIKCtrl.xfo

        # The foot in relation to the heel control offset
        self.heelIKCtrl_footTransform.xfo = data['footXfo']


        self.ikGoalRefTransform.xfo = data['handleXfo']

        self.footRockerKLOp.setInput('rightSide', self.getLocation() == 'R')

        if self.getLocation() == "R":
            pass
            #self.legIKCtrl.rotatePoints(0, 90, 0)
            #self.legIKCtrl.translatePoints(Vec3(-1.0, 0.0, 0.0))
        else:
            pass
            #self.legIKCtrl.rotatePoints(0, -90, 0)
            #self.legIKCtrl.translatePoints(Vec3(1.0, 0.0, 0.0))


        self.footOutputTgtConstraint = self.foot_cmpOut.constrainTo(self.IKFootBlendKLOpFoot_out)
        self.ballOutputTgtConstraint = self.ball_cmpOut.constrainTo(self.IKFootBlendKLOpBall_out)





        self.parentSpaceInputTgt.xfo = data["footXfo"]
        self.parentSpaceInputTgt.xfo.ori = Xfo(data["heelPivotXfo"]).ori

        self.ballJointTransform.xfo = data["ballXfo"]
        self.footJointTransform.xfo = data["footXfo"]
        self.heelPivotTransform.xfo = data["heelPivotXfo"]
        self.ballTipPivotTransform.xfo = data["ballTipPivotXfo"]
        self.innerPivotTransform.xfo = data["innerPivotXfo"]
        self.outerPivotTransform.xfo = data["outerPivotXfo"]
        self.ballPivotTransform.xfo = data["ballPivotXfo"]



        self.createControls(3, data["Digit3SegmentNames"], data)
        self.createControls(2, data["Digit2SegmentNames"], data)
        self.createControls(1, data["Digit1SegmentNames"], data)



        # ====================
        # Evaluate Fabric Ops
        # ====================
        # Eval Operators # Order is important
        self.evalOperators()
        # ====================
        # Evaluate Output Constraints (needed for building input/output connection constraints in next pass)
        # ====================
        # Evaluate the *output* constraints to ensure the outputs are now in the correct location.
        # Don't eval *input* constraints because they should all have maintainOffset on and get evaluated at the end during build()
        self.footOutputTgtConstraint.evaluate()
        self.ballOutputTgtConstraint.evaluate()

         #constrain after eval and with
        self.ballEnd_cmpOut.xfo = data["ballTipXfo"]
        self.ballEndOutputTgtConstraint = self.ballEnd_cmpOut.constrainTo(self.ball_cmpOut, maintainOffset=True)

        #JSON data at this point is generated by guide rig and passed to this rig, should include all defaults+loaded info
        globalScale = Vec3(data['globalComponentCtrlSize'], data['globalComponentCtrlSize'], data['globalComponentCtrlSize'])

        self.pivotCtrl.scalePoints(Vec3(data['globalComponentCtrlSize'], data['globalComponentCtrlSize'], data['globalComponentCtrlSize']))
        self.footCtrl.scalePoints(Vec3(1.0, data['globalComponentCtrlSize'], data['globalComponentCtrlSize']))
        self.ballFKCtrl.scalePoints(Vec3(1.0, data['globalComponentCtrlSize'], data['globalComponentCtrlSize']))
        self.ballIKCtrl.scalePoints(Vec3(1.0, data['globalComponentCtrlSize'], data['globalComponentCtrlSize']))
        self.heelCtrl.scalePoints(Vec3(1.0, data['globalComponentCtrlSize'], data['globalComponentCtrlSize']))
        self.handleCtrl.scalePoints(globalScale)
        self.handleCtrl.scalePoints(Vec3(data["ikHandleSize"], data["ikHandleSize"], data["ikHandleSize"]))

         # If we remove this, need to update footBlendSolver's translate blend to take leg ikBlend into account
        self.footCtrl.lockTranslation(True, True, True)

        """
        footPlane = Control("TMP", shape="square")
        footPlane.alignOnZAxis()
        footPlane.scalePoints(Vec3(data['globalComponentCtrlSize'], data['globalComponentCtrlSize'], 1.0))
        # Damn, can't get the foot length because it is on another component
        # Can we do this with just inputs?  We'd have to guarantee that everything was in the correct pose first
        #footPlane.scalePointsOnAxis(self.handleCtrl.xfo.tr.subtract(self.ballTipPivotTransform.xfo.tr).length(), "POSZ")
        self.handleCtrl.appendCurveData(footPlane.getCurveData())
        """

        attrs = [attr.getName() for attr in self.handleCtrlAttrGrp._attributes]

        self.tagAllComponentJoints([self.getDecoratedName()] + self.tagNames)


def getDigitNameList(digitNames):
    """ tokenizes string argument, returns a list"""

    digitNameList = re.split(r'[ ,:;]+', digitNames)

    # These checks should actually prevent the component_inspector from closing maybe?
    for name in digitNameList:
        if name and not re.match(r'^[\w_]+$', name):
            # Eventaully specific exception just for component class that display component name, etc.
            raise ValueError("digitNames \""+name+"\" contains non-alphanumeric characters in component \""+self.getName()+"\"")

    digitNameList = [x for x in digitNameList if x != ""]

    if not digitNameList:
        return []

    if len(digitNameList) > len(set(digitNameList)):
        raise ValueError("Duplicate names in digitNames in component \""+self.getName()+"\"")

    return digitNameList


from kraken.core.kraken_system import KrakenSystem
ks = KrakenSystem.getInstance()
ks.registerComponent(OSSFootComponentGuide)
ks.registerComponent(OSSFootComponentRig)