powershell -Command "Invoke-WebRequest -Uri 'https://github.com/BlyatBeauty/PCGen-Data/archive/refs/heads/main.zip' -OutFile '%~dp0PCGen-Data-main.zip'"
powershell -Command "Expand-Archive -Path PCGen-Data-main.zip -DestinationPath '%~dp0'"
echo d | xcopy /Y /E "PCGen-Data-main\data" "%~dp0data"
del "PCGen-Data-main.zip"
RMDIR "PCGen-Data-main" /S /Q
exit
