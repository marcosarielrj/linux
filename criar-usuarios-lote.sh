#!/bin/bash

echo "Criando usuários no sistema"

useradd guest5 -c "Usuário Convidado" -m -s /bin/bash -p $(openssl passwd -crypt senha123) - senha atual capital00
passwd guest5 -e

useradd guest6 -c "Usuário Convidado" -m -s /bin/bash -p $(openssl passwd -crypt senha123)
passwd guest6 -e

useradd guest8 -c "Usuário Convidado" -m -s /bin/bash -p $(openssl passwd -crypt senha123)
passwd guest8 -e

useradd guest7 -c "Usuário Convidado" -m -s /bin/bash -p $(openssl passwd -crypt senha123)
passwd guest7 -e

echo "Finalizado"
