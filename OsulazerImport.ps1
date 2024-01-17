# Ask for backup path
# Set usful vars

$bk_path = Read-Host -Prompt "Paste your backup path"
$uname = $env:USERNAME
$bk_file_Local = $bk_path+"\osulazer.zip"
$bk_file_Roaming = $bk_path+"\osu.zip"

# Extract two zip files to respective path
# NOTE that these commands include -Force option
# Which would overwrite the existing files under two path below:
# %USERNAME%\AppData\Local\osulazer\
# %USERNAME%\AppData\Roaming\osu\

Expand-Archive -Force -LiteralPath $bk_file_Local -DestinationPath "C:\Users\$uname\AppData\Local\"

Expand-Archive -Force -LiteralPath $bk_file_Roaming -DestinationPath "C:\Users\$uname\AppData\Roaming\"