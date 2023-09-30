# Codificando com UTF-8 para que seja possível a utilização de acentuações
$script = Get-Content -Path organiza-downloads.ps1
$script | Set-Content -Path organiza-downloads.ps1 -Encoding UTF8

# Mensagem informando que o script está sendo iniciado
Write-Host "Iniciando o script de organização da pasta de downloads..."

# Diretório de downloads
$downloads_dir = "$env:USERPROFILE\Downloads"

# Diretórios de destino para diferentes tipos de arquivos
$imagens_dir = "$env:USERPROFILE\Downloads\Imagens"
$documentos_dir = "$env:USERPROFILE\Downloads\Documentos"
$musicas_dir = "$env:USERPROFILE\Downloads\Músicas"
$videos_dir = "$env:USERPROFILE\Downloads\Vídeos"
$outros_dir= "$env:USERPROFILE\Downloads\Outros"

# Certifique-se de que os diretórios de destino existam
$diretorios = @(
    $imagens_dir,
    $documentos_dir,
    $musicas_dir,
    $videos_dir,
    $outros_dir
)

foreach ($dir in $diretorios) {
    if (Test-Path -Path $dir -PathType Container) {
        Write-Host "O diretório '$dir' já existe."
    } else {
        New-Item -Path $dir -ItemType Directory -Force
        Write-Host "Diretório '$dir' criado com sucesso."
    }
}
