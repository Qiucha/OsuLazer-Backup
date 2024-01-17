# OsuLazer-Backup
Backup Scripts for OsuLazer using powershell commands

Usage:
To backup data & songs of osulazer:
run `OsulazerBackup.ps1`

To import backed up data & songs to osulazer:
run `OsulazerImport.ps1`
`OsulazerImport.ps1` would only be functional when `OsulazerBackup.ps1` has been executed and the correct backup path has been entered.

For simplicity, feel free to edit the:
`$bk_path = Read-Host -Prompt "Paste your backup path"`
line to your own fixed backup path.
For example:
`$bk_path = "D:\Backup\"`

Note that -Force option is written into scripts, files would be overwritten by these two scripts.
