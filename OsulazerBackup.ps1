### NOTE: This Backup method would save THE WHOLE SESSION as two zips
### including maps, skins, songs, replays, collections, and also LOGIN STATUS.
### DO NOT SHARE THE ZIP FILES WITH OTHER PLAYER ONLY EXPECTING SHARING YOUR SONG COLLECTION !!!


# Set Execution policy temporarily

$defaultPolicy = Get-ExecutionPolicy
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process

$bk_path = Split-Path -Path $MyInvocation.MyCommand.Path -Parent
$bk_path = $bk_path+"\OsuBackup"

# Ask for backup path
# Paste your back up path below between "", and remove the "#" in front of $bk_path
#---for example: $bk_path = "D:\Backup"---#
#$bk_path = ""
#---


# If not set, ask for user input at first

if (((Split-Path -Path $MyInvocation.MyCommand.Path -Parent)+"\OsuBackup") -eq $bk_path){
    $user_input = Read-Host -Prompt "Paste your backup path and hit Enter, or simply press Enter to create a folder with your scripts."
    if ("" -eq $user_input){
	    if (!(Test-Path -Path $bk_path)) {
    		Write-Output "Creating default path..."
	    	New-Item -ItemType Directory -Path $bk_path
		}
    } else {
    	$bk_path = $user_input
    }
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