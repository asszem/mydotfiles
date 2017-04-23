Last updated: 2017-04-24 00:54:49
﻿#. (Resolve-Path "$env:LOCALAPPDATA\GitHub\shell.ps1")
#. $env:github_posh_git\profile.example.ps1

set-alias vim "C:\Program Files (x86)\Vim\vim80\gvim.exe"

Function GitHubLocation
{
	cd E:\GitHub\
}
set-alias gogit GitHubLocation

Function GitBackupLocation
{
cd '~\OneDrive\W10-OneDrive\Java programozás OneDrive\Src_Backup_Clones\JavaLearningBackup'
}
set-alias gogitbackup GitBackupLocation

# To edit the Powershell Profile
# (Not that I'll remember this)
Function Edit-Profile
{
    vim $profile
}

# To edit Vim settings
Function Edit-Vimrc
{
    vim $HOME\_vimrc
}