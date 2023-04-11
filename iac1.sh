#!/bin/bash

while getopts ":n:g:" OPCAO; do
  case $OPCAO in
     n) USUARIO="$OPTARG"
	;;   
     g) GRUPO="$OPTARG"
	;;
  esac
done

if [ ! -e /etc/group/$GRUPO ]; then
	groupadd $GRUPO
fi

if [ ! -e /$GRUPO ]; then
	mkdir /$GRUPO
fi

if [ ! -e /publico ]; then
        mkdir /publico && chmod 777 /publico 
fi

useradd $USUARIO -c "$USUARIO" -m -s /bin/bash -p $(openssl passwd -6 Senha123) -G $GRUPO  &&
chmod 770 /home/$USUARIO && chmod 770 /$GRUPO && echo "Feito."

exit 0


