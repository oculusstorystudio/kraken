
import math, re

from kraken.core.maths import Vec3, AXIS_NAME_TO_TUPLE_MAP, AXIS_NAME_TO_INT_MAP
from kraken.core.maths.xfo import Xfo
from kraken.core.maths.rotation_order import RotationOrder
from kraken.core.maths.euler import rotationOrderStrToIntMapping

from kraken.core.objects.components.base_example_component import BaseExampleComponent

from kraken.core.objects.attributes.attribute_group import AttributeGroup
from kraken.core.objects.attributes.bool_attribute import BoolAttribute
from kraken.core.objects.attributes.integer_attribute import IntegerAttribute
from kraken.core.objects.attributes.scalar_attribute import ScalarAttribute
from kraken.core.objects.attributes.string_attribute import StringAttribute

from kraken.core.objects.constraints.pose_constraint import PoseConstraint

from kraken.core.objects.component_group import ComponentGroup
from kraken.core.objects.components.component_output import ComponentOutput
from kraken.core.objects.hierarchy_group import HierarchyGroup
from kraken.core.objects.transform import Transform
from kraken.core.objects.joint import Joint
from kraken.core.objects.ctrlSpace import CtrlSpace
from kraken.core.objects.layer import Layer
from kraken.core.objects.locator import Locator
from kraken.core.objects.control import Control

from kraken.core.objects.operators.kl_operator import KLOperator
from kraken.core.objects.operators.canvas_operator import CanvasOperator

from kraken.core.profiler import Profiler
from kraken.helpers.utility_methods import logHierarchy

from OSS.OSS_control import *
from OSS.OSS_component import OSS_Component

COMPONENT_NAME = "mouth"


class OSSMouth(OSS_Component):
    """Mouth Component Base"""

    def __init__(self, name=COMPONENT_NAME, parent=None):
        super(OSSMouth, self).__init__(name, parent)

        # ===========
        # Declare IO
        # ===========
        # Declare Inputs Xfos

        # Declare Output Xfos
        self.lipOutputTgt = self.createOutput('lip', dataType='Xfo', parent=self.outputHrcGrp).getTarget()
        self.mouthOutputTgt = self.createOutput('mouth', dataType='Xfo', parent=self.outputHrcGrp).getTarget()
        self.mouthEndOutputTgt = self.createOutput('mouthEnd', dataType='Xfo', parent=self.outputHrcGrp).getTarget()

        # Declare Input Attrs


