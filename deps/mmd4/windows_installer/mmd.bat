@ECHO OFF
:Loop
IF "%1"=="" GOTO Continue
   "%~dp0\multimarkdown" -b %1
SHIFT
GOTO Loop
:Continue

