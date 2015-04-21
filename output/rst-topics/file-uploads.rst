File uploads
------------

Two API functions can be used to indicate if the SDK application agrees to upload files to the cloud or not: ``abc_file_willing_to_upload()``  and ``abc_file_unwilling_to_upload()``  . The reason for this is the following: uploading files to the cloud is not triggered by the application, but by the cloud. This is done via a special ticket, which is attached to the reply for a hash. When the SDK receives the ticket, it triggers the ``abc_file_upload_init_cb``  callback. After the application accepts, the file is added to an upload queue and sent to the cloud.


.. warning::
	If you do not set upload callbacks, the SDK behaves as if the ticket had been called.



**Managing the process scan** 

There is a fixed number of threads which upload files to the cloud. Due to bandwidth limits, files can pile up in the upload queue, and the last ones can even get upload errors because their upload tickets will actually expire by the time they actually get processed. In order to avoid errors, you must manage the scan process from outside the SDK.

**Solution #1:**  Feed the SDK tiny batches of files, and if there are uploads, wait until they are completed before continuing with the scan. This solution has the disadvantage of finishing the initial scan slower, because of the waiting for uploads.

**Solution #2:**  Use ``abc_file_unwilling_to_upload()``  , which makes the SDK return the status **UPLOAD**  on the ``abc_file_hash_status_cb``  , but not actually trigger the upload callback and the actual upload. The application using the SDK can then keep track of all the files which received this status and perform a second pass after calling ``abc_file_willing_to_upload()``  . Note that not all files might be requested for upload again (for example, if someone else uploaded a file in the mean time).