class OSSMouthGuide(OSSMouth):
    """Mouth Component Guide"""

    def __init__(self, name=COMPONENT_NAME, parent=None):

        Profiler.getInstance().push("Construct Mouth Guide Component:" + name)
        super(OSSMouthGuide, self).__init__(name, parent)


        # =========
        # Controls
        # =========
        # Guide Controls
        self.lipCtrlNames = StringAttribute('lipCtrlNames', value="1 Sneer", parent=self.guideSettingsAttrGrp)
        self.numSpansAttr = IntegerAttribute('numSpans', value=13, minValue=0, maxValue=20,  parent=self.guideSettingsAttrGrp)

        self.alignXAttr = IntegerAttribute('alignX', value=2, minValue=-3, maxValue=3,  parent=self.guideSettingsAttrGrp)
        self.alignYAttr = IntegerAttribute('alignY', value=-1, minValue=-3, maxValue=3,  parent=self.guideSettingsAttrGrp)
        self.alignZAttr = IntegerAttribute('alignZ', value=3, minValue=-3, maxValue=3,  parent=self.guideSettingsAttrGrp)

        # midLip
        self.midLipCtrl = Control('midLip', parent=self.ctrlCmpGrp)
        self.midLipCtrl.lockTranslation(x=True, y=False, z=False)
        self.L_midLipHandleCtrl = Control('L_midLipHandle', parent=self.midLipCtrl)
        self.R_midLipHandleCtrl = Control('R_midLipHandle', parent=self.midLipCtrl)
        self.midDummy = Control('midDummy', parent=self.ctrlCmpGrp)

        self.lMouthCtrl = Control('L_Mouth', parent=self.ctrlCmpGrp)
        self.rMouthCtrl = Control('R_Mouth', parent=self.ctrlCmpGrp)

        # upLip
        self.upLipCtrl = Control('upLip', parent=self.ctrlCmpGrp)
        self.upLipCtrl.lockTranslation(x=True, y=False, z=False)
        self.L_upLipHandleCtrl = Control('L_upLipHandle', parent=self.upLipCtrl)
        self.R_upLipHandleCtrl = Control('R_upLipHandle', parent=self.upLipCtrl)
        self.upDummy = Control('upDummy', parent=self.ctrlCmpGrp)

        self.lMouthOutCtrl = Control('L_MouthOut', parent=self.ctrlCmpGrp)
        self.rMouthOutCtrl = Control('R_MouthOut', parent=self.ctrlCmpGrp)

        # loLip
        self.loLipCtrl = Control('loLip', parent=self.ctrlCmpGrp)
        self.loLipCtrl.lockTranslation(x=True, y=False, z=False)
        self.L_loLipHandleCtrl = Control('L_loLipHandle', parent=self.loLipCtrl)
        self.R_loLipHandleCtrl = Control('R_loLipHandle', parent=self.loLipCtrl)
        self.loDummy = Control('loDummy', parent=self.ctrlCmpGrp)



        for ctrl in [self.L_midLipHandleCtrl,
                     self.R_midLipHandleCtrl,
                     self.L_upLipHandleCtrl,
                     self.R_upLipHandleCtrl,
                     self.L_loLipHandleCtrl,
                     self.R_loLipHandleCtrl]:
            ctrl.setColor("red")


        self.defCtrls = []
        self.lipCtrls = []
        self.symMapping = {}

        # Add Mouth Symmetry Canvas Op
        self.lSideObjs = []
        self.rSideObjs = []
        self.lSideParentObjs = []

        # Add Att Inputs
        self.refInputs = []
        self.midLipControls = []
        self.midLipOutputs = []

        self.mouthCtrl = Control('mouth', parent=self.ctrlCmpGrp, shape="sphere")
        self.mouthEndCtrl = Control('mouthEnd', parent=self.ctrlCmpGrp, shape="sphere")
        self.mouthCtrl.setColor("green")
        self.mouthEndCtrl.setColor("green")

        # setting inital Guide Data
        # note that we're not setting the R Side Objects since all R_ objects are currently reflected from their L_ symmetric Partner
        data = {
                "name": name,
                "location": "M",
                "mouthXfo": Xfo(Vec3(0, 15, 0)),
                "midLipXfo": Xfo(Vec3(0, 15, 4)),
                "L_midLipHandleXfo": Xfo(Vec3(1.75, 15, 4)),
                "R_midLipHandleXfo": Xfo(Vec3(-1.75, 15, 4)),
                "loLipXfo": Xfo(Vec3(0, 13, 4)),
                "L_loLipHandleXfo": Xfo(Vec3(1.75, 13, 4)),
                "R_loLipHandleXfo": Xfo(Vec3(-1.75, 13, 4)),
                "upLipXfo": Xfo(Vec3(0, 17, 4)),
                "L_upLipHandleXfo": Xfo(Vec3(1.75, 17, 4)),
                "R_upLipHandleXfo": Xfo(Vec3(-1.75, 17, 4)),
                "L_MouthXfo": Xfo(Vec3(3, 15, 3)),
                "R_MouthXfo": Xfo(Vec3(-3, 15, 3)),
                "L_MouthOutXfo": Xfo(Vec3(4, 15, 2)),
                "R_MouthOutXfo": Xfo(Vec3(-4, 15, 2)),
                "mouthEndXfo": Xfo(Vec3(0, 15, 4)),
                "alignX": 2,
                "alignY": -1,
                "alignZ": 3
               }


        self.paramOut = []
        # Add midLip Debug Canvas Op
        self.midLipGuideOp = CanvasOperator('midLipGuideOp', 'OSS.Solvers.NURBSCurveGuideSolver')
        self.addOperator(self.midLipGuideOp)

        self.midLipGuideOp.setInput('drawDebug', self.drawDebugInputAttr)
        self.midLipGuideOp.setInput('rigScale', 1.0)
        self.midLipGuideOp.setInput('degree', 4)

        self.midLipGuideOp.setInput('controls', self.midLipControls)
        self.midLipGuideOp.setInput('refMats', self.midLipControls)

        self.midLipGuideOp.setOutput('result', self.paramOut )

        # update Inputs
        self.midLipControls.append(self.lMouthCtrl)
        self.midLipControls.append(self.L_midLipHandleCtrl)
        self.midLipControls.append(self.midLipCtrl)
        self.midLipControls.append(self.R_midLipHandleCtrl)
        self.midLipControls.append(self.rMouthCtrl)

        self.midLipOutputs.append(self.midDummy)


        # Add upLip Debug Canvas Op
        self.upLipGuideOp = CanvasOperator('upLipGuideOp', 'OSS.Solvers.NURBSCurveGuideSolver')
        self.addOperator(self.upLipGuideOp)

        self.upLipControls = []
        self.upLipOutputs = []

        self.upLipGuideOp.setInput('drawDebug', self.drawDebugInputAttr)
        self.upLipGuideOp.setInput('rigScale', 1.0)
        self.upLipGuideOp.setInput('degree', 3)

        self.upLipGuideOp.setInput('controls', self.upLipControls)
        self.upLipGuideOp.setInput('refMats', self.upLipControls)

        self.upLipGuideOp.setOutput('result', self.paramOut)

        # update Inputs
        self.upLipControls.append(self.lMouthOutCtrl)
        self.upLipControls.append(self.L_upLipHandleCtrl)
        self.upLipControls.append(self.upLipCtrl)
        self.upLipControls.append(self.R_upLipHandleCtrl)
        self.upLipControls.append(self.rMouthOutCtrl)


        # Add lowLip Debug Canvas Op
        self.loLipGuideOp = CanvasOperator('loLipGuideOp', 'OSS.Solvers.NURBSCurveGuideSolver')
        self.addOperator(self.loLipGuideOp)

        self.loLipControls = []
        self.loLipOutputs = []

        self.loLipGuideOp.setInput('drawDebug', self.drawDebugInputAttr)
        self.loLipGuideOp.setInput('rigScale', 1.0)
        self.loLipGuideOp.setInput('degree', 3)

        self.loLipGuideOp.setInput('controls', self.loLipControls)
        self.loLipGuideOp.setInput('refMats', self.loLipControls)

        self.loLipGuideOp.setOutput('result', self.paramOut )

        # update Inputs
        self.loLipControls.append(self.lMouthOutCtrl)
        self.loLipControls.append(self.L_loLipHandleCtrl)
        self.loLipControls.append(self.loLipCtrl)
        self.loLipControls.append(self.R_loLipHandleCtrl)
        self.loLipControls.append(self.rMouthOutCtrl)

        self.allObject3Ds = self.getHierarchyNodes(classType="Control")

        for ctrl in self.allObject3Ds:
            self.addToSymDict(ctrl)

        for k,value in self.symMapping.iteritems():
            self.lSideObjs.append(value["lSide"])
            self.lSideParentObjs.append(value["lSideParent"])
            self.rSideObjs.append(value["rSide"])


        # Add reflection Canvas Op, should feed inputs from self.symMapping
        self.reflectionOp = CanvasOperator('reflectionOp', 'OSS.Solvers.reflectMat44Solver')
        self.addOperator(self.reflectionOp)

        self.reflectionOp.setInput('inputs',   self.lSideObjs)
        self.reflectionOp.setInput('inputParents',  self.lSideParentObjs)
        self.reflectionOp.setOutput('results', self.rSideObjs)

        self.loadData(data)

        Profiler.getInstance().pop()

    def addToSymDict(self, ctrl):
        if not self.symMapping:
            self.symMapping = {}
        name = ctrl.getName()
        if not (name.startswith("L_") or name.startswith("R_")):
            ctrl.lockTranslation(x=True, y=False, z=False)
            return  self.symMapping

        if name.startswith("R_"):
            idxName = name.replace("R_","L_")
        else:
            idxName = name

        if not idxName in  self.symMapping:
             self.symMapping[idxName] = {}

        if name.startswith("L_"):
             self.symMapping[idxName]["lSide"] = ctrl
             self.symMapping[idxName]["lSideParent"] = ctrl.getParent()
        else:
             self.symMapping[idxName]["rSide"] = ctrl

        return self.symMapping


    def createGuideControls(self, ctrlType, controlsList, defNames):
        # Delete current controls
        '''
        self.controlXforms = []
        # Store current values if guide controls already exist
        # for i, name in enumerate(["lipDeformers", "lipControls"]):
        current = 0
        for i, ctrl in enumerate(controlsList):
            self.controlXforms.append([ctrl.xfo])
            if ctrl.getParent() is self.mouthCtrl:
                self.controlXforms.append([ctrl.xfo])
                current = len(self.controlXforms) -1
            else:
                self.controlXforms[current].append(ctrl.xfo)
        '''
        lSideControls = []
        rSideControls = []
        # Delete current controls
        for ctrl in reversed(controlsList):
            ctrl.getParent().removeChild(ctrl)
        del controlsList[:]

        del self.refInputs[:]

        if ctrlType == "lipDeformers":
            parent = self.mouthCtrl
            defControlNameList = []

            #Build Deformer Names
            half = int(math.floor(defNames/2))

            n=0
            for i in range(half):
                lSideControls.append('L_' + str(half-n))
                rSideControls.append('R_' + str(n+1))
                n += 1


            if lSideControls:
                lSideControls.reverse()

                defControlNameList = lSideControls + ["Mid"] + rSideControls

            if not defNames % 2 == 0:
                defControlNameList = lSideControls + ["Mid"] + rSideControls
            else:
                defControlNameList = lSideControls + rSideControls

            for i, defName in enumerate(defControlNameList):
                newCtrl = Control(defName, parent=parent, shape="sphere")
                newCtrl.xfo = parent.xfo.multiply(Xfo(Vec3(0, 0, 5)))
                newCtrl.scalePoints(Vec3(.125,.125,.125))
                controlsList.append(newCtrl)


        if ctrlType == "lipControls":
            parent = self.midLipCtrl
            defControlNameList =[]

            # Lets build all new handles
            defControlNameList = self.convertToStringList(defNames)
            if not defControlNameList:  # Nothing to build
                return True


            # etting up names
            lSideControls = ["L_" + x for x in defControlNameList]
            rSideControls = ["R_" + x for x in defControlNameList]

            if lSideControls:
                lSideControls.reverse()

            defControlNameList = lSideControls + ["Mid"] + rSideControls

            for i, defName in enumerate(defControlNameList):
                newCtrl = Control(defName, parent=parent, shape="circle")
                newCtrl.rotatePoints(90,0,0)
                newCtrl.setColor("brownMuted")
                newCtrl.xfo = parent.xfo
                newCtrl.xfo = parent.xfo.multiply(Xfo(Vec3(0, 0, 8)))
                newCtrl.scalePoints(Vec3(.5,.5,.5))
                controlsList.append(newCtrl)


        for ctrl in controlsList:
            self.addToSymDict(ctrl)

        return True


    def updateDefNames(self, defNames):
        self.createGuideControls("lipDeformers", self.defCtrls, defNames)

    def updatelipCtrls(self, defNames):
        self.createGuideControls("lipControls", self.lipCtrls, defNames)


    # =============
    # Data Methods
    # =============
    def saveData(self):
        """Save the data for the component to be persisted.

        Return:
        The JSON data object

        """


        data = super(OSSMouthGuide, self).saveData()

        # this should live in the GuideClase - also should considere Inherited Types
        data = self.saveAllObjectData(data, "Control")
        data = self.saveAllObjectData(data, "Transform")

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


        super(OSSMouthGuide, self).loadData( data )


        self.loadAllObjectData(data, "Control")
        self.loadAllObjectData(data, "Transform")


        return True



    def getRigBuildData(self):
        """Returns the Guide data used by the Rig Component to define the layout of the final rig..

        Return:
        The JSON rig data object.

        """

        # Values
        mouthPosition = self.mouthCtrl.xfo.tr
        mouthEndPosition = self.mouthEndCtrl.xfo.tr

        # Calculate Mouth Xfo

        # atVector
        mouthUpV = Xfo(Vec3(0.0, 1.0, 0.0)).tr

        rootToEnd = mouthEndPosition.subtract(mouthPosition).unit()
        rootToUpV = mouthUpV.subtract(mouthPosition).unit()
        bone1ZAxis = rootToUpV.cross(rootToEnd).unit()
        bone1Normal = bone1ZAxis.cross(rootToEnd).unit()

        mouthXfo = Xfo()
        mouthXfo.setFromVectors(rootToEnd, bone1Normal, bone1ZAxis, mouthPosition)

        mouthLen = mouthPosition.subtract(mouthEndPosition).length()


        data = super(OSSMouthGuide, self).getRigBuildData()

        # should include getCurveData
        data = self.saveAllObjectData(data, "Control")
        data = self.saveAllObjectData(data, "Transform")
        data['mouthXfo'] = mouthXfo
        data['mouthLen'] = mouthLen
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

        return OSSMouthRig


