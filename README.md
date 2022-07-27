# PCGen Data Updater
A script to fetch the most recent sourcebook data for PCGen.

This script updates and overwrites the **data** folder in PCGen with the most recent version from the PCGen Github but preserves any files you may have added in the *homebrew* or *customsources* subfolders. You should back those folders up just in case though.

Due to the process of downloading the entire PCGen repo as a step in this script, it does take a good few minutes to run - the longest it took me was 7 minutes. Your internet speed will be the biggest deciding factor here.

## Table of Contents:
1) [Dependencies](https://github.com/BlyatBeauty/PCGen-Data-Updater#dependencies)
2) [Instructions for Windows](https://github.com/BlyatBeauty/PCGen-Data-Updater#instructions-windows)
3) [Instructions for Linux](https://github.com/BlyatBeauty/PCGen-Data-Updater#instructions-linux)
4) [Explaining the script functions](https://github.com/BlyatBeauty/PCGen-Data-Updater#ok-but-what-does-the-script-do)
5) [Troubleshooting](https://github.com/BlyatBeauty/PCGen-Data-Updater#troubleshooting)

## Dependencies
- **Windows** 
      - No dependencies required. All hail Powershell.
- **Linux**
      - Git, Rsync
      
## Instructions (Windows)
1) Find your PCGen installation folder (see below)
2) Download the [UpdateData.bat script file](https://raw.githubusercontent.com/BlyatBeauty/PCGen-Data-Updater/main/UpdateData.bat) and place it ***directly*** in your PCGen folder. Remember to save it as a .bat file and not a .txt!

      - If you're struggling to download it, right click on the hyperlink, then left click on Save Link As or Save File As or Save Page As (depending on your browser)

3) Run UpdateData.bat
4) Run UpdateData.bat again when needed.
### How do I find my PCGen installation folder on Windows?
If you used the .exe installer from any of the PCGen official releases, the folder will most likely be located in

 `C:\Users\[User]\AppData\Local\PCGen\` in a folder likely titled `6.08.00RC8` or `6.09.05` (depending on which version of PCGen you're using)

To confirm this though, find your PCGen shortcut, right click on it and click on Open File Location like this:![Untitled](https://user-images.githubusercontent.com/66367898/181310848-88d1f6fa-12dd-44ce-82ee-51e0b06d4b1e.png)

## Instructions (Linux)
1) Download the [UpdateData.sh script file](https://raw.githubusercontent.com/BlyatBeauty/PCGen-Data-Updater/main/UpdateData.sh) and place it ***directly*** in your PCGen folder.

      - If you're struggling to download it, right click on the hyperlink, then left click on Save Link As or Save File As or Save Page As (depending on your browser)

2) Make the .sh file executable (**chmod u+x UpdateData.sh**)
3) Run UpdateData.sh followed by the variables for your temporary directory and your main pcgen directory 
![image](https://user-images.githubusercontent.com/66367898/178808020-3ddbef30-2647-4119-8ee0-03a5566b77b6.png) like this
4) Run UpdateData.sh again when needed.

## Ok but what does the script do:
### On Windows, the script 
Lines 1 and 2) Downloads the PCGen master repo into your pcgen folder (this is usually the slowest part of the script)

   - The repo is downloaded as a zip file. The script download then extracts the zip file using PowerShell.

Line 3) Copies the *data* folder from the repo it just downloaded to your pcgen folder. it will overwrite existing files with the same name but should preserve files that do not appear in the repo (aka any homebrew you may have made). **Remember to keep backups of your homebrew just in case**

Line 4) Cleans up after itself, deleting the PCGen master repo from your system.
### On Linux, the script is a bit more efficient:
1) Uses git to make a checkout of the PCGen repo if one does not exist already. 
2) Checks for updates between your local checkout and the main PCGen repo - keeping your checkout fully up-to-date.
3) Uses rsync to copy over the data folder from the checkout to your PCGen directory. It will overwrite existing files with the same name but should preserve files that do not appear in the repo (aka any homebrew you may have made). **Remember to keep backups of your homebrew just in case**
      
## Troubleshooting
1) Windows/Linux, Make sure the script is placed directly in your PCGen folder. If it is in a subfolder, the script will not run correctly.
2) Windows: Windows Defender flagged the bat script: Yeah, that'll happen on some systems. I imagine it's because of the PowerShell commands. Either go to advanced options and run it anyways or copy the raw text into notepad on your system, then save it as a bat script - effectively making it local to your machine.
3) For Linux users, make sure that you have the appropriate permissions to run the script.
4) For Linux users, use bash to run the script (**bash UpdateData.sh**)
5) For Linux users, ensure that you are using the correct paths as your variables.
6) For Linux users, ensure that the paths you're using don't have spaces in the name. Spare yourselves from the headache that we experienced figuring that one out. Even with quotes, Rsync just struggles with spaces in your paths.
