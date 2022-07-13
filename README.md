# PCGen-Data-Updater
A script to fetch the most recent sourcebook data for PCGen.

This script updates and overwrites the **data** folder in PCGen with the most recent version from the PCGen Github but preserves any files you may have added in the *homebrew* or *customsources* subfolder. You should back those folders up just in case though.

Due to the process of downloading the entire PCGen repo as a step in this script, it does take a good few minutes to run. If I figure out how to speed it up in the future, I'll update the scripts.

## Dependencies
- **Windows** 
      - 7za.exe - Portable 7zip to use for scripting. The link to this binary can be found at https://www.7-zip.org/download.html (You're looking for the .7z file with the description "7-Zip Extra: standalone console version, 7z DLL, Plugin for Far Manager") Extract the .7z archive and copy 7za.exe file to your PCGen folder. If you don't know whether to use the x64 version of the file, check if your Windows installation is 32 or 64 bit. 64 bit installations hsould use the x64 version of the file.
- **Linux**
      - Git, Rsync
      
## Instructions (Windows)
1) Download 7za.exe (see Dependecies) and place 7za.exe ***directly*** in your PCGen folder. (Link to 7za.exe above)
2) Download the UpdateData.bat script file from here and also place it ***directly*** in your PCGen folder. (See Downloading files from Github below)
3) Run UpdateData.bat
4) Run UpdateData.bat again when needed.
## Instructions (Linux)
1) Download the UpdateData.sh script file from here and also place it ***directly*** in your PCGen folder. (See Downloading files from Github below)
2) Make the sh file executable (**chmod u+x UpdateData.sh**)
3) Run UpdateData.sh
4) Run UpdateData.sh again when needed.

## Downloading files from Github
1) Click on the file you want (UpdateData.bat or UpdateData.sh)
2) Right-click on the Raw button, then left click on Save Link As or Save File As (depending on your browser)
3) Save the file ***directly*** to your PCGen folder.

## Ok but what does it do:
The script 
1) downloads the PCGen master repo into your pcgen folder (this is usually the slowest part of the script)
2) copies the *data* folder from the repo it just downloaded to your pcgen folder. it will overwrite existing files with the same name but preserves files that do not appear in the repo (aka any homebrew you may have made)
3) cleans up after itself, deleting the PCGen master repo from your system.
      
## Troubleshooting
1) Make sure the script (and 7za.exe if you're on Windows) are placed directly in your PCGen folder. If they are in a subfolder, the script will not run correctly.
2) For Linux users, make sure that you have the appropriate permissions to run the script.
3) For Linux users, use bash to run the script (**bash UpdateData.sh**)
