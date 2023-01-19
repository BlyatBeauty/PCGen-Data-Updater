# PCGen Data Updater
A script to fetch the most recent sourcebook data for PCGen.

This script updates and overwrites the **data** folder in PCGen with the most recent version from the PCGen GitHub but preserves any files you may have added in the *homebrew* or *customsources* subfolders. You should back those folders up just in case though.

By demand from the [PCGen discord server](https://discord.gg/M7GH5BS), the script will also fetch [BahamutDragon's PCGen Sources](https://github.com/BahamutDragon/pcgen). These are all the sources that PCGen is not allowed to ship with due to OGL.

Just as a heads up, this script does take a good few minutes to run - the longest it took me was 7 minutes. Your internet speed will probably be the biggest deciding factor here.

## Table of Contents:
1) [Dependencies](https://github.com/BlyatBeauty/PCGen-Data-Updater#dependencies)
2) [Instructions for Windows](https://github.com/BlyatBeauty/PCGen-Data-Updater#instructions-windows)<br>
2.5) [Finding my PCGen Installation folder](https://github.com/BlyatBeauty/PCGen-Data-Updater#how-do-i-find-my-pcgen-installation-folder-on-windows)
3) [Instructions for Linux](https://github.com/BlyatBeauty/PCGen-Data-Updater#instructions-linux)
4) [Explaining the script functions](https://github.com/BlyatBeauty/PCGen-Data-Updater#ok-but-what-does-the-script-do)
5) [Troubleshooting](https://github.com/BlyatBeauty/PCGen-Data-Updater#troubleshooting)

## Dependencies
- **Windows** 
      - No dependencies required. All hail PowerShell.
- **Linux**
      - Git, Rsync
      
## Instructions (Windows)
### UpdateData.bat
1) Find your PCGen installation folder (see below)
2) Download the [UpdateData.bat script file](https://raw.githubusercontent.com/BlyatBeauty/PCGen-Data-Updater/main/UpdateData.bat) and place it ***directly*** in your PCGen folder. Remember to save it as a .bat file and not a .txt!

      - If you're struggling to download it, right click on the hyperlink, then left click on Save Link As or Save File As or Save Page As (depending on your browser)

3) Run UpdateData.bat
4) Run UpdateData.bat again when needed.

### UpdateData.ps1

This is a PowerShell-only version of the UpdateData script. If the UpdateData.bat script isn't working for you, this one may work better, but requires some more tinkering in advance.

1) Make sure you have the most recent version of [PowerShell](https://github.com/PowerShell/PowerShell/releases/)

2) Make sure you can run PowerShell scripts! 
      In your PowerShell terminal, run `Get-ExecutionPolicy`<br>
      If you see your terminal return "Restricted", then run `set-executionpolicy remotesigned`<br>
      If you see your terminal return "RemoteSigned" or "Unrestricted" then your PowerShell is ready to run scripts.

3) Download [UpdateData.ps1](https://raw.githubusercontent.com/BlyatBeauty/PCGen-Data-Updater/main/UpdateData.ps1) and place it ***directly*** in your PCGen folder. Remember to save it as a .ps1 file and not a .txt!


      - If you're struggling to download it, right click on the hyperlink, then left click on Save Link As or Save File As or Save Page As (depending on your browser)

4) Right-click on UpdateData.ps1 and press "Run with PowerShell"<br>
      This part's important. In my experience, simply left clicking on a .ps1 file opens it in a text editor. You need to specify to your computer that you wish to actually run the script.

5) Run UpdateData.ps1 again as needed

