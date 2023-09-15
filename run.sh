#!/bin/bash



arquivo_origem="/home/data/bd.json"
arquivo_destino="home/data/teste/bd.json"

# Verifique se o arquivo de origem existe
if [ -e "$arquivo_origem" ]; then
  echo "O arquivo de origem existe. Não é necessário mover."
else
  # O arquivo de origem não existe, mova-o para o destino
  mv "$arquivo_destino" "$arquivo_origem"
  echo "O arquivo foi movido para $arquivo_origem."
fi


json-server --watch /home/data/teste/bd.json -p 8080 --host 0.0.0.0