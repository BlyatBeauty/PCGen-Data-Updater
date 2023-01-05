REM ===== PCGen main repo =====
powershell -Command "(New-Object Net.WebClient).DownloadFile('http://github.com/PCGen/pcgen/archive/refs/heads/master.zip', 'master.zip')"
powershell -Command "Expand-Archive -Path master.zip -DestinationPath '%~dp0'"
echo d | xcopy /Y /E "pcgen-master\data" "%~dp0data"
del "master.zip"
RMDIR "pcgen-master" /S /Q
REM ===== Bahamut Sources repo =====
powershell -Command "(New-Object Net.WebClient).DownloadFile('http://github.com/BahamutDragon/pcgen/archive/refs/heads/master.zip', 'bahamut.zip')"
powershell -Command "Expand-Archive -Path bahamut.zip -DestinationPath '%~dp0'"
echo d | xcopy /Y /E "pcgen-master\data" "%~dp0data"
echo d | xcopy /Y /E "pcgen-master\outputsheets" "%~dp0outputsheets"
echo d | xcopy /Y /E "pcgen-master\preview" "%~dp0preview"
echo d | xcopy /Y /E "pcgen-master\system" "%~dp0system"
del "bahamut.zip"
RMDIR "pcgen-master" /S /Q
exit
