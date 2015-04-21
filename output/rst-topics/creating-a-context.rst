Creating a context
------------------

To create a connection to our ABC-Test service for online queries, you have to create and initialize a context containing internal state data.


.. warning::
	The contexts are not thread-safe. Do not use them for multiple threads simultaneously. Create a context for each thread you use in your application.





* Call ``abc_create_context()``  to create a context.



* Call ``abc_file_initialize_context()``  to start using the context.



* When you don't need the context any longer, call ``abc_file_uninitialize_context()``  , then ``abc_destroy_context()``  .



An error will occur, if you don't call the functions in this order.

