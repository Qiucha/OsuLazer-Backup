# OsuLazer-Backup
Backup Scripts for OsuLazer using powershell commands

* NOTE THAT THIS BACKUP METHOD WOULD SAVE/LOAD THE WHOLE SESSION, INCLUDING LOGIN INFO. DO NOT SHARE THE ZIP FILES TO OTHER PLAYERS JUST EXPECTING SHARING YOUR SONG OR COLLECTION!!!

## Usage:

### To backup osulazer:

run `OsulazerBackup.ps1`

### To import to osulazer:

run `OsulazerImport.ps1`

* `OsulazerImport.ps1` would only be functional when `OsulazerBackup.ps1` has been executed and the correct backup path has been entered.


For convenience, feel free to edit the

`$bk_path = ""`

line to your own fixed backup path.For example:

`$bk_path = "D:\Backup\"`

Note that `-Force` option is written into both scripts, files would be overwritten by these two scripts.


## Automation

add a task to task scheduler:

`powershell -File "path\to\your\back\up\script.ps1"`

trigger set to whenever you want to backup.


## What do these two scripts do?

They simply "zip/extract" the two "directory/zip files" below to two "zip files/directory":

`%USERNAME%\AppData\Local\osulazer` ←"zip/extract"→ `back\up\path\to\osulazer.zip`

`%USERNAME\AppData\Roaming\osu` ←"zip/extract"→ `back\up\path\to\osu.zip`

Feel free to do this manually, I'm just too lazy to weekly copy&paste these two directory to somewhere else.