### How do I find my PCGen installation folder on Windows?
If you used the .exe installer from any of the PCGen official releases, the folder will most likely be located in

 `C:\Users\[User]\AppData\Local\PCGen\` in a folder likely titled `6.08.00RC8` or `6.09.05` (depending on which version of PCGen you're using)

To confirm this though, open PowerShell and run the following command:

`gdr -PSProvider 'FileSystem' | %{ ls -r $_.root} 2>$null | where { $_.name -eq "pcgen.exe" }`

The output should look like this:

![image](https://user-images.githubusercontent.com/66367898/213357546-a739c230-3477-4a60-8af7-cb6ec2c7f330.png)

As you can see, in my case the output shows `Directory: D:\Documents\PCGen\6.08.00RC8` so I would download the scripts to `D:\Documents\PCGen\6.08.00RC8`

## Instructions (Linux)
1) Download the [UpdateData.sh script file](https://raw.githubusercontent.com/BlyatBeauty/PCGen-Data-Updater/main/UpdateData.sh) and place it ***directly*** in your PCGen folder.

      - If you're struggling to download it, right click on the hyperlink, then left click on Save Link As or Save File As or Save Page As (depending on your browser)

2) Make the .sh file executable (**chmod u+x UpdateData.sh**)
3) Run UpdateData.sh followed by the variables for your temporary directory and your main pcgen directory 
![image](https://user-images.githubusercontent.com/66367898/178808020-3ddbef30-2647-4119-8ee0-03a5566b77b6.png) like this
4) Run UpdateData.sh again when needed.

## Ok but what does the script do:
### Windows
1) Downloads the latest data sources from [my data repo](https://github.com/BlyatBeauty/PCGen-Data) - which automatically grabs the latest data packs from [PCGen](https://github.com/PCGen/pcgen) and [BahamutDragon](https://github.com/BahamutDragon/pcgen) as a zip file.
2) Extracts the zip file
3) Copies over all files and directories from my repo to your PCGen root folder. It will overwrite existing files with the same name but should preserve files that do not appear in the repo (aka any homebrew you may have made). **Remember to keep backups of your homebrew just in case.**
4) Cleans up after itself, deleting the temporary files it generates off your system.

I am intending to make a more efficient version of the Windows scripts that act like the Linux version, using git to checkout and keep your data folder up to date with the repo. It's on my to-do list, I swear.

### Linux
On Linux, the script is a bit more efficient:
1) Uses git to make a checkout of my data repo 
2) Checks for updates between your local checkout and the main repo - keeping your checkout fully up-to-date.
3) Uses rsync to copy over the data folder from the checkout to your PCGen directory. It will overwrite existing files with the same name but should preserve files that do not appear in the repo (aka any homebrew you may have made). **Remember to keep backups of your homebrew just in case.**
      
## Troubleshooting

### Windows
**The script doesn't run!** 

There are a few reasons why it wouldn't run. The most common reason is because it's in the wrong location. Make sure the `.bat` script is placed directly in your PCGen folder. If it is in a subfolder, the script will not run correctly. If that hasn't fixed your issue, read on. <br>
Another possible reason that the script didn't run could be that Windows Defender, or some antivirus flagged it; or maybe some other process blocked it because it's a file downloaded from the internet. It's a common enough issue I heard from others - I imagine it's because of the PowerShell commands in the script. Regardless, I can think of 2 solutions here:

- **Go to your antivirus software's advanced options and exclude the script** - effectively whitelisting it<br>or<br> 
- **Copy the raw text into notepad on your system, then save it as a .bat file** - effectively making it local to your machine
![image](https://user-images.githubusercontent.com/66367898/204911417-86b80f9d-008b-40d2-88c0-961e2ba4d1d7.png)<br>
![image](https://user-images.githubusercontent.com/66367898/204911746-3714f262-cd0a-4d91-8c21-091af0ae11c2.png)<br>
![image](https://user-images.githubusercontent.com/66367898/204912219-6d0ec62f-e862-44f9-9e0b-a8fb011ab107.png)<br>
![image](https://user-images.githubusercontent.com/66367898/204912242-4bf8ac8c-490c-46c9-902d-7263df204356.png)<br>
Save this file **directly to your PCGen folder** and run it from there.

If making a local version of the `.bat` file hasn't helped, I suggest you try running the `.ps1` version of the script.

### Linux
1) Make sure the `.sh` script is placed directly in your PCGen folder. If it is in a subfolder, the script will not run correctly.
2) Make sure that you have the appropriate permissions to run the script (**chmod u+x UpdateData.sh**)
3) Use bash to run the script (**bash UpdateData.sh**) - especially useful if you don't use bash as your primary shell.
4) Ensure that you are using the correct paths as your variables.
5) Ensure that the paths you are using don't have spaces in the name. Spare yourselves from the headache that we experienced figuring that one out. Even with quotes, Rsync just struggles with spaces in your paths.
