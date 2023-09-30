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