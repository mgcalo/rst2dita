Wow64
-----

If running a 32-bit SDK on Windows x64, the OS performs automatically a redirection at filesystem level, effectively “hiding” the contents of the native **system32**  and of some other folders.

To access all the files, you have to disable this redirection in the thread where you call ``abc_file_check_file``  or ``abc_file_check_files``  (see `Wow64DisableWow64FsRedirection <http://msdn.microsoft.com/en-us/library/windows/desktop/aa365743(v=vs.85).aspx>`_    ). For the upload threads, this is performed automatically.

