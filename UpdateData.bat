@echo off

powershell -Command "(New-Object Net.WebClient).DownloadFile('http://github.com/PCGen/pcgen/archive/refs/heads/master.zip', 'master.zip')"
powershell -Command "Expand-Archive -Path master.zip -DestinationPath '%~dp0'"
echo d | xcopy /Y /E "pcgen-master\data" "%~dp0data"
del "master.zip"
RMDIR "pcgen-master" /S /Q
exit
