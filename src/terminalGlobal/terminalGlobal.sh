#!/bin/bash

USUARIO=$(zenity --entry --title="Usuário" --text="Digite o usuário")
PASS=$(zenity --entry --title="Senha" --text="Digite a senha:" --hide-text)
GROUPS=$(ldapsearch -x -H "ldap://192.168.0.18" -b "dc=intranet,dc=fulano" -D "cn=ntservicos,ou=Servicos,dc=intranet,dc=fulano" -w "e9.vf4?f76" "sAMAccountName=${USUARIO}" memberof | sed -n "/^memberOf:/p")
SERVER="ts.intranet.fulano"

echo $GROUPS  #insert the names of connection groups for your system's GPO
case $GROUPS in
	*"RDS-LOGISTICA"*)  
		SERVER="ts-logistica.intranet.fulano"
		;;
	*"RDS-MAISCOR"*)
		SERVER="ts-maiscor.intranet.fulano"
		;;
	*"RDS-FINANCEIRO"*)
		SERVER="ts-financeiro.intranet.fulano"
		;;
	*"RDS-CONTABILIDADE"*)
		SERVER="ts-contabilidade.intranet.fulano"
		;;
	*"RDS-COMPRAS"*)
		SERVER="ts-compras.intranet.fulano"
		;;
	*"RDS-RH"*)
		SERVER="ts-rh.intranet.fulano"
		;;
esac

echo $SERVER
xfreerdp /v:$SERVER /multimon /u:$USUARIO /p:$PASS /d:fulano /f /cert-ignore +clipboard