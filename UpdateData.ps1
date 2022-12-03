$Url = "http://github.com/PCGen/pcgen/archive/refs/heads/"
$LocalPath = ".\"
$File = "master.zip"
$Data = ".\pcgen-master\data"
Invoke-WebRequest ($Url + $File) -OutFile ($LocalPath + $File)
Expand-Archive -Path ($LocalPath + $File) -DestinationPath $LocalPath
Copy-Item -Path $Data -Destination $LocalPath -Recurse -PassThru -Force
Remove-Item -Path ".\pcgen-master" -Recurse
Remove-Item -Path ($LocalPath + $File) -Force