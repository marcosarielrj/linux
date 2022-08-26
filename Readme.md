Comandos linux

sudo su - acessa root.
su nomedousuário - loga no usuário
cat - exibe um arquivo
comando --help acessa ajuda do comando

Manipular pastas e arquivos: 

ls - exibe os arquivos da pasta. ls -l aparece em lista os arquivos e pastas
mkdir - cria uma pasta
cd - abre uma pasta - cd .. abri uma pasta um nível acima

nano - editor de texto padrão - nano nomedoarquivo - para criar um arquivo de texto

Scripts:

para criar um script - a extensão do arquivo tem que ser .sh

primeira - linha de scripts tem que ser 

script para adicionar usuários em lote

#!/bin/bash

echo "Criando usuários no sistema"

useradd guest5 -c "Usuário Convidado" -m -s /bin/bash -p $(openssl passwd -crypt sennha123) - senha atual capital00
passwd guest5 -e

useradd guest6 -c "Usuário Convidado" -m -s /bin/bash -p $(openssl passwd -crypt sennha123)
passwd guest6 -e

useradd guest8 -c "Usuário Convidado" -m -s /bin/bash -p $(openssl passwd -crypt sennha123)
passwd guest8 -e

useradd guest7 -c "Usuário Convidado" -m -s /bin/bash -p $(openssl passwd -crypt sennha123)
passwd guest7 -e

echo "Finalizado"


Gerenciando usuários:

listar usuários - cat /etc/passwd
listar grupos - cat /etc/group

criptografar uma senha - openssl passwd -crypt senha 

Quando um usuário é criado também é criado um grupo com seu nome.
Usuários no servidor linux realizam manutenções ou consomem recursos do mesmo ex: "joaodasilva" "acessaarquivos" "alterar"

criar usuário - useradd nomedousuario - não cria pasta do usuário nem define senha.
parâmetros: 	-m - cria a pasta home do usuário
		-c - define o nome do usuário "Nome do Usuário" pode ser a função deste usuário "acessaarquivo"
		-p - define a senha/password
		-s - padrão é "/bin/bash" define o shell padrão
		-e - define data de expiração do usuário
		-p - definir senha - $(openssl passwd -crypt senha123) - abre e fecha parenteses depois do cifrão.

alterar usuário - usermod - mesmos comandos de useradd -m -s
		-G - adm,sudo nomedousuario

cadastrar senha - passwd nomedousuário -e "define a expiração da senha se não definir a data expira na hora"

excluir usuário - userdel -f "nomedousuario"
parâmetros: 	-f - força a exclusão
		-r - remove a pasta usuário de /home

definir shell do usuário se não foi definido na criação - chsh -s /bin/bash nomedousuario

