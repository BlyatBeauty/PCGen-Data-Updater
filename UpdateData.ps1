$Url = "http://github.com/BlyatBeauty/PCGen-Data/archive/refs/heads/"
$LocalPath = ".\"
$File = "main.zip"
$BlyatBeauty = ".\PCGen-Data-main\*"
Invoke-WebRequest ($Url + $File) -OutFile ($LocalPath + $File)
Expand-Archive -Path ($LocalPath + $File) -DestinationPath $LocalPath
Copy-Item -Path $BlyatBeauty -Destination $LocalPath -Recurse -PassThru -Force
Remove-Item -Path ".\PCGen-Data-main" -Recurse
Remove-Item -Path ($LocalPath + $File) -Force
