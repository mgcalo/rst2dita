Proxy usage
-----------

In UNIX environments, the **curl**  library respects the **http(s)_proxy**  variables by default, if set. If you want a different behaviour, you need to explicitely disable the proxy by calling the ``abc_set_proxy``  function with an empty string as proxy address.

