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
        # Informa qual arquivo está sendo movido
	    echo "Movendo arquivo: $arquivo ..."
        extensao="${arquivo##*.}"
        # Condicional para verificar se arquivo se enquadra em alguma das extensões mapeadas
        case "$extensao" in
            jpg|jpeg|png|gif|bmp)
                # Move o arquivo para o respectivo diretório destino
                mv "$arquivo" "$imagens_dir/"
                ;;
            pdf|doc|docx|ppt|pptx|xls|xlsx|odt|odp|ods|txt)
                mv "$arquivo" "$documentos_dir/"
                ;;
            mp3|wav|flac)
                mv "$arquivo" "$musicas_dir/"
                ;;
            mp4|mkv|avi|mov)
                mv "$arquivo" "$videos_dir/"
                ;;
            *)
                mv "$arquivo" "$outros_dir/"
                ;;
        esac
    fi
done

echo "Organizacao de pasta concluida!"
read -p "Pressione Enter para continuar...:"