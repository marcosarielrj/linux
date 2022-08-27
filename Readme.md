

# Comandos linux

* sudo su - acessa root.
* su nomedousuário - loga no usuário - ex: su joao - loga no usuário joao
* cat - exibe um arquivo - ex: cat teste.txt
* comando --help acessa ajuda do comando ex: apt --help
* nano - editor de texto padrão - nano nomedoarquivo - para criar/abrir um arquivo de texto usando o editor
* touch - cria um arquivo - ex: touch teste.txt
* ip a - mostra propriedades de rede, antigo ifconfig.
* wget - baixar arquivos da internet - ex: wget https://github.com/marcosarielrj/linuxexperience/archive/refs/heads/main.zip
* unzip - descompacta arquivos .zip - apt install unzip - ex: unzip main.zip
* ps - mostra os processos que estão sendo executados.
	- ps a - mostra o processo de todos os usuários
	- ps u - fornece o nome do usuário e a hora que iniciou o processo.
	- ps x - processos chamados fora do console.
	- ps aux
* kill - mata um processo - kill piddoprocesso - killall chrome - mata todos os processos do chrome.
* w - mostra os usuários logados - who -a mostra mais informações dos usuários logados.

# Manipular pastas e arquivos: 

* ls - exibe os arquivos da pasta. ls -l aparece em lista os arquivos e pastas e suas características e permissões.
* mkdir - cria uma pasta
* cd - abre uma pasta - cd .. abri uma pasta um nível acima
* rm - remove um arquivo/pasta - ex: rm teste.txt
* cp - copiar arquivos -
	- cp /home/user/nomedoarquivo /pastadestino
	- cp "/pasta/*.txt* /pastadestino - copia todos os arquivos com extensão.txt
	- cp /pastaorigem/a* /pastadestino - copia todos os arquivos q iniciam com a letra a.
	- cp /pastaorigem /pastadestino -i - para que o cp pergunte quando há arquivos com o mesmo nome o que fazer.
	- cp -r - copia arquivos e pastas.
	- cp -v - mostra o status do processo
* mv - mover e renomear arquivos - mv /pastaorigem/arquivo /pastadestino

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
Nos sistemas baseados em Debian/Ubuntu usa-se o apt e o apt-get. Nos sistemas baseados Fedora/RedHat/CentOs usa-se dnf e yum.
Para instalar um aplicativo no ambiente gráfico utiliza a extensão .deb.
Instala, atualiza, remove pacotes.
Pacote pode ser um software, um driver, um codec.
Cuidado ao realizar atualização instalação, fazer backup antes. Se o servidor estiver em ambiente de produção, sempre necessário usar um ambiente de teste.
* apt-get - mais baixo nível, mais usado para scripts, necessita informações precisas.
	- update - atualiza a lista de pacotes.
	- upgrade - ecuta atualização dos pacotes instalados.
	- install - instala novos pacotes
	- reinstall - reinstala pacotes
	- remove - remove um pacote - -y remove sem perguntar nada.
	...
	
* apt - mais moderno, interação mais amigável
	- list - mostra todos os pacotes disponíveis no servidor da ubunt.
	- list --instaled - os que estão instalados na máquina.
	- list --upgradeable - mostra os pacotes que podem ser atualizados.
	- update - verifica a lista de pacotes a atualizar.
	- apt -install arquivo.deb - instala arquivos de um executável.
	
# Gerenciamento de Discos
Sistemas de arquivos é um padrão, uma forma como o sistema operacional usa para controlar como os dados são armazenados e recuperados.
* Windows - NTFS - FAT32
* Linux - Debian/Ubuntu ext4 - Fedora/Red Hat XFS.
* Discos no Linux são descritos no sistemas como sda, sdb, sdc - a,b,c para a quantidade de discos. E as partições com número a frente do disco: sda1, sda2, sda3, sdb1, sdb2 ...
* Comandos para ver os discos no linux - lsblk - fdisl -l
* Criando uma partição - fdisk /dev/sdx - já no fdisk opções n(nova partição), p(primária), nº 1 a 4, setores padrão, w para salvar e sair.
* Formatando a partição criada - mkfs.sistemadearquivos /dev/sdx (caminho do disco) - ex: mkfs.ntfs /dev/sdb - mkfs.ext4 /dev/sdc
* /mnt/ - pasta onde ficam as partições montadas - para montar um disco criar uma pasta no mnt - depois mount /dev/sdb /mnt/disco2 - caminho do disco capinho da pasta onde ficará montado o disco. Para desmontar umount /dev/sdb - caminho do disco.
* Montar automaticamente os discos - nano /etc/fstab - adiciona uma linha com /dev/sdb(caminho do disco) /disk2/(caminho da pasta onde será montado) ext4(sistema de arquivos) defaults 0 0 - salvar.


