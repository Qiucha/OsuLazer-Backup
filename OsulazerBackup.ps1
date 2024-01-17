
$bk_path = Read-Host -Prompt "Paste your backup path"
$uname = $env:USERNAME
$bk_file_Local = $bk_path+"\osulazer.zip"
$bk_file_Roaming = $bk_path+"\osu.zip"

Compress-Archive -Force -Path "C:\Users\$uname\AppData\Local\osulazer\" -DestinationPath $bk_file_Local

Compress-Archive -Force -Path "C:\Users\$uname\AppData\Roaming\osu\"-DestinationPath $bk_file_Roaming
