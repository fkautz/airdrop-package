airdrop-package
===============
Modify this package as necessary to support your needs.

How this package works
----------------------

* A directory called "archive" is created.
* All files to be transfered are moved to archive/
* A file called run.sh with execution permissions is added to archive/
* Makeself is called, creating the archive.
* A test is also included to show an example of how to run this remotely

Requirements
------------
* makeself
* sshpass (for test only)

How to run
----------
```sh
# make # Creates package
# make test # compiles
````

