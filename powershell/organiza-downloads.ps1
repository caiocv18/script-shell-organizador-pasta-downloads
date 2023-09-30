# Codificando com UTF-8 para que seja possível a utilização de acentuações
$script = Get-Content -Path organiza-downloads.ps1
$script | Set-Content -Path organiza-downloads.ps1 -Encoding UTF8

# Mensagem informando que o script está sendo iniciado
Write-Host "Iniciando o script de organização da pasta de downloads..."

# Diretório de downloads
$downloads_dir = "$env:USERPROFILE\Downloads"
