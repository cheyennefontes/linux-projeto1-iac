#!/bin/bash


echo "Digite o nome do usuário ou q para sair:"

read NOME

while [ $NOME != "q" ];
do

echo "Deletando usuário..."


userdel -r "$NOME"

echo "Digite o nome do usuário ou q para sair:"
read NOME

echo "Finalizando"
done

