$Url1 = "http://github.com/PCGen/pcgen/archive/refs/heads/"
$Url2 = "http://github.com/BahamutDragon/pcgen/archive/refs/heads/"
$LocalPath = ".\"
$File = "master.zip"
$Data = ".\pcgen-master\data"
$Bahamut = ".\pcgen-master\*"
Invoke-WebRequest ($Url1 + $File) -OutFile ($LocalPath + $File)
Expand-Archive -Path ($LocalPath + $File) -DestinationPath $LocalPath
Copy-Item -Path $Data -Destination $LocalPath -Recurse -PassThru -Force
Remove-Item -Path ".\pcgen-master" -Recurse
Remove-Item -Path ($LocalPath + $File) -Force
Invoke-WebRequest ($Url2 + $File) -OutFile ($LocalPath + $File)
Expand-Archive -Path ($LocalPath + $File) -DestinationPath $LocalPath
Copy-Item -Path $Bahamut -Destination $LocalPath -Exclude *.txt, *.md, .gitattributes, .gitignore -Recurse -PassThru -Force
Remove-Item -Path ".\pcgen-master" -Recurse
Remove-Item -Path ($LocalPath + $File) -Force
