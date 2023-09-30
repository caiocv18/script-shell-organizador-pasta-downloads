#!/bin/bash

# Mensagem informando que o script está sendo iniciado
echo "Iniciando o script de organização da pasta de downloads..."

# Diretório de downloads
downloads_dir="$HOME/Downloads"

# Diretórios de destino para diferentes tipos de arquivos
imagens_dir="$HOME/Downloads/Imagens"
documentos_dir="$HOME/Downloads/Documentos"
musicas_dir="$HOME/Downloads/Músicas"
videos_dir="$HOME/Downloads/Vídeos"
outros_dir="$HOME/Downloads/Outros"

# Certifique-se de que os diretórios de destino existam
mkdir -p "$imagens_dir" "$documentos_dir" "$musicas_dir" "$videos_dir" "$outros_dir"

# Obtenha uma lista de arquivos no diretórios de downloads
arquivos="$downloads_dir"/*

# Laço de repetição para que seja possível analisar individualmente cada arquivo
for arquivo in $arquivos; do
    # Condicional para verificar se é um arquivo válido e não um diretório
    if [ -f "$arquivo" ]; then
        extensao="${arquivo##*.}"
		# Condicional para verificar se arquivo se enquadra em alguma das extensões mapeadas
        case "$extensao" in
            jpg|jpeg|png|gif|bmp)
                echo "O arquivo é uma imagem"
                ;;
            pdf|doc|docx|ppt|pptx|xls|xlsx|odt|odp|ods|txt)
                echo "O arquivo é um documento"
                ;;
            mp3|wav|flac)
                echo "O arquivo é uma música"
                ;;
            mp4|mkv|avi|mov)
                echo "O arquivo é um vídeo"
                ;;
            *)
                echo "O arquivo não está entre os tipos de arquivo mapeados"
                ;;
        esac
    fi
done