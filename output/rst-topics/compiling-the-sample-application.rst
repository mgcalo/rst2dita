Compiling the sample application
--------------------------------

The SDK contains a sample application, to demonstrate its basic usage, for example, to check the status of a file with the cloud and to upload it, if needed.



* Edit the file **src/file_demo_sdk.c**  , by replacing the define values with the ones provided to you by ABC.



::
	#define ABC_SDK_PRODUCT_ID 0
#define ABC_SDK_PRODUCT_LICENSE "-md5-sum-license-here-"
#define ABC_SDK_SERVICE_ADDRESS "https://auth.abc.com/"


* Compile the application using the **.sln**  file (for Visual Studio 2010) or the **Makefile**  (for UNIX platforms) in the **src**  folder.



The executable is created in the **bin**  folder.

