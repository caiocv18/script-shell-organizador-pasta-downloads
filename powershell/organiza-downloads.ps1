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
    } else {
        New-Item -Path $dir -ItemType Directory -Force
    }
}

# Obtenha uma lista de arquivos no diretórios de downloads
$arquivos= Get-ChildItem -Path $downloads_dir | Where-Object { -not $_.PSIsContainer }

# Laço de repetição para que seja possível analisar individualmente cada arquivo
foreach ($arquivo in $arquivos) {
    $extensao = $arquivo.Extension.TrimStart(".")
    # Condicional para verificar se a extensão não veio como vazia
    if ($extensao -ne "") {
        # Condicional para verificar se arquivo se enquadra em alguma das extensões mapeadas
        switch -Wildcard ($extensao) {
            #Videos
            "mp4" { Write-Host "O arquivo é um vídeo" }
            "mkv" { Write-Host "O arquivo é um vídeo" }
            "avi" { Write-Host "O arquivo é um vídeo" }
            "mov" { Write-Host "O arquivo é um vídeo" }

            #Imagens
            "jpg" { Write-Host "O arquivo é uma imagem" }
            "jpeg"{ Write-Host "O arquivo é uma imagem" }
            "png" { Write-Host "O arquivo é uma imagem" }
            "gif" { Write-Host "O arquivo é uma imagem" }
            "bmp" { Write-Host "O arquivo é uma imagem" }
        
            #Documentos
            "pdf" { Write-Host "O arquivo é um documento" }
            "doc" { Write-Host "O arquivo é um documento" }
            "docx"{ Write-Host "O arquivo é um documento" }
            "ppt" { Write-Host "O arquivo é um documento" }
            "pptx"{ Write-Host "O arquivo é um documento" }
            "xls" { Write-Host "O arquivo é um documento" }
            "xlsx"{ Write-Host "O arquivo é um documento" }
            "odt" { Write-Host "O arquivo é um documento" }
            "odp" { Write-Host "O arquivo é um documento" }
            "ods" { Write-Host "O arquivo é um documento" }
            "txt" { Write-Host "O arquivo é um documento" }
            #Musicas
            "mp3" { Write-Host "O arquivo é uma música" }
            "wav" { Write-Host "O arquivo é uma música" }
            "flac"{ Write-Host "O arquivo é uma música" }

            #Outros
            default { Write-Host "O arquivo não está entre os tipos de arquivo mapeados" }
        }
    }
}
