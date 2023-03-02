docker cp index.html webserver:/usr/local
/apache2/htdocs#!/bin/bash

echo '=== adicionado a imagem http ao repositório local ==='
docker pull httpd

echo '=== verificando as imagens no repositório local ==='
docker images

echo '=== colocando o container em execução ==='
docker run --name webserver -d -p 8080:80 httpd

echo '=== validando os containers em execução ==='
docker ps

echo '=== instalando o unzip e wget ==='
apt install unzip
apt install wget

echo '=== criando uma pasta para receber o arquivo zip com a página html ==='
mkdir /website
cd /website
wget https://github.com/digitalinnovationone/cv/archive/refs/heads/main.zip

echo '=== extraindo o arquivo zip ==='
unzip main.zip

echo '=== copiado o arquivo html para o diretório htdocs ==='
cd cv-main/
docker cp index.html webserver:/usr/local/apache2/htdocs

echo '=== finalizando esta estapa ==='
