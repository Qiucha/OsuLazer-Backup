
$bk_path = Read-Host -Prompt "Paste your backup path"
$uname = $env:USERNAME
$bk_file_Local = $bk_path+"\osulazer.zip"
$bk_file_Roaming = $bk_path+"\osu.zip"

Expand-Archive -Force -LiteralPath $bk_file_Local -DestinationPath "C:\Users\$uname\AppData\Local\"

Expand-Archive -Force -LiteralPath $bk_file_Roaming -DestinationPath "C:\Users\$uname\AppData\Roaming\"