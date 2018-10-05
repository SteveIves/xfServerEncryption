@echo off

rem Create a new private key and self signed certificate request

rem The -nodes option suppresses password protection for the private
rem key, which should never be done in production environments!

echo.
echo Creating certificate request and private key
echo.

openssl req -newkey rsa:2048 -keyout RsyndPrivateKey.pem -nodes -out RsyndRequest.pem -config certconfig.cnf

if not exist RsyndRequest.pem (
    echo ERROR: Failed to create certificate request
    goto :eof
)

if not exist RsyndPrivateKey.pem (
    echo ERROR: Failed to create private key
    goto :eof
)

rem Sign the request with the root CA to create a certificate

echo.
echo Signing certificate
echo.

openssl x509 -req -in RsyndRequest.pem -CA RootCa.pem -CAkey RootCa.pem -CAcreateserial -out RsyndCertificate.pem -days 3650

if not exist RsyndCertificate.pem (
  echo ERROR: Failed to create certificate
  goto :eof
)

rem Concatenate the certificate and private key

copy /y RsyndCertificate.pem + RsyndPrivateKey.pem rsynd.pem > nul
