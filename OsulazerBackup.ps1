### NOTE: This Backup method would save THE WHOLE SESSION as two zips
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

if (!(Test-Path -Path $bk_path)){
	Read-Host -Prompt "Path not found, please check your path. Press enter to exit..."
} else {
	# Set usful vars

	$uname = $env:USERNAME
	$bk_file_Local = $bk_path+"\osulazer.zip"
	$bk_file_Roaming = $bk_path+"\osu.zip"


	# Extract two zip files to respective path
	# NOTE that these commands include -Force option
	# Which would overwrite the existing zip files.

	try{
		7z a -r $bk_file_Local "C:\Users\$uname\AppData\Local\osulazer\*"
		7z a -r $bk_file_Roaming "C:\Users\$uname\AppData\Roaming\osu\*"
	}
	catch{
		Compress-Archive -Force -Path "C:\Users\$uname\AppData\Local\osulazer\" -DestinationPath $bk_file_Local
		Compress-Archive -Force -Path "C:\Users\$uname\AppData\Roaming\osu\"-DestinationPath $bk_file_Roaming
	}
}
	
# Set ExecutionPolicy Back to default

Set-ExecutionPolicy -ExecutionPolicy $defaultPolicy -Scope Process