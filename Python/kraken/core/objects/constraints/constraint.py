"""Kraken - objects.Constraints.Constraint module.

Classes:
Constraint - Base Constraint.

"""

from kraken.core.objects.scene_item import SceneItem
from kraken.core.objects.object_3d import Object3D


class Constraint(SceneItem):
    """Constraint object."""

    def __init__(self, name, parent=None):
        super(Constraint, self).__init__(name, parent)

        self._constrainee = None
        self._constrainers = []
        self._maintainOffset = False


    # ===================
    # Constraint Methods
    # ===================
    def getMaintainOffset(self):
        """Returns the whether the constraint should maintain offset when it's
        built or not.

        Returns:
            bool: Whether the constraint should maintain offset or not.

        """

        return self._maintainOffset


    def setMaintainOffset(self, value):
        """Sets the constraint to maintain offset when creating the constraint.

        Args:
            value (bool): Whether the constraint should maintain offset or not.

        Returns:
            bool: True if successful.

        """

        self._maintainOffset = value


    def setConstrainee(self, constrainee):
        """Sets the constrainee object for this constraint.

        Args:
            constrainee (Object): Object that will be constrained.

        Returns:
            bool: True if successful.

        """

        self._constrainee = constrainee

        return True


    def getConstrainee(self):
        """Returns the constrainee object for this constraint.

        Returns:
            bool: True if successful.

        """

        return self._constrainee


    def addConstrainer(self, kObject3D):
        """Adds a constrainer object to this constraint.

        Args:
            kObject3D (Object): kObject3D that will constrain the constrainee.

        Returns:
            bool: True if successful.

        """

        self._constrainers.append(None)
        self.setConstrainer(kObject3D, len(self._constrainers) - 1)

        return True


    def setConstrainer(self, kObject3D, index=0):
        """Sets the constrainer at the specified index.

        Args:
            kObject3D (object): Kraken 3D object.
            index (int): index of the constraint to set.

        Returns:
            bool: True if successful.

        """

        if not isinstance(kObject3D, Object3D):
            raise Exception("'kObject3D' argument is not a valid instance type. '"
                             + kObject3D.getName() + "': " + str(type(kObject3D)) +
                             ". Must be an instance of 'Object3D'.")

        if kObject3D in self._constrainers:
            raise Exception("'kObject3D' argument is already a constrainer: '" + kObject3D.getName() + "'.")

        self._constrainers[index] = kObject3D

        return True


    def removeConstrainerByIndex(self, index):
        """Removes a constrainer object by its index.

        Args:
            index (int): Index of the constrainer you want to remove.

        Returns:
            bool: True if successful.

        """

        return True


    def getConstrainers(self):
        """Returns the constrainers of this constraint.

        Returns:
            list: Constrainer objects.

        """

        return self._constrainers


    # ================
    # Persistence Methods
    # ================
    def jsonEncode(self, saver):
        """Encodes the object to a JSON structure.

        Args:
            saver (Object): saver object.

        Returns:
            Dict: A JSON structure containing the data for this SceneItem.

        """

        classHierarchy = []
        for cls in type.mro(type(self)):
            if cls == object:
                break
            classHierarchy.append(cls.__name__)

        jsonData = {
            '__typeHierarchy__': classHierarchy,
            'name': self.name,
            'constrainee': self._constrainee.getName(),
            'constrainers': []
        }
        for cnstrnr in self._constrainers:
            jsonData['constrainers'].append(cnstrnr.getName())

        return jsonData


    def jsonDecode(self, loader, jsonData):
        """Returns the color of the object..

        Args:
            loader (Object): Loader object.
            jsonData (Dict): JSON object structure.

        Returns:
            bool: True if successful.

        """

        loader.registerConstructionCallback(jsonData['constrainee'], self.setConstrainee)

        for cnstrnr in jsonData['constrainers']:
            loader.registerConstructionCallback(cnstrnr, self.addConstrainer)

        return True
