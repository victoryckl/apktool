@echo off

java -jar signapk.jar cert.x509.pem private.pk8 $1 $2

pause