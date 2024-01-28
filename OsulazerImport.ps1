### NOTE: This Import method would load THE WHOLE SESSION as two zips
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
    $user_input = Read-Host -Prompt "Paste your backup path and hit Enter, or simply press Enter if there's a OsuBackup folder with your scripts"
    if ("" -eq $user_input){
    	Write-Output "Using default path..."
    } else {
    	$bk_path = $user_input
    }
}


# Set usful vars

$uname = $env:USERNAME
$bk_file_Local = $bk_path+"\osulazer.zip"
$bk_file_Roaming = $bk_path+"\osu.zip"
$lazerzip_exist = Test-Path -Path $bk_file_Local
$osuzip_exist = Test-Path -Path $bk_file_Roaming


# Error Catch for zip files not exist
# If not exist either file, Require user input.

if ($lazerzip_exist -And $osuzip_exist){
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
}
else{
	Write-output "More than one zip files missing, check your path!"
	Read-Host -Prompt "Press Enter key to exit..."
}


# Set ExecutionPolicy Back to default

Set-ExecutionPolicy -ExecutionPolicy $defaultPolicy -Scope Process