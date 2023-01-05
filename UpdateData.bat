powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/BlyatBeauty/PCGen-Data/archive/refs/heads/main.zip', 'PCGen-Data-main.zip')"
powershell -Command "Expand-Archive -Path PCGen-Data-main.zip -DestinationPath '%~dp0'"
echo d | xcopy /Y /E "PCGen-Data-main\data" "%~dp0data"
echo d | xcopy /Y /E "PCGen-Data-main\outputsheets" "%~dp0outputsheets"
echo d | xcopy /Y /E "PCGen-Data-main\preview" "%~dp0preview"
echo d | xcopy /Y /E "PCGen-Data-main\system" "%~dp0system"
del "PCGen-Data-main.zip"
RMDIR "PCGen-Data-main" /S /Q
exit
