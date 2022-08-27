

# Comandos linux

* sudo su - acessa root.
* su nomedousuário - loga no usuário
* cat - exibe um arquivo - ex: cat teste.txt
* comando --help acessa ajuda do comando
* nano - editor de texto padrão - nano nomedoarquivo - para criar/abrir um arquivo de texto usando o editor
* touch - cria um arquivo - ex: touch teste.txt
* ip a - mostra propriedades de rede, antigo ifconfig.

# Manipular pastas e arquivos: 

* ls - exibe os arquivos da pasta. ls -l aparece em lista os arquivos e pastas e suas características e permissões.
* mkdir - cria uma pasta
* cd - abre uma pasta - cd .. abri uma pasta um nível acima
* rm - remove um arquivo/pasta - ex: rm teste.txt

# Scripts:

* para criar um script - a extensão do arquivo tem que ser .sh - ao criar o mesmo fica sem permissão de execução necessário alterar a permissão.
* primeira - linha de scripts tem que ser #!/bin/bash
* para executar um script - ./nomedoscript.sh

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
* Alterar dono de pasta/arquivo - logado como root
	- chown nomedousuario:nomedogrupo /nomedapastaarquivo/ - ex: chown joao:GRP_ADM /vendas/
* Alterar permissões de pasta/arquivo - logado como root
	- Leitura(R) valor 4 / Gravação(W) valor 2 / Execução(X) valor 1 / Nenhum(-) valor 0 
	- Somasse os valores ao definir - dono/grupo/todos - ex: 750
	- chmod dono/grupo/todos /pasta/ - ex: chmode 750 /teste/ - o dono tem todas porque soma os valores 4+2+1, o grupo tem leitura e execução 4+1, e todos tem nenhuma permissão 0
	- atribuir/retirar execução ao arquivo para o dono do mesmo - chmod +x - chmod -x

# Gerenciador de pacotes
Instala, atualiza, remove pacotes.
Pacote pode ser um software, um driver, um codec.
Cuidado ao realizar atualização instalação, fazer backup antes.
* apt-get - mais baixo nível, mais usado para scripts, necessita informações precisas.
	- -update - atualiza a lista de pacotes.
	- -upgrade - ecuta atualização dos pacotes instalados.
	- -install - instala novos pacotes
	- -reinstall - reinstala pacotes
	...
	
* apt - mais moderno, interação mais amigável
	- list - mostra todos os pacotes disponíveis no servidor da ubunt.
	- list --instaled - os que estão instalados na máquina.
	- list --upgradeable - mostra os pacotes que podem ser atualizados.

