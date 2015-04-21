Callbacks
---------

The ABC-Test SDK uses a callback mechanism to report and retrive information related to the actual analysing task from the application. These callbacks are functions which allow the application to perfom online lookups, taking a structure of function pointers as parameter.

None of these callbacks is mandatory. If you do not set any callback, the queries will be performed, but you will not receive any notifications about the events.


.. warning::
	If you have multiple threads and set the same callback function inside your application, make sure the function is thread safe, since it will be called from different threads simultaneously.





* ``abc_file_error_cb``  - The error callback, triggered when a file error occurs (for example when reading or opening a file).



* ``abc_file_hash_status_cb``  - The status callback, triggered to report the online status of a file/ hash (from the cloud).



* ``abc_file_upload_init_cb``  - The upload init callback, triggered to ask if the user agrees with uploading a file, and to pass some more information about it, if available.



* ``abc_file_upload_start_cb``  - The upload start callback, triggered when the upload is starting (called from a different thread).



* ``abc_file_upload_progress_cb``  - The upload progress callback, triggered to signal the upload progress (called from a different thread).



* ``abc_file_upload_finish_cb``  - The upload finish callback, triggered to signal that an upload has finished (called from a different thread).



