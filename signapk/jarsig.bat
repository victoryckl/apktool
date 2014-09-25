
set src="%~f1"
set dst="%~f2"

jarsigner -sigalg MD5withRSA -digestalg SHA1 -keystore "%~dp0\debug.keystore" -signedjar %dst% %src% androiddebugkey -storepass android