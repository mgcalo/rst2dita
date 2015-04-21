Possible workflow
-----------------

The diagram below provides a possible, simple workflow for working with the SDK.


.. image:: workflow.png

The first step is to scan a file, or a series of files and, maybe, upload those unknown. For each of them, a status callback function is called, containing data like **category**  and **status**  . The next step is to check the **status**  .

Possible status values:



* **OK**  - The file has been analized and the **category**  parameter shows the file’s category. Having an **UNKNOWN**  category can indicate an error on the server side, but it does not imply any action from the client. This step is followed by the **YES**  and **NO**  branch cases (depending on the category).



* **IN_PROGRESS**  - The file has been uploaded by someone and it is in the process of being analyzed. The SDK user should call the check file/ hash function again, preferably after **ttl**  seconds. This case is not drawn on the flowchart, for simplicity’s sake.



* **UPLOAD**  - The server signals the SDK to upload the file. This is the ``UPLOAD callback``  branch. The SDK will invoke the ``upload init``  callback (no intervention needed).



Once the file has been uploaded, the ``upload finished``  callback is triggered. If an error occurs, the user can be informed that the category is **UNKNOWN**  . If the ticket expired, the entire scan request has to run from the top again, for a number of times. If the upload finished successfully, then a repeated check of this file should be performed, up to a number of times.

