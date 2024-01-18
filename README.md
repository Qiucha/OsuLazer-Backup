# OsuLazer-Backup
Backup Scripts for OsuLazer using powershell commands

### NOTE THAT THIS BACKUP METHOD WOULD SAVE/LOAD THE WHOLE SESSION, INCLUDING LOGIN INFO
### DO NOT SHARE THE ZIP FILES TO OTHER PLAYERS JUST EXPECTING SHARING YOUR SONG OR COLLECTION!!!

Usage:

To backup osulazer:

run `OsulazerBackup.ps1`

To import backed up data & songs to osulazer:

run `OsulazerImport.ps1`

`OsulazerImport.ps1` would only be functional when `OsulazerBackup.ps1` has been executed and the correct backup path has been entered.

For convenience, feel free to edit the:

`$bk_path = ""`

line to your own fixed backup path.For example:

`$bk_path = "D:\Backup\"`

Note that `-Force` option is written into both scripts, files would be overwritten by these two scripts.


