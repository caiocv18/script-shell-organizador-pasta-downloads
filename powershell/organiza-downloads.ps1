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
    # Informa qual arquivo está sendo movido
	Write-Host "Movendo arquivo: $arquivo ..."
    $extensao = $arquivo.Extension.TrimStart(".")
    # Condicional para verificar se a extensão não veio como vazia
    if ($extensao -ne "") {
        # Condicional para verificar se arquivo se enquadra em alguma das extensões mapeadas. Ao enquadrar, é retornado o diretório destino
        $diretorioDestino = switch -Wildcard ($extensao) {
            #Videos
            "mp4" { $videos_dir }
            "mkv" { $videos_dir }
            "avi" { $videos_dir }
            "mov" { $videos_dir }

            #Imagens
            "jpg" { $imagens_dir }
            "jpeg"{ $imagens_dir }
            "png" { $imagens_dir }
            "gif" { $imagens_dir }
            "bmp" { $imagens_dir }
            
            #Documentos
            "pdf" { $documentos_dir }
            "doc" { $documentos_dir }
            "docx"{ $documentos_dir }
            "ppt" { $documentos_dir }
            "pptx"{ $documentos_dir }
            "xls" { $documentos_dir }
            "xlsx"{ $documentos_dir }
            "odt" { $documentos_dir }
            "odp" { $documentos_dir }
            "ods" { $documentos_dir }
            "txt" { $documentos_dir }
            #Musicas
            "mp3" { $musicas_dir }
            "wav" { $musicas_dir }
            "flac"{ $musicas_dir }

            #Outros
            default { $outros_dir }
        }
        # Move o arquivo para o respectivo diretório destino
        Move-Item -Path $arquivo.FullName -Destination $diretorioDestino
    }
}
