Initializing the ABC-Test SDK
-----------------------------

In an application's lifetime, you need to initialize and uninitialize the ABC-Test SDK only once.



* Before beginning to use the SDK, call the initialization function ``abc_file_initialize()``  .



If you don't initialize the SDK, most functions return an error code, except for ``abc_enable_log()``  .

