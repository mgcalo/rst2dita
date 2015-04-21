Memory handling
---------------

In the rare case of an out-of-memory error, the default behaviour is for the SDK to abort program execution: ``abort()``  . However, the user can set a different out-of-memory handling function which does not have the same behaviour.

