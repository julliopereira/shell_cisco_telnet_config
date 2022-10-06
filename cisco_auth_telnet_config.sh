#!/bin/bash

# PERGUNTA AO USUARIO INFROMACOES PARA ACESSO E DESTINO
read -p "username: " USERNAME
read -s -p "password: " PASSWORD
read -p "<IP> do equipamento: " IP

# ADICIONE ABAIXO OS COMANDOS A SEREM APLICADOS NO EQUIPAMENTO
COMMAND="
configure terminal
line vty 0 4
login local
username cisco privilege 15 password cisco
enable secret 
"

# REALIZA TELNET NO EQUIPAMENTO E APLICA AS CONFIGURAÇÕES GRAVANDO RESULTADO EM /tmp/command
(
    echo -e "$USERNAME" ; sleep 1
    echo -e "$PASSWORD" ; sleep 1
    echo -e "$COMMAND" ; sleep 2 
) | telnet $IP > /tmp/command

# MOSTRA O CONTEUDO DO ARQUIVO /tmp/command
cat /tmp/command