class OSSMouthRig(OSSMouth):
    """Mouth Component"""

    def __init__(self, name='Mouth', parent=None):

        Profiler.getInstance().push("Construct Mouth Rig Component:" + name)
        super(OSSMouthRig, self).__init__(name, parent)

        # ==========
        # Deformers
        # ==========

        self.parentSpaceInputTgt.childJoints = []

        # Mouth
        self.mouthDef = Joint('mouth', parent=self.deformersParent)
        self.mouthDef.setComponent(self)
        self.parentSpaceInputTgt.childJoints.append(self.mouthDef)

        # =========
        # Controls
        # =========
        # Mouth

        self.mouthCtrlSpace = CtrlSpace('mouth', parent=self.ctrlCmpGrp)
        self.mouthCtrl = Control('mouth', parent=self.mouthCtrlSpace, shape="halfCircle")

        # midMouth
        self.topMouthCtrlSpace = CtrlSpace('topMouth', parent=self.mouthCtrlSpace)

        # midMouth
        self.midMouthCtrlSpace = CtrlSpace('midMouth', parent=self.ctrlCmpGrp)
        self.midMouthCtrl = CtrlSpace('midMouth', parent=self.midMouthCtrlSpace)

        # self.allMouthCtrl = Control('allMouth', parent=self.midMouthCtrlSpace, shape="square")
        # loLip
        self.loLipCtrlSpace = CtrlSpace('loLip', parent=self.mouthCtrl)
        self.loLipCtrl = Control('loLip', parent=self.loLipCtrlSpace, shape="halfCircle")
        self.L_loLipHandleCtrl = CtrlSpace('L_loLipHandle', parent=self.loLipCtrl)
        self.R_loLipHandleCtrl = CtrlSpace('R_loLipHandle', parent=self.loLipCtrl)
        self.loDummy = CtrlSpace('loDummy', parent=self.ctrlCmpGrp)

        # upLip
        self.upLipCtrlSpace = CtrlSpace('upLip', parent=self.mouthCtrlSpace)
        self.upLipCtrl = Control('upLip', parent=self.upLipCtrlSpace, shape="halfCircle")
        self.L_upLipHandleCtrl = CtrlSpace('L_upLipHandle', parent=self.upLipCtrl)
        self.R_upLipHandleCtrl = CtrlSpace('R_upLipHandle', parent=self.upLipCtrl)
        self.upDummy = CtrlSpace('upDummy', parent=self.ctrlCmpGrp)


        self.lMouthCtrlSpace = CtrlSpace('L_Mouth', parent=self.midMouthCtrl)
        self.lMouthCtrl = Control('L_Mouth_tweak', parent=self.lMouthCtrlSpace, shape="circle")
        self.lMouthCtrl.alignOnXAxis()
        self.rMouthCtrlSpace = CtrlSpace('R_Mouth', parent=self.midMouthCtrl)
        self.rMouthCtrl = Control('R_Mouth_tweak', parent=self.rMouthCtrlSpace, shape="circle")
        self.rMouthCtrl.alignOnXAxis()


        # ==============
        # Constrain I/O
        # ==============
        # Mouth
        self.mouthInputConstraint = self.mouthCtrlSpace.constrainTo(self.parentSpaceInputTgt, maintainOffset=True)
        self.mouthConstraint = self.mouthOutputTgt.constrainTo(self.mouthCtrl, maintainOffset=False)
        self.mouthEndConstraint = self.mouthEndOutputTgt.constrainTo(self.mouthCtrl, maintainOffset=False)

        self.mouthOutputTgt.parentJoint =  self.mouthDef

        # Lip
        # lipInputConstraint = PoseConstraint('_'.join([self.midLipCtrl.getName(), 'To', self.parentSpaceInputTgt.getName()]))
        # lipInputConstraint.setMaintainOffset(True)
        # lipInputConstraint.addConstrainer(self.parentSpaceInputTgt)
        # self.midLipCtrlSpace.addConstraint(lipInputConstraint)

        # Constraint outputs
        # lipConstraint = PoseConstraint('_'.join([self.lipOutputTgt.getName(), 'To', self.midLipCtrl.getName()]))
        # lipConstraint.addConstrainer(self.midLipCtrl)
        # self.lipOutputTgt.addConstraint(lipConstraint)
        Profiler.getInstance().pop()




    def createGuideControls(self, ctrlType, controlsList, defNames):
        # Delete current controls
        '''
        self.controlXforms = []
        # Store current values if guide controls already exist
        # for i, name in enumerate(["lipDeformers", "lipControls"]):
        current = 0
        for i, ctrl in enumerate(controlsList):
            self.controlXforms.append([ctrl.xfo])
            if ctrl.getParent() is self.mouthCtrl:
                self.controlXforms.append([ctrl.xfo])
                current = len(self.controlXforms) -1
            else:
                self.controlXforms[current].append(ctrl.xfo)
        '''

        lSideControls = []
        rSideControls = []
        # Delete current controls
        for ctrl in reversed(controlsList):
            ctrl.getParent().removeChild(ctrl)
        del controlsList[:]

        parent = self.ctrlCmpGrp

        if ctrlType == "upLipDef" or ctrlType == "loLipDef":
            defControlNameList = []

            #Build Deformer Names
            half = int(math.floor(defNames/2))

            n=0
            for i in range(half):
                lSideControls.append('L_' + str(half-n))
                rSideControls.append('R_' + str(n+1))
                n += 1

            lSideControls.reverse()
            rSideControls.reverse()

            if not defNames % 2 == 0:
                defControlNameList = rSideControls + ["Mid"] + lSideControls
            else:
                defControlNameList = rSideControls + lSideControls

            for i, defName in enumerate(defControlNameList):
                newCtrl = Locator(defName + "_" + ctrlType.replace("Def",""), parent= self.ctrlCmpGrp)
                newCtrl.setShapeVisibility(False)
                newCtrl.xfo = parent.xfo
                controlsList.append(newCtrl)

                newDef = Joint(defName + "_" + ctrlType.replace("Def",""), parent= self.mouthDef)
                newDef.setComponent(self)
                newDef.constrainTo(newCtrl)


        if ctrlType == "lipControls":
            defControlNameList =[]

            # Lets build all new handles
            defControlNameList = self.convertToStringList(defNames)
            if not defControlNameList:  # Nothing to build
                return True


            # etting up names
            lSideControls = ["L_" + x for x in defControlNameList]
            rSideControls = ["R_" + x for x in defControlNameList]

            if lSideControls:
                lSideControls.reverse()

            defControlNameList = lSideControls + ["Mid"] + rSideControls

            for i, defName in enumerate(defControlNameList):
                newCtrl = Control(defName, parent=parent, shape="halfCircle")
                newCtrl.rotatePoints(90,0,0)
                newCtrl.setColor("brownMuted")
                newCtrl.xfo = parent.xfo
                newCtrl.scalePoints(Vec3(.125,.125,.125))
                controlsList.append(newCtrl)
                newCtrl.lockRotation(x=False, y=True, z=True)
                newCtrl.lockScale(x=True, y=True, z=True)



        # for ctrl in controlsList:
        #     self.addToSymDict(ctrl)

        return controlsList



    def loadData(self, data=None):
        """Load a saved guide representation from persisted data.

        Arguments:
        data -- object, The JSON data object.

        Return:
        True if successful.

        """

        super(OSSMouthRig, self).loadData( data )


        # ===============
        # Add Fabric Ops
        # ===============
        # Add NURBSCurveXfoSolver Canvas Op
        # Add lowLip Guide Canvas Op
        self.alignX = data["alignX"]
        self.alignY = data["alignY"]
        self.alignZ = data["alignZ"]

        self.upLipRigOp = KLOperator('upLipRigOp', 'OSS_NURBSCurveXfoKLSolver', 'OSS_Kraken')

        self.addOperator(self.upLipRigOp)
        # self.params = [0.025,0.125,0.3,0.5,0.7,0.875,0.975]
        self.params = [0.05,0.25,0.5,0.75,0.95]

        self.upLipControls = []
        self.upLipOutputs = []
        self.rigControlAligns = []
        self.upLipControls.append(self.lMouthCtrl)
        self.upLipControls.append(self.L_upLipHandleCtrl)
        self.upLipControls.append(self.upLipCtrl)
        self.upLipControls.append(self.R_upLipHandleCtrl)
        self.upLipControls.append(self.rMouthCtrl)

        '''

        for i in range(len(self.upLipControls)):
            ctrl = self.upLipControls[i]
            newSpace = CtrlSpace(ctrl._name + 'out', parent=ctrl)
            self.upLipControls[i] = newSpace


        for i in range(len(self.loLipControls)):
            ctrl = self.upLipControls[i]
            newSpace = CtrlSpace(ctrl._name + 'out', parent=ctrl)
            self.loLipControls[i] = newSpace
        '''


        self.upLipRigOp.setInput('drawDebug', self.drawDebugInputAttr)
        self.upLipRigOp.setInput('rigScale', 1.0)
        self.upLipRigOp.setInput('alignX', self.alignX )
        self.upLipRigOp.setInput('alignY', -self.alignY )
        self.upLipRigOp.setInput('alignZ', self.alignZ )
        self.upLipRigOp.setInput('degree', 4)
        self.upLipRigOp.setInput('keepArcLength', 0.0)
        self.upLipRigOp.setInput('compressionAmt', 0.0)
        self.upLipRigOp.setInput('followCurveTangent', 0.0)
        self.upLipRigOp.setInput('altTangent', Vec3(0.0,1.0,0.0))
        self.upLipRigOp.setInput('parent', self.mouthCtrlSpace)

        self.upLipRigOp.setInput('atVec', self.mouthCtrl)
        self.upLipRigOp.setInput('controlAligns', self.rigControlAligns)
        self.upLipRigOp.setInput('controls', self.upLipControls)
        self.upLipRigOp.setInput('controlsRest', self.upLipControls)
        self.upLipRigOp.setInput('params',self.params )

        self.upLipRigOp.setOutput('outputs', self.upLipOutputs)


        # ===============
        # Add Fabric Ops
        # ===============
        # Add Spine Canvas Op
        # Add lowLip Guide Canvas Op
        self.loLipRigOp = KLOperator('loLipRigOp', 'OSS_NURBSCurveXfoKLSolver', 'OSS_Kraken')
        self.addOperator(self.loLipRigOp)

        self.loLipControls = []
        self.loLipControlsRest = []
        self.loLipOutputs = []
        self.loLipControls.append(self.lMouthCtrl)
        self.loLipControls.append(self.L_loLipHandleCtrl)
        self.loLipControls.append(self.loLipCtrl)
        self.loLipControls.append(self.R_loLipHandleCtrl)
        self.loLipControls.append(self.rMouthCtrl)

            
        self.loLipRigOp.setInput('drawDebug', self.drawDebugInputAttr)
        self.loLipRigOp.setInput('rigScale', 1.0)
        self.loLipRigOp.setInput('alignX', self.alignX )
        self.loLipRigOp.setInput('alignY', -self.alignY )
        self.loLipRigOp.setInput('alignZ', self.alignZ )
        self.loLipRigOp.setInput('degree', 4)
        self.loLipRigOp.setInput('keepArcLength', 0.0)
        self.loLipRigOp.setInput('compressionAmt', 0.0)
        self.loLipRigOp.setInput('followCurveTangent', 0.0)
        self.loLipRigOp.setInput('altTangent', Vec3(0.0,1.0,0.0))
        self.loLipRigOp.setInput('parent', self.mouthCtrlSpace)

        self.loLipRigOp.setInput('atVec', self.mouthCtrl)
        self.loLipRigOp.setInput('controlAligns', self.rigControlAligns)
        self.loLipRigOp.setInput('controls', self.loLipControls)
        self.loLipRigOp.setInput('controlsRest', self.loLipControls)
        self.loLipRigOp.setInput('params', self.params )

        self.loLipRigOp.setOutput('outputs', self.loLipOutputs)

        for i in range(len(self.loLipControls)):
            self.rigControlAligns.append(Vec3(1,2,3))

        self.rigControlAligns[3] = Vec3(-1,2,-3)
        self.rigControlAligns[4] = Vec3(1,-2,-3)

        # Add lowLip Guide Canvas Op
        self.blendMidMouthRigOp = CanvasOperator('blendMidMouthRigOp', 'OSS.Solvers.blendMat44Solver')
        self.addOperator(self.blendMidMouthRigOp)

        # self.blendMidMouthRigOp.setInput('drawDebug', self.drawDebugInputAttr)
        # self.blendMidMouthRigOp.setInput('rigScale', 1.0)
        self.blendMidMouthRigOp.setInput('rotationAmt', .5)
        self.blendMidMouthRigOp.setInput('translationAmt', .5)
        self.blendMidMouthRigOp.setInput('scaleAmt', .5)

        self.blendMidMouthRigOp.setInput('parentSpace', self.ctrlCmpGrp)
        self.blendMidMouthRigOp.setInput('A', self.topMouthCtrlSpace)
        self.blendMidMouthRigOp.setInput('B', self.loLipCtrlSpace)

        self.blendMidMouthRigOp.setOutput('result', self.midMouthCtrlSpace)


        # ===============
        # Add Splice Ops
        # ===============
        # Add Deformer Splice Op

        self.rigCtrls = []
        self.rigDefs = []
        self.rigCtrls.append(self.mouthCtrl)
        self.rigDefs.append(self.mouthDef)

        self.eyeCtrlConstraint = self.mouthDef.constrainTo(self.mouthCtrl, maintainOffset=False)


        # self.outputsToDeformersOKLOp = KLOperator('MultiPoseConstraintOp', 'MultiPoseConstraintSolver', 'Kraken')
        # self.addOperator(self.outputsToDeformersOKLOp)
        # self.outputsToDeformersOKLOp.setInput('drawDebug', self.drawDebugInputAttr)
        # self.outputsToDeformersOKLOp.setInput('rigScale', self.rigScaleInputAttr)
        # self.outputsToDeformersOKLOp.setInput('constrainers', self.rigCtrls)
        # self.outputsToDeformersOKLOp.setOutput('constrainees', self.rigDefs)



        self.upLipDefs = []
        self.upLipCtrls = []
        self.upLipCtrls = self.createGuideControls("lipControls", self.upLipCtrls, data["lipCtrlNames"])

        self.upLipDefs = self.createGuideControls("upLipDef", self.upLipDefs, data["numSpans"])

        self.lLoLipCorner = Transform('L_loLipCorner', parent=self.ctrlCmpGrp)
        self.rLoLipCorner = Transform('R_loLipCorner', parent=self.ctrlCmpGrp)
        self.lUpLipCorner = Transform('L_upLipCorner', parent=self.ctrlCmpGrp)
        self.rUpLipCorner = Transform('R_upLipCorner', parent=self.ctrlCmpGrp)

        lipCtrlY = .05
        lipCtrlZ = .45
        if self.upLipCtrls:
            # build control hierarchy
            numCtrls = len(self.upLipCtrls)
            half = int(math.floor(numCtrls/2))

            evenNumCtrls = (numCtrls % 2 == 0)

            for i in range(numCtrls):
                ctrl = self.upLipCtrls[i]
                ctrl.translatePoints(Vec3(Vec3(0, lipCtrlY, lipCtrlZ)))
                ctrl.setColor("yellowMuted")
                ctrlUberParent = ctrl.insertCtrlSpace()
                ctrlParent = ctrl.insertCtrlSpace()

                # if i < (half-1):
                #     ctrlParent.constrainTo(self.upLipCtrls[i+1], maintainOffset=True)
                # if (half+1) < i:
                #     ctrlParent.constrainTo(self.upLipCtrls[i-1], maintainOffset=True)
                self.upLipOutputs.append(ctrlUberParent)

        self.upLipCtrls = [self.lMouthCtrl] + self.upLipCtrls + [self.rMouthCtrl]


        self.upLipRigOp.setOutput('outputs', self.upLipOutputs)

        # Add lowLip Debug Canvas Op
        self.upLipDefOp = KLOperator('upLipDefOp', 'OSS_NURBSCurveXfoKLSolver', 'OSS_Kraken')
        self.addOperator(self.upLipDefOp)

        self.defControlAligns = []
        self.upLipCtrlsRest = []

        # numDefs plus two for the corners, this should be determined per closest point on curve
        self.paramsOut = [1, .96, .9, .81, .74, .66, .58, 0.5, 0.42, 0.34, 0.26, 0.19, 0.1, 0.04, 0]

        self.upLipDefs =  [self.rUpLipCorner] + self.upLipDefs + [self.lUpLipCorner]

        self.upLipDefOp.setInput('drawDebug', self.drawDebugInputAttr)
        self.upLipDefOp.setInput('rigScale', 1.0)
        self.upLipDefOp.setInput('degree', 3)
        self.upLipDefOp.setInput('alignX', self.alignX )
        self.upLipDefOp.setInput('alignY', self.alignY )
        self.upLipDefOp.setInput('alignZ', self.alignZ )
        self.upLipDefOp.setInput('keepArcLength', 0.0)
        self.upLipDefOp.setInput('compressionAmt', 0.5)
        self.upLipDefOp.setInput('followCurveTangent', 0.5)
        self.upLipDefOp.setInput('altTangent', Vec3(0.0,0.0,1.0))
        self.upLipDefOp.setInput('parent', self.mouthCtrlSpace)

        self.upLipDefOp.setInput('atVec', self.mouthCtrl)
        self.upLipDefOp.setInput('controlAligns', self.defControlAligns)
        self.upLipDefOp.setInput('controls', self.upLipCtrls)
        self.upLipDefOp.setInput('controlsRest', self.upLipCtrlsRest)
        self.upLipDefOp.setInput('params', self.paramsOut)

        self.upLipDefOp.setOutput('outputs', self.upLipDefs)


        #loLip
        self.loLipDefs = []
        self.loLipCtrls = []
        self.loLipCtrls = self.createGuideControls("lipControls", self.loLipCtrls, data["lipCtrlNames"])
        self.loLipDefs  = self.createGuideControls("loLipDef", self.loLipDefs, data["numSpans"])


        if self.loLipCtrls:
            # build control hierarchy
            numCtrls = len(self.loLipCtrls)
            half = int(math.floor(numCtrls/2))
            evenNumCtrls = (numCtrls % 2 == 0)

            for i in range(numCtrls):
                ctrl = self.loLipCtrls[i]
                ctrl.translatePoints(Vec3(Vec3(0, lipCtrlY, lipCtrlZ)))
                ctrl.scalePoints(Vec3(Vec3(1, -1, 1)))
                ctrlUberParent = ctrl.insertCtrlSpace()
                ctrlParent = ctrl.insertCtrlSpace()
                # if i < (half-1):
                #     ctrlParent.constrainTo(self.loLipCtrls[i+1], maintainOffset=True)
                # if (half+1) < i:
                #     ctrlParent.constrainTo(self.loLipCtrls[i-1], maintainOffset=True)
                self.loLipOutputs.append(ctrlUberParent)

        self.loLipCtrls = [self.lMouthCtrl] + self.loLipCtrls + [self.rMouthCtrl]

        self.loLipCtrlsRest = []
        for i in range(len(self.loLipCtrls)):
            self.defControlAligns.append(Vec3(1,2,3))


        self.loLipRigOp.setOutput('outputs', self.loLipOutputs)
        # Add lowLip Debug Canvas Op
        self.loLipDefOp = KLOperator('loLipDefOp', 'OSS_NURBSCurveXfoKLSolver', 'OSS_Kraken')
        self.addOperator(self.loLipDefOp)

        self.loLipOutputs = []
        self.loLipDefs =  [self.rLoLipCorner] + self.loLipDefs + [self.lLoLipCorner]

        self.loLipDefOp.setInput('drawDebug', self.drawDebugInputAttr)
        self.loLipDefOp.setInput('rigScale', 1.0)
        self.loLipDefOp.setInput('degree', 3)
        self.loLipDefOp.setInput('alignX', self.alignX )
        self.loLipDefOp.setInput('alignY', self.alignY )
        self.loLipDefOp.setInput('alignZ', self.alignZ )
        self.loLipDefOp.setInput('keepArcLength', 0.0)
        self.loLipDefOp.setInput('compressionAmt', 0.5)
        self.loLipDefOp.setInput('followCurveTangent', 0.5)
        self.loLipDefOp.setInput('altTangent', Vec3(0.0,0.0,1.0))
        self.loLipDefOp.setInput('parent', self.mouthCtrlSpace)

        self.loLipDefOp.setInput('atVec', self.mouthCtrl)
        self.loLipDefOp.setInput('controlAligns', self.defControlAligns)
        self.loLipDefOp.setInput('controls', self.loLipCtrls)
        self.loLipDefOp.setInput('controlsRest', self.loLipCtrlsRest)
        self.loLipDefOp.setInput('params', self.paramsOut )

        self.loLipDefOp.setOutput('outputs', self.loLipDefs)




        # Add lowLip Guide Canvas Op
        self.lMouthCornerLoc = Locator('L_mouthCorner', parent=self.ctrlCmpGrp)
        self.lMouthCornerLoc.setShapeVisibility(False)

        self.blendLeftCornerOp = CanvasOperator('blendLeftCornerOp', 'OSS.Solvers.blendMat44Solver')
        self.addOperator(self.blendLeftCornerOp)

        # self.blendLeftCornerOp.setInput('drawDebug', self.drawDebugInputAttr)
        # self.blendLeftCornerOp.setInput('rigScale', 1.0)
        self.blendLeftCornerOp.setInput('rotationAmt', .5)
        self.blendLeftCornerOp.setInput('translationAmt', .5)
        self.blendLeftCornerOp.setInput('scaleAmt', .5)

        self.blendLeftCornerOp.setInput('parentSpace', self.ctrlCmpGrp)
        self.blendLeftCornerOp.setInput('A', self.lUpLipCorner)
        self.blendLeftCornerOp.setInput('B', self.lLoLipCorner)

        self.blendLeftCornerOp.setOutput('result', self.lMouthCornerLoc)

        self.lMouthCornerDef = Joint('L_mouthCorner',  parent=self.mouthDef)
        self.lMouthCornerDef.setComponent(self)
        self.lMouthCornerDef.constrainTo(self.lMouthCornerLoc)



        # Add lowLip Guide Canvas Op
        self.rMouthCornerLoc = Locator('R_mouthCorner', parent=self.ctrlCmpGrp)
        self.rMouthCornerLoc.setShapeVisibility(False)
        self.blendRightCornerOp = CanvasOperator('blendRightCornerOp', 'OSS.Solvers.blendMat44Solver')
        self.addOperator(self.blendRightCornerOp)

        # self.blendRightCornerOp.setInput('drawDebug', self.drawDebugInputAttr)
        # self.blendRightCornerOp.setInput('rigScale', 1.0)
        self.blendRightCornerOp.setInput('rotationAmt', .5)
        self.blendRightCornerOp.setInput('translationAmt', .5)
        self.blendRightCornerOp.setInput('scaleAmt', .5)

        self.blendRightCornerOp.setInput('parentSpace', self.ctrlCmpGrp)
        self.blendRightCornerOp.setInput('A', self.rUpLipCorner)
        self.blendRightCornerOp.setInput('B', self.rLoLipCorner)

        self.blendRightCornerOp.setOutput('result', self.rMouthCornerLoc)

        self.rMouthCornerDef = Joint('R_mouthCorner',  parent=self.mouthDef)
        self.rMouthCornerDef.setComponent(self)
        self.rMouthCornerDef.constrainTo(self.rMouthCornerLoc)





        globalScale = Vec3(data['globalComponentCtrlSize'], data['globalComponentCtrlSize'], data['globalComponentCtrlSize'])

        self.topMouthCtrlSpace.xfo = data['midLipXfo']
        self.mouthCtrlSpace.xfo = data['mouthXfo']
        self.mouthCtrl.xfo = data['mouthXfo']
        self.mouthCtrl.rotatePoints(-90.0, 0.0, 90.0)
        self.mouthCtrl.scalePoints(Vec3(Vec3( .5, .5,  .5)))

        self.lMouthCtrlSpace.xfo = data['L_MouthXfo']
        self.lMouthCtrl.xfo = data['L_MouthXfo']
        self.lMouthCtrl.scalePoints(Vec3(Vec3( .5, .5,  .5)))
        self.lMouthCtrl.translatePoints(Vec3(Vec3(.0, .5,  0)))
        self.lMouthCtrl.rotatePoints(90.0, 0.0, 0.0)
        self.lMouthCtrl.lockRotation(x=True, y=True, z=True)
        self.lMouthCtrl.lockScale(x=True, y=True, z=True)

        self.rMouthCtrlSpace.xfo = data['R_MouthXfo']
        self.rMouthCtrlSpace.xfo.sc = Vec3(1.0, 1.0, -1.0)
        self.rMouthCtrl.xfo = data['R_MouthXfo']
        self.rMouthCtrl.scalePoints(Vec3(Vec3(.5, .5,  .5)))
        self.rMouthCtrl.translatePoints(Vec3(Vec3(.0, .5,  0)))
        self.rMouthCtrl.rotatePoints(90.0, 0.0, 0.0)
        self.rMouthCtrl.lockRotation(x=True, y=True, z=True)
        self.rMouthCtrl.lockScale(x=True, y=True, z=True)

        self.mouthEndOutputTgt.xfo = data['mouthXfo']
        self.mouthOutputTgt.xfo = data['mouthXfo']

        self.evalOperators()

        # Eval Constraints
        self.mouthConstraint.evaluate()
        self.mouthEndConstraint.evaluate()

        # loLip
        self.loLipCtrlSpace.xfo = data['midLipXfo']
        self.loLipCtrl.xfo = data['midLipXfo']
        self.loLipCtrl.rotatePoints(90.0, 0.0, 0.0)
        self.loLipCtrl.scalePoints(Vec3(Vec3(.5, -.125,.5)))
        self.loLipCtrl.setColor("brownMuted")
        self.loLipCtrl.lockScale(x=False, y=True, z=True)

        self.L_loLipHandleCtrl.xfo = data['L_midLipHandleXfo']
        self.R_loLipHandleCtrl.xfo = data['R_midLipHandleXfo']

        self.midMouthCtrlSpace.xfo = data['midLipXfo']
        self.midMouthCtrl.xfo = data['midLipXfo']

        # upLip
        self.upLipCtrlSpace.xfo = data['midLipXfo']
        self.upLipCtrl.xfo = data['midLipXfo']
        self.upLipCtrl.rotatePoints(90.0, 0.0, 0.0)
        self.upLipCtrl.scalePoints(Vec3(Vec3(.5, .125,.5)))
        self.upLipCtrl.setColor("yellowMuted")
        self.upLipCtrl.lockScale(x=False, y=True, z=True)

        self.L_upLipHandleCtrl.xfo = data['L_midLipHandleXfo']
        self.R_upLipHandleCtrl.xfo = data['R_midLipHandleXfo']

        self.loLipCtrl.translatePoints(Vec3(Vec3(0, -.75,  .5)))
        self.loLipCtrl.alignOnZAxis()
        self.upLipCtrl.translatePoints(Vec3(Vec3(0, 0.75,  .5)))
        self.upLipCtrl.alignOnZAxis()

        for ctrl in self.getHierarchyNodes(classType="Control"):
            ctrl.scalePoints(globalScale)


        self.mouthCtrl.translatePoints(Vec3(Vec3(data['mouthLen'], -3 , 0.0)))

        # update the positions of the lip controls to match their uberparents
        # after we eval the operators and get the uber positions
        self.upLipRigOp.evaluate()
        for ctrl in self.upLipCtrls:
            if ctrl is not self.lMouthCtrl and ctrl is not self.rMouthCtrl:
                uber = ctrl.getParent().getParent()
                ctrl.getParent().xfo = Xfo(uber.xfo)
                ctrl.xfo = Xfo(uber.xfo)
        self.loLipRigOp.evaluate()
        for ctrl in self.loLipCtrls:
            if ctrl is not self.lMouthCtrl and ctrl is not self.rMouthCtrl:
                uber = ctrl.getParent().getParent()
                ctrl.getParent().xfo = Xfo(uber.xfo)
                ctrl.xfo = Xfo(uber.xfo)


        for i in range(len(self.loLipCtrls)):
            self.loLipCtrlsRest.append(self.loLipCtrls[i].xfo)
        for i in range(len(self.upLipCtrls)):
            self.upLipCtrlsRest.append(self.upLipCtrls[i].xfo)
        # ============
        # Set IO Xfos
        # ============
        self.parentSpaceInputTgt.xfo = data['midLipXfo']
        self.lipOutputTgt.xfo = data['midLipXfo']



from kraken.core.kraken_system import KrakenSystem
ks = KrakenSystem.getInstance()
ks.registerComponent(OSSMouthGuide)
ks.registerComponent(OSSMouthRig)
