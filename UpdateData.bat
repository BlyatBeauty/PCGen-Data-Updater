powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/PCGen/pcgen/archive/refs/heads/master.zip', 'master.zip')"
7za x master.zip
echo d | xcopy /Y /E "pcgen-master\data" "%~dp0data"
del "master.zip"
RMDIR "pcgen-master" /S /Q
exit