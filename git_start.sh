#!/bin/bash

if [ -z $1 ] && [ -z $2 ]; then
	echo "Digite o nome e o seu email"
	exit
fi


git init

git config --global user.name "$1"
git config --global user.email "$2"

read -p "Quer criar uma chave ssh? [S/n] "
R=${REPLY^^}


if [ -z "$R" ] || [ "$R" = "S" ]; then
	ssh-keygen -t rsa -b 4096 -C "$1"
	eval "$(ssh-agent -s)"

	echo -e "Copie e cole o code ssh no GitHub\n\n"
	cat ~/.ssh/id_rsa.pub
fi
