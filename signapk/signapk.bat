@echo off

java -jar "%~dp0\signapk.jar" "%~dp0\cert.x509.pem" "%~dp0\private.pk8" %1 %2
