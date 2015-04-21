Cloud queries
-------------

The SDK provides functions which can query for one or multiple files/ hashes online. The query functions are synchronous and they block program execution until all the results are available.


.. warning::
	If the SDK is 32-bit and runs under Windows x64, you will encounter an issue where the OS redirects the access to certain locations, so you will not be able to access parts of the filesystem. See `Wow64 <wow64.xml>`_   .




.. note::
	When looking up multiple files/ hashes:



Before the functions return to the caller, some of the callbacks are called, with the results for each file/ hash.



* An online query by hash(es) triggers the ``abc_file_hash_status_cb``  callbacks until the function exits.



* An online query by file(es) triggers the ``abc_file_hash_status_cb``  callbacks and eventually ``abc_file_fs_error_cb``  and ``abc_file_upload_init_cb``  .



* In case the user accepts the upload, a newly created thread triggers the callbacks ``abc_file_upload_start_cb``  , ``abc_file_upload_progress_cb``  and ``abc_file_upload_finish_cb``  .



