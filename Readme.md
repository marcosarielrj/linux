

# Comandos linux

* sudo su - acessa root.
* su nomedousuário - loga no usuário
* cat - exibe um arquivo
* comando --help acessa ajuda do comando
* nano - editor de texto padrão - nano nomedoarquivo - para criar um arquivo de texto

# Manipular pastas e arquivos: 

* ls - exibe os arquivos da pasta. ls -l aparece em lista os arquivos e pastas e suas características e permissões.
* mkdir - cria uma pasta
* cd - abre uma pasta - cd .. abri uma pasta um nível acima

# Scripts:

* para criar um script - a extensão do arquivo tem que ser .sh
* primeira - linha de scripts tem que ser #!/bin/bash

# Gerenciando usuários:

Quando um usuário é criado também é criado um grupo com seu nome.
Usuários no servidor linux realizam manutenções ou consomem recursos do mesmo ex: "joaodasilva" "acessaarquivos" "alterar"

* listar usuários - cat /etc/passwd
* listar grupos - cat /etc/group
* criptografar uma senha - openssl passwd -crypt senha 
* Criar usuário - useradd nomedousuario - não cria pasta do usuário nem define senha.

	- parâmetros:
	- -m - cria a pasta home do usuário
	- -c - define o nome do usuário "Nome do Usuário" pode ser a função deste usuário "acessaarquivo"
	- -p - define a senha/password
	- -s - padrão é "/bin/bash" define o shell padrão
	- -e - define data de expiração do usuário
	- -p - definir senha - $(openssl passwd -crypt senha123) - abre e fecha parenteses depois do cifrão.
	
	- ex: useradd joao -m -c "Joao da Silva" -s /bin/bash -p $(openssl passwd -crypt senha123) -G GRP_ADM

* Alterar usuário - usermod - mesmos comandos de useradd -m -s
	
	- -G - adm,sudo nomedousuario - define o grupo ao qual o usuário tem acesso
	- ex: usermod -G GRP_ADM joao; usermod -G GPR_VEN maria;

* Cadastrar senha - passwd nomedousuário -e "define a expiração da senha se não definir a data expira na hora"

* Excluir usuário - userdel -f -r "nomedousuario"
	- parâmetros: 	
 	- -f - força a exclusão
	- -r - remove a pasta usuário de /home

* Definir shell do usuário se não foi definido na criação - chsh -s /bin/bash nomedousuario
* Criar grupos de usuários - groupadd nomedogrupo - Ex: groupadd GRP_ADM - groupadd GRP_VEN
	Quando dá uma permissão a um grupo todos os usuários daquele grupo tem essa permissão.
* Excluir grupo - groupdel nomedogrupo - O mesmo precisa estar vazio.
* Excluir usuário do grupo - gpasswd -d nomedousuário nomedogrupo - ex: gpasswd -d joao sudo; gpasswd -d maria GRP_VEN

# Permissões
ls -l - exibe as atributos dos arquivos e pastas do diretório em questão
* drwxrwxrwx - r reade(ler) - w write(alterar escrever) x execute(exutar)
* Primeiro caracter indica se é um diretório d ou um arquivo -
* São 9 caracteres após o que define se é arquivo ou usuário:
	- Três próximos indicam a permissão do dono do arquivo/pasta wrx
	- Três intermediários a permissão do grupo sobre o arquivo/pasta wrx
	- Três finais a permissão de qualquer usuário wrx
	- ex: -rw-r--r-- 
*  
	 
	

