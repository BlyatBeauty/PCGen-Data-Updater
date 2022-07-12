# PCGen-Data-Updater
A script to fetch the most recent sourcebook data for PCGen.

This script updates and overwrites the **data** folder in PCGen with the most recent version from the PCGen Github but preserves any files you may have added in the *homebrew* subfolder. You should back that folder up just in case though.

## Dependencies
7za.exe - Portable 7zip to use for scripting. 

The link to this binary can be found at https://www.7-zip.org/download.html 

(You're looking for the .7z file with the description "7-Zip Extra: standalone console version, 7z DLL, Plugin for Far Manager")

## Instructions
1) Download 7za.exe (see Dependecies) and place 7za.exe ***directly*** in your PCGen folder.
2) Download the UpdateData.bat script file from here and also place it ***directly*** in your PCGen folder.

Note: If these two files are placed elsewhere, the script won't work and I'll be sad as a direct result. 

3) Run UpdateData.bat
4) Run UpdateData.bat again when needed.

## Ok but what does it do:
The script 
1) downloads the PCGen master repo to your pcgen folder as a zip folder
2) extracts the PCGen repo into its own folder
3) xcopies the *data* folder from the repo it just downloaded to your pcgen folder. it will overwrite existing files with the same name but preserves files that do not appear in the repo (aka any homebrew you may have made)
4) cleans up after itself, deleting the PCGen master repo from your system.
      
## Future plans
Maybe make a linux version of this script? Idk I made this while procrastinating.
