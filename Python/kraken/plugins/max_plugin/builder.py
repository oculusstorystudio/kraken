"""Kraken Maya - Maya Builder module.

Classes:
Builder -- Component representation.

"""

import json
import logging
import math
import random

from kraken.log import getLogger

from kraken.core.kraken_system import ks
from kraken.core.configs.config import Config

from kraken.core.maths import *

from kraken.core.builder import Builder
from kraken.core.objects.object_3d import Object3D
from kraken.core.objects.attributes.attribute import Attribute
from kraken.core.objects.attributes.attribute_group import AttributeGroup
from kraken.core.objects.attributes.bool_attribute import BoolAttribute
from kraken.core.objects.attributes.string_attribute import StringAttribute
from kraken.plugins.max_plugin.utils import *

from kraken.helpers.utility_methods import prepareToSave, prepareToLoad


logger = getLogger('kraken')
logger.setLevel(logging.INFO)


class Builder(Builder):
    """Builder object for building Kraken objects in Maya."""

    def __init__(self):
        super(Builder, self).__init__()

    def deleteBuildElements(self):
        """Clear out all dcc built elements from the scene if exist."""


        for builtElement in self._buildElements:
            if builtElement['src'].isOfAnyType(('Attribute',
                                                'AttributeGroup',
                                                'Constraint')):
                continue

            node = builtElement['tgt']
            if node is None:
                msg = 'Built object is None: {} : {}'
                logger.warning(msg.format(builtElement['src'].getPath(),
                                          builtElement['src'].getTypeName()))
            else:
                try:
                    node.Delete()
                except Exception, e:
                    logger.warning(str(e))
                    msg = "Could not delete built items: {} ({})"
                    logger.warning(msg.format(builtElement['src'].getPath(),
                                              builtElement['src'].getTypeName()))

        self._buildElements = []

        return

    # ========================
    # Object3D Build Methods
    # ========================
    def buildContainer(self, kSceneItem, buildName):
        """Builds a container / namespace object.

        Args:
            kSceneItem (Object): kSceneItem that represents a container to
                be built.
            buildName (str): The name to use on the built object.

        Returns:
            object: Node that is created.

        """

        parentNode = self.getDCCSceneItem(kSceneItem.getParent())

        obj = MaxPlus.Factory.CreateHelperObject(MaxPlus.ClassIds.Point)
        node = MaxPlus.Factory.CreateNode(obj, buildName)
        node.SetHidden(True)

        if parentNode is not None:
            node.SetParent(parentNode)

        dccSceneItem = node

        self._registerSceneItemPair(kSceneItem, dccSceneItem)

        # Build Attributes for storing meta data on the container object
        if kSceneItem.isTypeOf('Rig'):

            krakenRigDataAttrGrp = AttributeGroup("KrakenRig_Data", parent=kSceneItem)
            krakenRigAttr = BoolAttribute('krakenRig', value=True, parent=krakenRigDataAttrGrp)
            krakenRigAttr.setLock(True)

            self.buildAttributeGroup(krakenRigDataAttrGrp)
            self.buildBoolAttribute(krakenRigAttr)

            # Put Rig Data on DCC Item
            metaData = kSceneItem.getMetaData()
            if 'guideData' in metaData:
                pureJSON = metaData['guideData']

                krakenRigDataAttr = StringAttribute('krakenRigData', value=json.dumps(pureJSON, indent=None).replace('"', '\\"'), parent=krakenRigDataAttrGrp)
                krakenRigDataAttr.setLock(True)

                self.buildStringAttribute(krakenRigDataAttr)

        return dccSceneItem

    def buildLayer(self, kSceneItem, buildName):
        """Builds a layer object.

        Args:
            kSceneItem (Object): kSceneItem that represents a layer to
                be built.
            buildName (str): The name to use on the built object.

        Returns:
            object: Node that is created.

        """

        parentNode = self.getDCCSceneItem(kSceneItem.getParent())

        obj = MaxPlus.Factory.CreateHelperObject(MaxPlus.ClassIds.Point)
        node = MaxPlus.Factory.CreateNode(obj, buildName)
        node.SetHidden(True)

        if parentNode is not None:
            node.SetParent(parentNode)

        dccSceneItem = node

        self._registerSceneItemPair(kSceneItem, dccSceneItem)

        return dccSceneItem

    def buildHierarchyGroup(self, kSceneItem, buildName):
        """Builds a hierarchy group object.

        Args:
            kSceneItem (Object): kSceneItem that represents a group to
                be built.
            buildName (str): The name to use on the built object.

        Return:
            object: DCC Scene Item that is created.

        """

        parentNode = self.getDCCSceneItem(kSceneItem.getParent())

        obj = MaxPlus.Factory.CreateHelperObject(MaxPlus.ClassIds.Point)
        node = MaxPlus.Factory.CreateNode(obj, buildName)
        node.SetHidden(True)

        if parentNode is not None:
            node.SetParent(parentNode)

        dccSceneItem = node

        self._registerSceneItemPair(kSceneItem, dccSceneItem)

        return dccSceneItem

    def buildGroup(self, kSceneItem, buildName):
        """Builds a group object.

        Args:
            kSceneItem (Object): kSceneItem that represents a group to
                be built.
            buildName (str): The name to use on the built object.

        Returns:
            object: Node that is created.

        """

        parentNode = self.getDCCSceneItem(kSceneItem.getParent())

        obj = MaxPlus.Factory.CreateHelperObject(MaxPlus.ClassIds.Point)
        node = MaxPlus.Factory.CreateNode(obj, buildName)
        node.SetHidden(True)

        if parentNode is not None:
            node.SetParent(parentNode)

        dccSceneItem = node

        self._registerSceneItemPair(kSceneItem, dccSceneItem)

        return dccSceneItem

    def buildJoint(self, kSceneItem, buildName):
        """Builds a joint object.

        Args:
            kSceneItem (Object): kSceneItem that represents a joint to
                be built.
            buildName (str): The name to use on the built object.

        Return:
            object: DCC Scene Item that is created.

        """

        parentNode = self.getDCCSceneItem(kSceneItem.getParent())

        dccSceneItem = None

        bone = pymxs.runtime.boneSys.createBone(rt.Point3(0, 0, 0), rt.Point3(1, 0, 0), rt.Point3(0, 0, 1))
        rdmHash = random.getrandbits(128)
        bone.Name = str(rdmHash)

        node = [x for x in MaxPlus.Core.GetRootNode().Children if x.Name == str(rdmHash)][0]
        node.SetName(buildName)
        node.BaseObject.ParameterBlock.Length.Value = 10.0
        node.BaseObject.ParameterBlock.Width.Value = kSceneItem.getRadius() * 2.5
        node.BaseObject.ParameterBlock.Height.Value = kSceneItem.getRadius() * 2.5

        if parentNode is not None:
            node.SetParent(parentNode)

        dccSceneItem = node

        self._registerSceneItemPair(kSceneItem, dccSceneItem)

        return dccSceneItem

    def buildLocator(self, kSceneItem, buildName):
        """Builds a locator / null object.

        Args:
            kSceneItem (Object): locator / null object to be built.
            buildName (str): The name to use on the built object.

        Returns:
            object: Node that is created.

        """

        parentNode = self.getDCCSceneItem(kSceneItem.getParent())

        obj = MaxPlus.Factory.CreateHelperObject(MaxPlus.ClassIds.Point)
        node = MaxPlus.Factory.CreateNode(obj, buildName)
        node.SetHidden(True)

        if parentNode is not None:
            node.SetParent(parentNode)

        dccSceneItem = node

        self._registerSceneItemPair(kSceneItem, dccSceneItem)

        return dccSceneItem

    def buildCurve(self, kSceneItem, buildName):
        """Builds a Curve object.

        Args:
            kSceneItem (Object): kSceneItem that represents a curve to
                be built.
            buildName (str): The name to use on the built object.

        Returns:
            object: Node that is created.

        """

        parentNode = self.getDCCSceneItem(kSceneItem.getParent())

        kSceneItem.scalePoints(Vec3(10, 10, 10))

        curveData = kSceneItem.getCurveData()

        obj = MaxPlus.Factory.CreateShapeObject(MaxPlus.ClassIds.SplineShape)
        shapeObj = MaxPlus.SplineShape__CastFrom(obj)
        splineShape = shapeObj.GetShape()
        splineShape.NewShape()

        for i, eachSubCurve in enumerate(curveData):
            closedSubCurve = eachSubCurve['closed']
            degreeSubCurve = eachSubCurve['degree']
            points = eachSubCurve['points']

            spline = splineShape.NewSpline()

            if degreeSubCurve == 1:
                knotType = MaxPlus.SplineKnot.CornerKnot
                lineType = MaxPlus.SplineKnot.LineLineType
            else:
                knotType = MaxPlus.SplineKnot.AutoKnot
                lineType = MaxPlus.SplineKnot.CurveLineType

            for point in points:
                point = MaxPlus.Point3(point[0], point[1], point[2])
                spline.AddKnot(MaxPlus.SplineKnot(knotType, lineType, point, point, point))

            if closedSubCurve:
                spline.SetClosed(True)

        crvNode = MaxPlus.Factory.CreateNode(obj)
        crvNode.Name = buildName

        if parentNode is not None:
            crvNode.SetParent(parentNode)

        dccSceneItem = crvNode

        self._registerSceneItemPair(kSceneItem, dccSceneItem)

        return dccSceneItem

    def buildControl(self, kSceneItem, buildName):
        """Builds a Control object.

        Args:
            kSceneItem (Object): kSceneItem that represents a control to
                be built.
            buildName (str): The name to use on the built object.

        Returns:
            object: Node that is created.

        """

        parentNode = self.getDCCSceneItem(kSceneItem.getParent())

        kSceneItem.scalePoints(Vec3(10, 10, 10))

        curveData = kSceneItem.getCurveData()

        obj = MaxPlus.Factory.CreateShapeObject(MaxPlus.ClassIds.SplineShape)
        shapeObj = MaxPlus.SplineShape__CastFrom(obj)
        splineShape = shapeObj.GetShape()
        splineShape.NewShape()

        for i, eachSubCurve in enumerate(curveData):
            closedSubCurve = eachSubCurve['closed']
            degreeSubCurve = eachSubCurve['degree']
            points = eachSubCurve['points']

            spline = splineShape.NewSpline()

            if degreeSubCurve == 1:
                knotType = MaxPlus.SplineKnot.CornerKnot
                lineType = MaxPlus.SplineKnot.LineLineType
            else:
                knotType = MaxPlus.SplineKnot.AutoKnot
                lineType = MaxPlus.SplineKnot.CurveLineType

            for point in points:
                point = MaxPlus.Point3(point[0], point[1], point[2])
                spline.AddKnot(MaxPlus.SplineKnot(knotType, lineType, point, point, point))

            if closedSubCurve:
                spline.SetClosed(True)

        crvNode = MaxPlus.Factory.CreateNode(obj)
        crvNode.Name = buildName

        if parentNode is not None:
            crvNode.SetParent(parentNode)

        dccSceneItem = crvNode

        self._registerSceneItemPair(kSceneItem, dccSceneItem)

        return dccSceneItem

    # ========================
    # Attribute Build Methods
    # ========================
    def buildBoolAttribute(self, kAttribute):
        """Builds a Bool attribute.

        Args:
            kAttribute (Object): kAttribute that represents a boolean
                attribute to be built.

        Return:
            bool: True if successful.

        """

        if kAttribute.getParent().getName() == 'implicitAttrGrp':
            return False

        parentDCCSceneItem = self.getDCCSceneItem(kAttribute.getParent().getParent())
        parentObject3D = kAttribute.getParent().getParent()
        parentAttrGroup = kAttribute.getParent()

        MaxPlus.SelectionManager.ClearNodeSelection()
        parentDCCSceneItem.Select()

        rt.execute('targetObj = selection[1]')
        customAttr = getattr(rt.targetObj, kAttribute.getParent().getName(), None)

        if customAttr is None:
            raise AttributeError('Could not find Attribute Group: {0} on {1}'.format(parentAttrGroup.getName(), parentObject3D.getName()))

        # Get Attribute
        dataDef = rt.CustAttributes.getDef(customAttr)
        defSource = dataDef.source
        defLines = defSource.splitlines()
        endParamIndex = defLines.index('            -- Param Def End')
        endRolloutIndex = defLines.index('            -- Rollout Def End')

        # Create param format data
        formatData = {
            'padding': '\t\t\t',
            'paramName': kAttribute.getName(),
            'initValue': str(kAttribute.getValue()).lower(),
            'enabled': str(not kAttribute.getLock()).lower()
        }

        newParamLine = '{padding}{paramName} type: #boolean ui:{paramName} default: {initValue}'
        defLines.insert(endParamIndex, newParamLine.format(**formatData))

        newRolloutLine = '{padding}checkbox {paramName} "{paramName}" type: #boolean enabled: {enabled}'
        defLines.insert(endRolloutIndex, newRolloutLine.format(**formatData))

        newDef = '\n'.join(defLines)
        rt.CustAttributes.redefine(dataDef, newDef)

        parentDCCSceneItem.Deselect()

        dccSceneItem = dataDef

        self._registerSceneItemPair(kAttribute, (parentDCCSceneItem, customAttr, kAttribute.getName()))

        return True

    def buildScalarAttribute(self, kAttribute):
        """Builds a Float attribute.

        Args:
            kAttribute (Object): kAttribute that represents a float attribute
                to be built.

        Return:
            bool: True if successful.

        """

        if kAttribute.getParent().getName() == 'implicitAttrGrp':
            return False

        parentDCCSceneItem = self.getDCCSceneItem(kAttribute.getParent().getParent())
        parentObject3D = kAttribute.getParent().getParent()
        parentAttrGroup = kAttribute.getParent()

        MaxPlus.SelectionManager.ClearNodeSelection()
        parentDCCSceneItem.Select()

        rt.execute('targetObj = selection[1]')
        customAttr = getattr(rt.targetObj, kAttribute.getParent().getName(), None)

        if customAttr is None:
            raise AttributeError('Could not find Attribute Group: {0} on {1}'.format(parentAttrGroup.getName(), parentObject3D.getName()))

        # Get Attribute
        dataDef = rt.CustAttributes.getDef(customAttr)
        defSource = dataDef.source
        defLines = defSource.splitlines()
        endParamIndex = defLines.index('            -- Param Def End')
        endRolloutIndex = defLines.index('            -- Rollout Def End')

        # Create param format data
        formatData = {
            'padding': '\t\t\t',
            'paramName': kAttribute.getName(),
            'initValue': str(kAttribute.getValue()).lower(),
            'enabled': str(not kAttribute.getLock()).lower(),
            'minRange': kAttribute.getMin(),
            'maxRange': kAttribute.getMax()
        }

        newParamLine = '{padding}{paramName} type: #float ui:{paramName} default: {initValue}'
        defLines.insert(endParamIndex, newParamLine.format(**formatData))

        if formatData['minRange'] is not None and formatData['maxRange'] is not None:
            newRolloutLine = '{padding}spinner {paramName} "{paramName}" type: #float range:[{minRange}, {maxRange}, {initValue}] enabled: {enabled}'
        else:
            newRolloutLine = '{padding}spinner {paramName} "{paramName}" type: #float enabled: {enabled}'

        defLines.insert(endRolloutIndex, newRolloutLine.format(**formatData))

        newDef = '\n'.join(defLines)
        rt.CustAttributes.redefine(dataDef, newDef)

        parentDCCSceneItem.Deselect()

        dccSceneItem = dataDef

        self._registerSceneItemPair(kAttribute, (parentDCCSceneItem, customAttr, kAttribute.getName()))
        # self._registerSceneItemPair(kAttribute, dccSceneItem)

        return True

    def buildIntegerAttribute(self, kAttribute):
        """Builds a Integer attribute.

        Args:
            kAttribute (Object): kAttribute that represents a integer attribute to be built.

        Return:
            bool: True if successful.

        """

        if kAttribute.getParent().getName() == 'implicitAttrGrp':
            return False

        parentDCCSceneItem = self.getDCCSceneItem(kAttribute.getParent().getParent())
        parentObject3D = kAttribute.getParent().getParent()
        parentAttrGroup = kAttribute.getParent()

        MaxPlus.SelectionManager.ClearNodeSelection()
        parentDCCSceneItem.Select()

        rt.execute('targetObj = selection[1]')
        customAttr = getattr(rt.targetObj, kAttribute.getParent().getName(), None)

        if customAttr is None:
            raise AttributeError('Could not find Attribute Group: {0} on {1}'.format(parentAttrGroup.getName(), parentObject3D.getName()))

        # Get Attribute
        dataDef = rt.CustAttributes.getDef(customAttr)
        defSource = dataDef.source
        defLines = defSource.splitlines()
        endParamIndex = defLines.index('            -- Param Def End')
        endRolloutIndex = defLines.index('            -- Rollout Def End')

        # Create param format data
        formatData = {
            'padding': '\t\t\t',
            'paramName': kAttribute.getName(),
            'initValue': str(kAttribute.getValue()).lower(),
            'enabled': str(not kAttribute.getLock()).lower(),
            'minRange': kAttribute.getMin(),
            'maxRange': kAttribute.getMax()
        }

        newParamLine = '{padding}{paramName} type: #integer ui:{paramName} default: {initValue}'
        defLines.insert(endParamIndex, newParamLine.format(**formatData))

        if formatData['minRange'] is not None and formatData['maxRange'] is not None:
            newRolloutLine = '{padding}spinner {paramName} "{paramName}" type: #integer range:[{minRange}, {maxRange}, {initValue}] enabled: {enabled}'
        else:
            newRolloutLine = '{padding}spinner {paramName} "{paramName}" type: #integer enabled: {enabled}'

        defLines.insert(endRolloutIndex, newRolloutLine.format(**formatData))

        newDef = '\n'.join(defLines)
        rt.CustAttributes.redefine(dataDef, newDef)

        parentDCCSceneItem.Deselect()

        dccSceneItem = dataDef

        self._registerSceneItemPair(kAttribute, (parentDCCSceneItem, customAttr, kAttribute.getName()))

        return True

    def buildStringAttribute(self, kAttribute):
        """Builds a String attribute.

        Args:
            kAttribute (Object): kAttribute that represents a string attribute
                to be built.

        Return:
            bool: True if successful.

        """

        if kAttribute.getParent().getName() == 'implicitAttrGrp':
            return False

        parentDCCSceneItem = self.getDCCSceneItem(kAttribute.getParent().getParent())
        parentObject3D = kAttribute.getParent().getParent()
        parentAttrGroup = kAttribute.getParent()

        MaxPlus.SelectionManager.ClearNodeSelection()
        parentDCCSceneItem.Select()

        rt.execute('targetObj = selection[1]')
        customAttr = getattr(rt.targetObj, kAttribute.getParent().getName(), None)

        if customAttr is None:
            raise AttributeError('Could not find Attribute Group: {0} on {1}'.format(parentAttrGroup.getName(), parentObject3D.getName()))

        # Get Attribute
        dataDef = rt.CustAttributes.getDef(customAttr)
        defSource = dataDef.source
        defLines = defSource.splitlines()
        endParamIndex = defLines.index('            -- Param Def End')
        endRolloutIndex = defLines.index('            -- Rollout Def End')

        # Create param format data
        formatData = {
            'padding': '\t\t\t',
            'paramName': kAttribute.getName(),
            'initValue': kAttribute.getValue(),
            'enabled': str(not kAttribute.getLock()).lower()
        }

        newParamLine = '{padding}{paramName} type:#string ui:{paramName} default:"{initValue}"'
        defLines.insert(endParamIndex, newParamLine.format(**formatData))

        newRolloutLine = '{padding}edittext {paramName} "{paramName}" type:#string enabled:{enabled}'
        defLines.insert(endRolloutIndex, newRolloutLine.format(**formatData))

        newDef = '\n'.join(defLines)
        rt.CustAttributes.redefine(dataDef, newDef)

        parentDCCSceneItem.Deselect()

        dccSceneItem = dataDef

        self._registerSceneItemPair(kAttribute, (parentDCCSceneItem, customAttr, kAttribute.getName()))

        return True

    def buildAttributeGroup(self, kAttributeGroup):
        """Builds attribute groups on the DCC object.

        Args:
            kAttributeGroup (object): Kraken object to build the attribute
                group on.

        Return:
            bool: True if successful.

        """

        parentDCCSceneItem = self.getDCCSceneItem(kAttributeGroup.getParent())

        MaxPlus.SelectionManager.ClearNodeSelection()
        parentDCCSceneItem.Select()

        groupName = kAttributeGroup.getName()
        if groupName == "implicitAttrGrp":
            return False

        attrDef = """attrGrpDesc=attributes {0}
        (
            parameters main rollout:{0}Rollout
            (
            -- Param Def Begin
            -- Param Def End
            )

            rollout {0}Rollout "{0}"
            (
            -- Rollout Def Begin
            -- Rollout Def End
            )
        )
        """.format(groupName)

        rt.execute('targetObj = selection[1]')
        count = rt.CustAttributes.count(rt.targetObj)

        rt.execute(attrDef)
        rt.CustAttributes.add(rt.targetObj, rt.attrGrpDesc)
        rt.CustAttributes.makeUnique(rt.targetObj, count + 1)

        parentDCCSceneItem.Deselect()

        attrCntrs = parentDCCSceneItem.BaseObject.GetCustomAttributeContainer()
        attrCntr = None
        for each in attrCntrs:
            if each.GetName() == groupName:
                attrCntr = each
                break

        dccSceneItem = attrCntr

        self._registerSceneItemPair(kAttributeGroup, dccSceneItem)

        return True

    def connectAttribute(self, kAttribute):
        """Connects the driver attribute to this one.

        Args:
            kAttribute (Object): Attribute to connect.

        Return:
            bool: True if successful.

        """

        if kAttribute.isConnected() is True:

            srcStr = None
            tgtStr = None

            # Detect if driver is visibility attribute and map to correct DCC
            # attribute
            driverAttr = kAttribute.getConnection()
            if driverAttr.getName() == 'visibility' and driverAttr.getParent().getName() == 'implicitAttrGrp':
                logger.warning('Connection to/from visibility is not supported currently!')
                pass
                # dccItem = self.getDCCSceneItem(driverAttr.getParent().getParent())
                # driver = dccItem.attr('visibility')

                # TODO: Figure out a valid reliable way to connect attributes to
                # and from visibility!

            elif driverAttr.getName() == 'shapeVisibility' and driverAttr.getParent().getName() == 'implicitAttrGrp':
                logger.warning('Connection to/from visibility is not supported currently!')
                pass
                # dccItem = self.getDCCSceneItem(driverAttr.getParent().getParent())
                # shape = dccItem.getShape()
                # driver = shape.attr('visibility')

                # TODO: Figure out a valid reliable way to connect attributes to
                # and from visibility!

            else:
                srcAttrGrpParent = self.getDCCSceneItem(kAttribute.getConnection().getParent().getParent())
                srcAttrGrpParent.Select()
                MaxPlus.Core.EvalMAXScript('srcAttrGrpParent = selection[1]')
                srcAttrGrpParent.Deselect()

                srcStr = 'srcAttrGrpParent.baseObject.{}[#{}]'.format(kAttribute.getConnection().getParent().getName(), kAttribute.getConnection().getName())

            # Detect if the driven attribute is a visibility attribute and map
            # to correct DCC attribute
            if kAttribute.getName() == 'visibility' and kAttribute.getParent().getName() == 'implicitAttrGrp':
                logger.warning('Connection to/from visibility is not supported currently!')
                pass
                # dccItem = self.getDCCSceneItem(kAttribute.getParent().getParent())
                # driven = dccItem.attr('visibility')

                # TODO: Figure out a valid reliable way to connect attributes to
                # and from visibility!

            elif kAttribute.getName() == 'shapeVisibility' and kAttribute.getParent().getName() == 'implicitAttrGrp':
                logger.warning('Connection to/from visibility is not supported currently!')
                pass
                # dccItem = self.getDCCSceneItem(kAttribute.getParent().getParent())
                # shape = dccItem.getShape()
                # driven = shape.attr('visibility')

                # TODO: Figure out a valid reliable way to connect attributes to
                # and from visibility!
            else:
                tgtAttrGrpParent = self.getDCCSceneItem(kAttribute.getParent().getParent())
                tgtAttrGrpParent.Select()
                MaxPlus.Core.EvalMAXScript('tgtAttrGrpParent = selection[1]')
                tgtAttrGrpParent.Deselect()

                tgtStr = 'tgtAttrGrpParent.baseObject.{}[#{}]'.format(kAttribute.getParent().getName(), kAttribute.getName())

            if srcStr is None or tgtStr is None:
                logger.warning('Connections to visiblity parameters is not currently supported.')
            else:
                MaxPlus.Core.EvalMAXScript('paramWire.connect {} {} "{}"'.format(srcStr, tgtStr, kAttribute.getConnection().getName()))

        return True


    # =========================
    # Constraint Build Methods
    # =========================
    def buildOrientationConstraint(self, kConstraint, buildName):
        """Builds an orientation constraint represented by the kConstraint.

        Args:
            kConstraint (Object): Kraken constraint object to build.

        Return:
            object: dccSceneItem that was created.

        """

        constraineeDCCSceneItem = self.getDCCSceneItem(kConstraint.getConstrainee())

        rotListClassID = MaxPlus.Class_ID(0x4b4b1003, 0x00000000) # Create Rotation List Controller
        rotListCtrl = MaxPlus.Factory.CreateRotationController(rotListClassID)

        rotCns = MaxPlus.Factory.CreateRotationController(MaxPlus.ClassIds.Orientation_Constraint)
        rotListCtrl.AssignController(rotCns, 0)

        rotCtrl = MaxPlus.Factory.CreateRotationController(MaxPlus.ClassIds.Euler_XYZ)

        if kConstraint.getMaintainOffset() is True:
            # Fabric's rotation order enums:
            # We need to use the negative rotation order
            # to calculate propery offset values.
            #
            # 0 XYZ
            # 1 YZX
            # 2 ZXY
            # 3 XZY
            # 4 ZYX
            # 5 YXZ

            rotOrderRemap = {
                0: 1,
                1: 3,
                2: 5,
                3: 2,
                4: 6,
                5: 4
            }

            order = rotOrderRemap[kConstraint.getConstrainee().ro.order]

            offsetAngles = offsetXfo.ori.toEulerAnglesWithRotOrder(
                RotationOrder(order))

            quat = MaxPlus.Quat()
            quat.SetEuler(math.radians(offsetAngles.x),
                          math.radians(offsetAngles.y),
                          math.radians(offsetAngles.z))

            rotCtrl.SetQuatValue(quat)

        rotListCtrl.AssignController(rotCtrl, 1)

        transform = constraineeDCCSceneItem.GetSubAnim(2)
        transform.AssignController(rotListCtrl, 1)

        for constrainer in [self.getDCCSceneItem(x) for x in kConstraint.getConstrainers()]:

            constrainer.Select()
            MaxPlus.Core.EvalMAXScript('constrainer = selection[1]')
            constrainer.Deselect()

            MaxPlus.Core.EvalMAXScript('constrainee.rotation.controller[1].appendTarget constrainer 50')

        dccSceneItem = rotListCtrl

        self._registerSceneItemPair(kConstraint, dccSceneItem)

        return dccSceneItem

    def buildPoseConstraint(self, kConstraint, buildName):
        """Builds an pose constraint represented by the kConstraint.

        Args:
            kConstraint (Object): kraken constraint object to build.

        Return:
            bool: True if successful.

        """

        constraineeDCCSceneItem = self.getDCCSceneItem(kConstraint.getConstrainee())

        offsetXfo = kConstraint.computeOffset()

        # ====================
        # Position Constraint
        # ====================
        constraineeDCCSceneItem = self.getDCCSceneItem(kConstraint.getConstrainee())

        posListClassID = MaxPlus.Class_ID(0x4b4b1002, 0x00000000) # Create Position List Controller
        posListCtrl = MaxPlus.Factory.CreatePositionController(posListClassID)

        posCtrl = MaxPlus.Factory.CreatePositionController(MaxPlus.ClassIds.Position_Constraint)
        posListCtrl.AssignController(posCtrl, 0)

        posCtrl = MaxPlus.Factory.CreatePositionController(MaxPlus.ClassIds.Position_XYZ)

        if kConstraint.getMaintainOffset() is True:
            posCtrl.SetPoint3Value(MaxPlus.Point3(offsetXfo.tr.x, offsetXfo.tr.y, offsetXfo.tr.z))

        posListCtrl.AssignController(posCtrl, 1)

        transform = constraineeDCCSceneItem.GetSubAnim(2)
        transform.AssignController(posListCtrl, 0)

        constraineeDCCSceneItem.Select()
        MaxPlus.Core.EvalMAXScript('constrainee = selection[1]')
        constraineeDCCSceneItem.Deselect()

        for constrainer in [self.getDCCSceneItem(x) for x in kConstraint.getConstrainers()]:

            constrainer.Select()
            MaxPlus.Core.EvalMAXScript('constrainer = selection[1]')
            constrainer.Deselect()

            MaxPlus.Core.EvalMAXScript('constrainee.position.controller[1].appendTarget constrainer 50')
            # MaxPlus.Core.EvalMAXScript('constrainee.position.controller.setName 1 "{}"'.format(buildName))


        # =======================
        # Orientation Constraint
        # =======================
        rotListClassID = MaxPlus.Class_ID(0x4b4b1003, 0x00000000) # Create Rotation List Controller
        rotListCtrl = MaxPlus.Factory.CreateRotationController(rotListClassID)

        rotCns = MaxPlus.Factory.CreateRotationController(MaxPlus.ClassIds.Orientation_Constraint)
        rotListCtrl.AssignController(rotCns, 0)

        rotCtrl = MaxPlus.Factory.CreateRotationController(MaxPlus.ClassIds.Euler_XYZ)

        if kConstraint.getMaintainOffset() is True:
            # Fabric's rotation order enums:
            # We need to use the negative rotation order
            # to calculate propery offset values.
            #
            # 0 XYZ
            # 1 YZX
            # 2 ZXY
            # 3 XZY
            # 4 ZYX
            # 5 YXZ

            rotOrderRemap = {
                0: 1,
                1: 3,
                2: 5,
                3: 2,
                4: 6,
                5: 4
            }

            order = rotOrderRemap[kConstraint.getConstrainee().ro.order]

            offsetAngles = offsetXfo.ori.toEulerAnglesWithRotOrder(
                RotationOrder(order))

            quat = MaxPlus.Quat()
            quat.SetEuler(math.radians(offsetAngles.x),
                          math.radians(offsetAngles.y),
                          math.radians(offsetAngles.z))

            rotCtrl.SetQuatValue(quat)

        rotListCtrl.AssignController(rotCtrl, 1)

        transform = constraineeDCCSceneItem.GetSubAnim(2)
        transform.AssignController(rotListCtrl, 1)

        for constrainer in [self.getDCCSceneItem(x) for x in kConstraint.getConstrainers()]:

            constrainer.Select()
            MaxPlus.Core.EvalMAXScript('constrainer = selection[1]')
            constrainer.Deselect()

            MaxPlus.Core.EvalMAXScript('constrainee.rotation.controller[1].appendTarget constrainer 50')

        # ====================
        # Scale Constraint
        # ====================
        # constraineeDCCSceneItem = self.getDCCSceneItem(kConstraint.getConstrainee())

        # sclListClassID = MaxPlus.Class_ID(0x4b4b1004, 0x00000000) # Create Position List Controller
        # sclListCtrl = MaxPlus.Factory.CreatePositionController(sclListClassID)

        # posCtrl = MaxPlus.Factory.CreatePositionController(MaxPlus.ClassIds.Position_Constraint)
        # sclListCtrl.AssignController(posCtrl, 0)

        # posCtrl = MaxPlus.Factory.CreatePositionController(MaxPlus.ClassIds.ScaleXYZ)

        # if kConstraint.getMaintainOffset() is True:
        #     posCtrl.SetPoint3Value(MaxPlus.Point3(offsetXfo.tr.x, offsetXfo.tr.y, offsetXfo.tr.z))

        # sclListCtrl.AssignController(posCtrl, 1)

        # transform = constraineeDCCSceneItem.GetSubAnim(2)
        # transform.AssignController(sclListCtrl, 0)

        # constraineeDCCSceneItem.Select()
        # MaxPlus.Core.EvalMAXScript('constrainee = selection[1]')
        # constraineeDCCSceneItem.Deselect()

        # for constrainer in [self.getDCCSceneItem(x) for x in kConstraint.getConstrainers()]:

        #     constrainer.Select()
        #     MaxPlus.Core.EvalMAXScript('constrainer = selection[1]')
        #     constrainer.Deselect()

        #     MaxPlus.Core.EvalMAXScript('constrainee.position.controller[1].appendTarget constrainer 50')

        dccSceneItem = posListCtrl

        self._registerSceneItemPair(kConstraint, dccSceneItem)

        return dccSceneItem

    def buildPositionConstraint(self, kConstraint, buildName):
        """Builds an position constraint represented by the kConstraint.

        Args:
            kConstraint (Object): Kraken constraint object to build.

        Return:
            bool: True if successful.

        """

        constraineeDCCSceneItem = self.getDCCSceneItem(kConstraint.getConstrainee())

        posListClassID = MaxPlus.Class_ID(0x4b4b1002, 0x00000000) # Create Position List Controller
        posListCtrl = MaxPlus.Factory.CreatePositionController(posListClassID)

        posCns = MaxPlus.Factory.CreatePositionController(MaxPlus.ClassIds.Position_Constraint)
        posListCtrl.AssignController(posCns, 0)

        posCtrl = MaxPlus.Factory.CreatePositionController(MaxPlus.ClassIds.Position_XYZ)
        posListCtrl.AssignController(posCtrl, 1)

        transform = tgtNode.GetSubAnim(2)
        transform.AssignController(posListCtrl, 0)

        constraineeDCCSceneItem.Select()
        MaxPlus.Core.EvalMAXScript('constrainee = selection[1]')
        constraineeDCCSceneItem.Deselect()

        for constrainer in kConstraint.getConstrainers():

            constrainer.Select()
            MaxPlus.Core.EvalMAXScript('constrainer = selection[1]')
            constrainer.Deselect()

            MaxPlus.Core.EvalMAXScript('constrainee.position.controller[1].appendTarget constrainer 50')
            MaxPlus.Core.EvalMAXScript('constrainee.position.controller.setName 1 "{}"'.format(buildName))

        if kConstraint.getMaintainOffset() is True:
            offsetXfo = kConstraint.computeOffset()
            offsetStr = "{} {} {}".format(offsetXfo.tr.x,
                                          offsetXfo.tr.y,
                                          offsetXfo.tr.z)

            # Set offsets on the scale constraint
            MaxPlus.Core.EvalMAXScript('constrainee.position.controller.setActive 2')
            MaxPlus.Core.EvalMAXScript('constrainee.position.controller[2].value = Point3 ' + offsetStr)
            MaxPlus.Core.EvalMAXScript('constrainee.position.controller.setActive 1')

        dccSceneItem = posListCtrl

        self._registerSceneItemPair(kConstraint, dccSceneItem)

        return dccSceneItem

    def buildScaleConstraint(self, kConstraint, buildName):
        """Builds an scale constraint represented by the kConstraint.

        Args:
            kConstraint (Object): Kraken constraint object to build.

        Return:
            bool: True if successful.

        """

        constraineeDCCSceneItem = self.getDCCSceneItem(kConstraint.getConstrainee())
        dccSceneItem = None # pm.scaleConstraint(
        #     [self.getDCCSceneItem(x) for x in kConstraint.getConstrainers()],
        #     constraineeDCCSceneItem,
        #     name=buildName,
        #     maintainOffset=kConstraint.getMaintainOffset())

        # if kConstraint.getMaintainOffset() is True:
        #     offsetXfo = kConstraint.computeOffset()

        #     # Set offsets on the scale constraint
        #     dccSceneItem.offset.set([offsetXfo.sc.x,
        #                              offsetXfo.sc.y,
        #                              offsetXfo.sc.z])

        self._registerSceneItemPair(kConstraint, dccSceneItem)

        return dccSceneItem


    # =========================
    # Operator Builder Methods
    # =========================
    def buildKLOperator(self, kOperator, buildName):
        """Builds KL Operators on the components.

        Args:
            kOperator (Object): Kraken operator that represents a KL
                operator.
            buildName (str): The name to use on the built object.

        Return:
            bool: True if successful.

        """

        # Code to build KL and Canvas based Operators has been merged.
        # It's important to note here that the 'isKLBased' argument is set
        # to true.
        self.buildCanvasOperator(kOperator, buildName, isKLBased=True)

        return True

    def buildCanvasOperator(self, kOperator, buildName, isKLBased=False):
        """Builds Canvas Operators on the components.

        Args:
            kOperator (object): Kraken operator that represents a Canvas
                operator.
            buildName (str): The name to use on the built object.
            isKLBased (bool): Whether the solver is based on a KL object.

        Return:
            bool: True if successful.

        """

        def validatePortValue(rtVal, portName, portDataType):
            """Validate port value type when passing built in Python types.

            Args:
                rtVal (RTVal): rtValue object.
                portName (str): Name of the argument being validated.
                portDataType (str): Type of the argument being validated.

            """

            # Validate types when passing a built in Python type
            if type(rtVal) in (bool, str, int, float):
                if portDataType in ('Scalar', 'Float32', 'UInt32'):
                    if type(rtVal) not in (float, int):
                        raise TypeError(kOperator.getName() + ".evaluate(): Invalid Argument Value: " + str(rtVal) + " (" + type(rtVal).__name__ + "), for Argument: " + portName + " (" + portDataType + ")")

                elif portDataType == 'Boolean':
                    if type(rtVal) != bool and not (type(rtVal) == int and (rtVal == 0 or rtVal == 1)):
                        raise TypeError(kOperator.getName() + ".evaluate(): Invalid Argument Value: " + str(rtVal) + " (" + type(rtVal).__name__ + "), for Argument: " + portName + " (" + portDataType + ")")

                elif portDataType == 'String':
                    if type(rtVal) != str:
                        raise TypeError(kOperator.getName() + ".evaluate(): Invalid Argument Value: " + str(rtVal) + " (" + type(rtVal).__name__ + "), for Argument: " + portName + " (" + portDataType + ")")

        try:
            if isKLBased is True:
                ports = kOperator.getSolverArgs()
                portCount = len(ports)

                def findPortOfType(dataTypes, connectionTypes):
                        for i in xrange(portCount):
                            arg = ports[i]
                            # argName = arg.name.getSimpleType()
                            argDataType = arg.dataType.getSimpleType()
                            argConnectionType = arg.connectionType.getSimpleType()

                            if argDataType in dataTypes and argConnectionType in connectionTypes:
                                return i

                        return -1

                # Find operatorOwner to attach Canvas Operator to.
                ownerOutPortIndex = findPortOfType(['Mat44', 'Mat44[]'], ['Out', 'IO'])
                if ownerOutPortIndex is -1:
                    raise Exception("Solver '" + kOperator.getName() + "' has no Mat44 outputs!")

                ownerArg = ports[ownerOutPortIndex]
                ownerArgName = ownerArg.name.getSimpleType()
                ownerArgDataType = ownerArg.dataType.getSimpleType()
                # ownerArgConnectionType = ownerArg.connectionType.getSimpleType()

                if ownerArgDataType == 'Mat44[]':
                    operatorOwner = self.getDCCSceneItem(kOperator.getOutput(ownerArgName)[0])
                    ownerArgName = ownerArgName + str(0)
                else:
                    operatorOwner = self.getDCCSceneItem(kOperator.getOutput(ownerArgName))

                operatorOwner.Select()
                MaxPlus.Core.EvalMAXScript('operatorOwner = selection[1]')
                operatorOwner.Deselect()

                MaxPlus.Core.EvalMAXScript('matCtrl = FabricMatrixController()')
                self._registerSceneItemPair(kOperator, rt.matCtrl)

                rt.operatorOwner.controller = rt.matCtrl

                config = Config.getInstance()
                nameTemplate = config.getNameTemplate()
                typeTokens = nameTemplate['types']
                opTypeToken = typeTokens.get(type(kOperator).__name__, 'op')
                solverNodeName = '_'.join([kOperator.getName(), opTypeToken])
                solverSolveNodeName = '_'.join([kOperator.getName(), 'solve', opTypeToken])

                rt.matCtrl.DFGSetExtDeps(kOperator.getExtension())

                solverTypeName = kOperator.getSolverTypeName()

                # Create Solver Function Node
                dfgEntry = "dfgEntry {\n  solver = " + solverTypeName + "();\n}"
                solverNodeCode = "{}\n\n{}".format('require ' + kOperator.getExtension() + ';', dfgEntry)

                rt.matCtrl.DFGAddFunc(solverNodeName,  # title
                                      solverNodeCode,  # code
                                      rt.Point2(-220, 100),  # position
                                      execPath="")

                rt.matCtrl.DFGAddPort("solver",  # desiredPortName
                                      2,  # portType
                                      solverTypeName,  # typeSpec
                                      portToConnect="",
                                      extDep=kOperator.getExtension(),
                                      metaData="",
                                      execPath=solverNodeName)

                solverVarName = rt.matCtrl.DFGAddVar("solverVar",
                                     solverTypeName,  # desiredNodeName
                                     kOperator.getExtension(),  # extDep
                                     rt.Point2(-75, 100),  # position
                                     execPath="")

                rt.matCtrl.DFGConnect(solverNodeName + ".solver",  # srcPortPath
                                      solverVarName + ".value",  # dstPortPath
                                      execPath="")

                # Crate Solver "Solve" Function Node
                rt.matCtrl.DFGAddFunc(solverSolveNodeName,  # title
                                      "dfgEntry {}",  # code
                                      rt.Point2(100, 100),  # position
                                      execPath="")

                rt.matCtrl.DFGAddPort("solver",  # desiredPortName
                                      1,  # portType
                                      solverTypeName,  # typeSpec
                                      portToConnect="",
                                      extDep=kOperator.getExtension(),
                                      metaData="",
                                      execPath=solverSolveNodeName)

                rt.matCtrl.DFGConnect(solverVarName + ".value",  # srcPortPath
                                      solverSolveNodeName + ".solver",  # dstPortPath
                                      execPath="")

                rt.matCtrl.DFGConnect(solverSolveNodeName + ".solver",  # srcPortPath
                                      "exec",  # dstPortPath
                                      execPath="")
            else:
                host = ks.getCoreClient().DFG.host
                opBinding = host.createBindingToPreset(kOperator.getPresetPath())
                node = opBinding.getExec()

                portTypeMap = {
                    0: 'In',
                    1: 'IO',
                    2: 'Out'
                }

                ownerOutPortData = {
                    'name': None,
                    'typeSpec': None,
                    'execPortType': None
                }

                for i in xrange(node.getExecPortCount()):
                    portName = node.getExecPortName(i)
                    portType = node.getExecPortType(i)
                    rtVal = opBinding.getArgValue(portName)
                    typeSpec = rtVal.getTypeName().getSimpleType()

                    if typeSpec in ['Mat44', 'Mat44[]'] and portTypeMap[portType] in ['Out', 'IO']:
                        ownerOutPortData['name'] = portName
                        ownerOutPortData['typeSpec'] = typeSpec
                        ownerOutPortData['execPortType'] = portTypeMap[portType]
                        break

                # Find operatorOwner to attach Splice Operator to.
                if ownerOutPortData['name'] is None:
                    raise Exception("Graph '" + uniqueNodeName + "' has no Mat44 outputs!")

                ownerOutPortName = ownerOutPortData['name']
                ownerOutPortDataType = ownerOutPortData['typeSpec']
                # ownerOutPortConnectionType = ownerOutPortData['execPortType']

                if ownerOutPortDataType == 'Mat44[]':
                    operatorOwner = self.getDCCSceneItem(kOperator.getOutput(ownerOutPortName)[0])
                    ownerOutPortName = ownerOutPortName + str(0)
                else:
                    operatorOwner = self.getDCCSceneItem(kOperator.getOutput(ownerOutPortName))

                operatorOwner.Select()
                MaxPlus.Core.EvalMAXScript('operatorOwner = selection[1]')
                operatorOwner.Deselect()

                MaxPlus.Core.EvalMAXScript('matCtrl = FabricMatrixController()')
                self._registerSceneItemPair(kOperator, rt.matCtrl)

                rt.operatorOwner.controller = rt.matCtrl

                rt.matCtrl.DFGSetExtDeps("Kraken")

                graphNodeName = rt.matCtrl.DFGInstPreset(kOperator.getPresetPath(),  # presetPath
                                         rt.Point2(100, 100))  # position

            portCount = 0
            if isKLBased is True:
                portCount = len(kOperator.getSolverArgs())
            else:
                portCount = node.getExecPortCount()

            for i in xrange(portCount):

                if isKLBased is True:
                    args = kOperator.getSolverArgs()
                    arg = args[i]
                    portName = arg.name.getSimpleType()
                    portConnectionType = arg.connectionType.getSimpleType()
                    portDataType = arg.dataType.getSimpleType()
                else:
                    portName = node.getExecPortName(i)
                    portConnectionType = portTypeMap[node.getExecPortType(i)]
                    rtVal = opBinding.getArgValue(portName)
                    portDataType = rtVal.getTypeName().getSimpleType()

                if portConnectionType == 'In':
                    if isKLBased is True:
                        rt.matCtrl.DFGAddPort(portName,  # desiredPortName
                                              0,  # portType
                                              portDataType,  # typeSpec
                                              portToConnect="",
                                              extDep="",
                                              metaData="",
                                              execPath="")

                        rt.matCtrl.DFGAddPort(portName,  # desiredPortName
                                              0,  # portType
                                              portDataType,  # typeSpec
                                              portToConnect="",
                                              extDep="",
                                              metaData="",
                                              execPath=solverSolveNodeName)

                        rt.matCtrl.DFGConnect(portName,  # srcPortPath
                                              solverSolveNodeName + "." + portName,  # dstPortPath
                                              execPath="")

                    else:
                        if portDataType != 'Execute':
                            rt.matCtrl.DFGAddPort(portName,  # desiredPortName
                                                  0,  # portType
                                                  portDataType,  # typeSpec
                                                  portToConnect="",
                                                  extDep="",
                                                  metaData="",
                                                  execPath="")

                        rt.matCtrl.DFGConnect(portName,  # srcPortPath
                                              graphNodeName + "." + portName,  # dstPortPath
                                              execPath="")

                elif portConnectionType in ['IO', 'Out']:

                    if portDataType in ('Execute', 'InlineInstance', 'DrawingHandle'):
                        # Don't expose invalid Maya data type InlineInstance, instead connect to exec port
                        dstPortPath = "exec"
                    else:
                        dstPortPath = portName

                    if isKLBased is True:
                        srcPortNode = solverSolveNodeName
                        rt.matCtrl.DFGAddPort(portName,  # desiredPortName
                                              2,  # portType
                                              portDataType,  # typeSpec
                                              portToConnect="",
                                              extDep="",
                                              metaData="",
                                              execPath=solverSolveNodeName)
                    else:
                        srcPortNode = graphNodeName

                    if portDataType not in ('Execute', 'InlineInstance', 'DrawingHandle'):
                        rt.matCtrl.DFGAddPort(portName,  # desiredPortName
                                              2,  # portType
                                              portDataType,  # typeSpec
                                              portToConnect="",
                                              extDep="",
                                              metaData="",
                                              execPath="")

                    rt.matCtrl.DFGConnect(srcPortNode + "." + portName,  # srcPortPath
                                          dstPortPath,  # dstPortPath
                                          execPath="")

                else:
                    raise Exception("Invalid connection type:" + portConnectionType)

                if portDataType == 'EvalContext':
                    continue
                elif portDataType == 'Execute':
                    continue
                elif portDataType == 'DrawingHandle':
                    continue
                elif portDataType == 'InlineDebugShape':
                    continue
                elif portDataType == 'Execute' and portName == 'exec':
                    continue

                if portName == 'time':
                    print "Set Expression on 'time' parameter!"
                    # pm.expression(o=canvasNode + '.time', s=canvasNode + '.time = time;')
                    continue
                if portName == 'frame':
                    print "Set Expression on 'frame' parameter!"
                    # pm.expression(o=canvasNode + '.frame', s=canvasNode + '.frame = frame;')
                    continue

                # Get the port's input from the DCC
                if portConnectionType == 'In':
                    connectedObjects = kOperator.getInput(portName)
                elif portConnectionType in ['IO', 'Out']:
                    connectedObjects = kOperator.getOutput(portName)

                if portDataType.endswith('[]'):

                    # In CanvasMaya, output arrays are not resized by the system
                    # prior to calling into Canvas, so we explicily resize the
                    # arrays in the generated operator stub code.
                    if connectedObjects is None:
                        connectedObjects = []

                    connectionTargets = []
                    for i in xrange(len(connectedObjects)):
                        opObject = connectedObjects[i]
                        dccSceneItem = self.getDCCSceneItem(opObject)

                        if hasattr(opObject, "getName"):
                            # Handle output connections to visibility attributes.
                            if opObject.getName() == 'visibility' and opObject.getParent().getName() == 'implicitAttrGrp':
                                logger.warning('Connection to/from visibility is not supported currently!')
                                pass
                                # dccItem = self.getDCCSceneItem(opObject.getParent().getParent())
                                # dccSceneItem = dccItem.attr('visibility')
                            elif opObject.getName() == 'shapeVisibility' and opObject.getParent().getName() == 'implicitAttrGrp':
                                logger.warning('Connection to/from visibility is not supported currently!')
                                pass
                                # dccItem = self.getDCCSceneItem(opObject.getParent().getParent())
                                # shape = dccItem.getShape()
                                # dccSceneItem = shape.attr('visibility')

                        connectionTargets.append(
                            {
                                'opObject': opObject,
                                'dccSceneItem': dccSceneItem
                            })
                else:
                    if connectedObjects is None:
                        if isKLBased:
                            opType = kOperator.getExtension() + ":" + kOperator.getSolverTypeName()
                        else:
                            opType = kOperator.getPresetPath()

                        logger.warning("Operator '" + solverSolveNodeName +
                                       "' of type '" + opType +
                                       "' port '" + portName + "' not connected.")

                    opObject = connectedObjects
                    dccSceneItem = self.getDCCSceneItem(opObject)
                    if hasattr(opObject, "getName"):
                        # Handle output connections to visibility attributes.
                        if opObject.getName() == 'visibility' and opObject.getParent().getName() == 'implicitAttrGrp':
                            logger.warning('Connection to/from visibility is not supported currently!')
                            pass
                            # dccItem = self.getDCCSceneItem(opObject.getParent().getParent())
                            # dccSceneItem = dccItem.attr('visibility')
                        elif opObject.getName() == 'shapeVisibility' and opObject.getParent().getName() == 'implicitAttrGrp':
                            logger.warning('Connection to/from visibility is not supported currently!')
                            pass
                            # dccItem = self.getDCCSceneItem(opObject.getParent().getParent())
                            # shape = dccItem.getShape()
                            # dccSceneItem = shape.attr('visibility')

                    connectionTargets = {
                        'opObject': opObject,
                        'dccSceneItem': dccSceneItem
                    }

                # Add the Canvas Port for each port.
                if portConnectionType == 'In':

                    def connectInput(tgt, opObject, dccSceneItem, isArrayPort=False):
                        if isinstance(opObject, Attribute):

                            node = dccSceneItem[0]
                            attributeGrp = dccSceneItem[1].name
                            attributeName = dccSceneItem[2]

                            node.Select()
                            MaxPlus.Core.EvalMAXScript('srcAttrParentObj = selection[1]')
                            node.Deselect()

                            srcStr = 'srcAttrParentObj.baseObject.{}[#{}]'.format(attributeGrp, attributeName)
                            tgtStr = 'operatorOwner.transform.controller[#{}]'.format(tgt)

                            MaxPlus.Core.EvalMAXScript('paramWire.connect {} {} "{}"'.format(srcStr, tgtStr, attributeName))

                        elif isinstance(opObject, Object3D):
                            dccSceneItem.Select()
                            MaxPlus.Core.EvalMAXScript('srcMatrixObj = selection[1]')
                            dccSceneItem.Deselect()

                            if isArrayPort is True:
                                # Set port to MaxNode mode to connect object
                                rt.matCtrl.SetMaxTypeForArg(tgt, 2065)

                                # TODO: Get Array inputs working!

                            else:
                                # Set port to MaxNode mode to connect object
                                rt.matCtrl.SetMaxTypeForArg(tgt, 17)

                                setattr(rt.matCtrl, tgt, rt.srcMatrixObj)

                        elif isinstance(opObject, Xfo):
                            # self.setMat44Attr(tgt.partition(".")[0], tgt.partition(".")[2], opObject.toMat44())

                            logger.warning("Setting Xfo values: {} to {}".format(
                                str(opObject.toMat44()), tgt))

                        elif isinstance(opObject, Mat44):
                            # self.setMat44Attr(tgt.partition(".")[0], tgt.partition(".")[2], opObject)

                            logger.warning("Setting Mat44 values: {} to {}".format(
                                str(opObject), tgt))

                        elif isinstance(opObject, Vec2):
                            # pm.setAttr(tgt, opObject.x, opObject.y, type="double2")

                            logger.warning("Setting Vec2 values: {} to {}".format(
                                str((opObject.x, opObject.y)), tgt))

                        elif isinstance(opObject, Vec3):
                            # pm.setAttr(tgt, opObject.x, opObject.y, opObject.z, type="double3")

                            logger.warning("Setting Vec3 values: {} to {}".format(
                                str((opObject.x, opObject.y, opObject.z)), tgt))

                        else:  # Set Python value to port
                            validatePortValue(opObject, portName, portDataType)

                            logger.warning("Setting values: {} to {}".format(
                                str(opObject), tgt))

                            # pm.setAttr(tgt, opObject)

                    if portDataType.endswith('[]'):
                        for i in xrange(len(connectionTargets)):
                            # logger.warning("Connecting Array Input: {}:{}".format(
                            #     connectionTargets[i]['opObject'],
                            #     connectionTargets[i]['dccSceneItem']))
                            connectInput(
                                portName + '[' + str(i) + ']',
                                connectionTargets[i]['opObject'],
                                connectionTargets[i]['dccSceneItem'], isArrayPort=True)
                    else:
                        # logger.warning("Connecting Input: {}:{}".format(
                        #     connectionTargets['opObject'],
                        #     connectionTargets['dccSceneItem']))

                        connectInput(
                            portName,
                            connectionTargets['opObject'],
                            connectionTargets['dccSceneItem'])

        finally:
            pass

        return True

    # ==================
    # Parameter Methods
    # ==================
    def lockParameters(self, kSceneItem):
        """Locks flagged SRT parameters.

        Args:
            kSceneItem (Object): Kraken object to lock the SRT parameters on.

        Return:
            bool: True if successful.

        """

        dccSceneItem = self.getDCCSceneItem(kSceneItem)

        paramMap = {
            'lockXTranslation': 1,
            'lockYTranslation': 2,
            'lockZTranslation': 3,
            'lockXRotation': 4,
            'lockYRotation': 5,
            'lockZRotation': 6,
            'lockXScale': 7,
            'lockYScale': 8,
            'lockZScale': 9
        }

        locks = []


        # Lock Translation
        if kSceneItem.testFlag("lockXTranslation") is True:
            locks.append(1)

        if kSceneItem.testFlag("lockYTranslation") is True:
            locks.append(2)

        if kSceneItem.testFlag("lockZTranslation") is True:
            locks.append(3)


        # Lock Rotation
        if kSceneItem.testFlag("lockXRotation") is True:
            locks.append(4)

        if kSceneItem.testFlag("lockYRotation") is True:
            locks.append(5)

        if kSceneItem.testFlag("lockZRotation") is True:
            locks.append(6)


        # Lock Scale
        if kSceneItem.testFlag("lockXScale") is True:
            locks.append(7)

        if kSceneItem.testFlag("lockYScale") is True:
            locks.append(8)

        if kSceneItem.testFlag("lockZScale") is True:
            locks.append(9)

        lockScript = 'setTransformLockFlags $ #{' + ','.join([str(x) for x in locks]) + '}'

        dccSceneItem.Select()
        MaxPlus.Core.EvalMAXScript(lockScript)
        dccSceneItem.Deselect()

        return True

    # ===================
    # Visibility Methods
    # ===================
    def setVisibility(self, kSceneItem):
        """Sets the visibility of the object after its been created.

        Args:
            kSceneItem (Object): The scene item to set the visibility on.

        Return:
            bool: True if successful.

        """

        dccSceneItem = self.getDCCSceneItem(kSceneItem)

        # Set Visibility
        visAttr = kSceneItem.getVisibilityAttr()
        if visAttr.isConnected() is False and kSceneItem.getVisibility() is False:
            dccSceneItem.SetHidden(False)

        # Set Shape Visibility
        # shapeVisAttr = kSceneItem.getShapeVisibilityAttr()

        return True

    # ================
    # Display Methods
    # ================
    def setObjectColor(self, kSceneItem):
        """Sets the color on the dccSceneItem.

        Args:
            kSceneItem (object): kraken object to set the color on.

        Return:
            bool: True if successful.

        """

        colors = self.config.getColors()
        dccSceneItem = self.getDCCSceneItem(kSceneItem)
        buildColor = self.getBuildColor(kSceneItem)

        if buildColor is not None:

            if type(buildColor) is str:

                # Color in config is stored as rgb scalar values in a list
                if type(colors[buildColor]) is list:
                    dccSceneItem.SetWireColor(MaxPlus.Color(colors[buildColor][0], colors[buildColor][1], colors[buildColor][2]))

                # Color in config is stored as a Color object
                elif type(colors[buildColor]).__name__ == 'Color':
                    dccSceneItem.SetWireColor(MaxPlus.Color(colors[buildColor].r, colors[buildColor].g, colors[buildColor].b))

            elif type(buildColor).__name__ == 'Color':
                dccSceneItem.SetWireColor(MaxPlus.Color(colors[buildColor].r, colors[buildColor].g, colors[buildColor].b))

        return True

    # ==================
    # Transform Methods
    # ==================
    def setTransform(self, kSceneItem):
        """Translates the transform to Maya transform.

        Args:
            kSceneItem -- Object: object to set the transform on.

        Return:
            bool: True if successful.

        """

        dccSceneItem = self.getDCCSceneItem(kSceneItem)

        sceneItemXfo = kSceneItem.xfo
        rotateUpXfo = Xfo()
        rotateUpXfo.ori = Quat().setFromAxisAndAngle(Vec3(1, 0, 0), Math_degToRad(90))
        maxXfo = rotateUpXfo * sceneItemXfo

        krakenMat44 = maxXfo.toMat44().transpose()

        mat3 = MaxPlus.Matrix3(
            MaxPlus.Point3(krakenMat44.row0.x, krakenMat44.row0.y, krakenMat44.row0.z),
            MaxPlus.Point3(krakenMat44.row1.x, krakenMat44.row1.y, krakenMat44.row1.z),
            MaxPlus.Point3(krakenMat44.row2.x, krakenMat44.row2.y, krakenMat44.row2.z),
            MaxPlus.Point3(maxXfo.tr.x * 10.0,
                           maxXfo.tr.y * 10.0,
                           maxXfo.tr.z * 10.0))

        dccSceneItem.SetWorldTM(mat3)

        rotOrderRemap = {
                0: 1,
                1: 3,
                2: 5,
                3: 2,
                4: 6,
                5: 4
            }

        order = rotOrderRemap[kSceneItem.ro.order]

        dccSceneItem.Select()
        MaxPlus.Core.EvalMAXScript('tgtObj = selection[1]')
        dccSceneItem.Deselect()

        MaxPlus.Core.EvalMAXScript('tgtObj.rotation.controller.axisorder = {}'.format(str(order)))

        return True

    def setMat44Attr(self, dccSceneItemName, attr, mat44):
        """Sets a matrix attribute directly with values from a fabric Mat44.

        Note: Fabric and Maya's matrix row orders are reversed, so we transpose
        the matrix first.

        Args:
            dccSceneItemName (str): name of dccSceneItem.
            attr (str): name of matrix attribute to set.
            mat44 (Mat44): matrix value.

        Return:
            bool: True if successful.

        """

        # mat44 = mat44.transpose()
        # matrix = []
        # rows = [mat44.row0, mat44.row1, mat44.row2, mat44.row3]
        # for row in rows:
        #     matrix.extend([row.x, row.y, row.z, row.t])

        # cmds.setAttr(dccSceneItemName + "." + attr, matrix, type="matrix")

        return True

    # ==============
    # Build Methods
    # ==============
    def _preBuild(self, kSceneItem):
        """Pre-Build commands.

        Args:
            kSceneItem (Object): Kraken kSceneItem object to build.

        Return:
            bool: True if successful.

        """

        # pymxs.runtime.disableRefMsgs()

        return True

    def _postBuild(self, kSceneItem):
        """Post-Build commands.

        Args:
            kSceneItem (object): kraken kSceneItem object to run post-build
                operations on.

        Return:
            bool: True if successful.

        """

        super(Builder, self)._postBuild(kSceneItem)

        # pymxs.runtime.enableRefMsgs()
        MaxPlus.ViewportManager.ForceCompleteRedraw()

        return True
