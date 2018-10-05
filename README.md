
# xfServerEncryption

This repository contains a sample Traditional Synergy application that demonstrates the effect of using network protocol encryption with Synergy xfServer. You must have OpenSSL installed and correctly configured for use with Synergy. For more information refer to the [Synergy documentation](https://www.synergex.com/docs/index.htm#icg/icgChap3Usingclientserverencryption.htm).

Before running the included program you will need to create a self-signed SSL certificate. You can do this by using the CreateCA and CreateCertificate batch files that you will find in the CERT folder.

The scenario involves two ISAM files:

* DEPARTMENT.ISM which does NOT require encryption, but it may be requested.
* EMPLOYEE.ISM which REQUIRES encryption whenever opened.

The included program opens DEFPARTMENT file first without and then with encryption, and then opens EMPLOYEE file.

To successfully run the code should have an instance of xfServer running locally on the default port (2330). First configure xfServer without encryption and try the program, then configure encryption and see how the behavior of the program changes.

Try these steps:

* Without encryption enables, run the program.
    * Notice how only the first file open works.
* Enable slave encryption, MEDIUM cipher, and re-run the program.
    * Now all three file opens should now work, with the second and third channels being encrypted.
    * Notice the use of a SHA1 based 128 bit SSLV3 encryption, which is considered insecure!
* Next switch to master encryption mode and select the HIGH cipher.
    * Now all 3 channels are encrypted
    * Now we’re using AES256 encryption and TLS 1.2 – much better

In order to build and run the code in this example you will need:

* Microsoft Visual Studio 2017 (or later).
* Synergy/DE 10.3.3d (or later) including Synergy DBL Integration for Visual Studio.
