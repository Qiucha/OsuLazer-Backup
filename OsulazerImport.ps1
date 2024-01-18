### NOTE: This Import method would load THE WHOLE SESSION as two zips
### including maps, skins, songs, replays, collections, and also LOGIN STATUS.
### DO NOT SHARE THE ZIP FILES WITH OTHER PLAYER ONLY EXPECTING SHARING YOUR SONG COLLECTION !!!


# Set Execution policy temporarily

$defaultPolicy = Get-ExecutionPolicy
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process


# Ask for backup path
# Paste your back up path HERE between "" 

#---for example: $bk_path = "D:\Backup"---#
$bk_path = ""
#---


# If not set, ask for user input at first

if ( "" -eq $bk_path ){
    $bk_path = Read-Host -Prompt "Paste your backup path"
}


# Set usful vars

$uname = $env:USERNAME
$bk_file_Local = $bk_path+"\osulazer.zip"
$bk_file_Roaming = $bk_path+"\osu.zip"


# Extract two zip files to respective path
# NOTE that these commands include -Force option
# Which would overwrite the existing files under two path below:
# %USERNAME%\AppData\Local\osulazer\
# %USERNAME%\AppData\Roaming\osu\

try{
	7z x $bk_file_Local -y -o"C:\Users\$uname\AppData\Local\osulazer\"
	7z x $bk_file_Roaming -y -o"C:\Users\$uname\AppData\Roaming\osu\"
}
catch{
	Expand-Archive -Force -LiteralPath $bk_file_Local -DestinationPath "C:\Users\$uname\AppData\Local\"
	Expand-Archive -Force -LiteralPath $bk_file_Roaming -DestinationPath "C:\Users\$uname\AppData\Roaming\"
}


# Set ExecutionPolicy Back to default
Set-ExecutionPolicy -ExecutionPolicy $defaultPolicy -Scope Process