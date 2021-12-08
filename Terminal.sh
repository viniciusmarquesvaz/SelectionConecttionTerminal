#!/bin/bash

USUARIO=$(zenity --entry --title="Usuário" --text="Digite o usuário")
PASS=$(zenity --entry --title="Senha" --text="Digite a senha:" --hide-text)
GROUPS=$(ldapsearch -x -H "ldap://192.168.0.18" -b "dc=intranet,dc=farid" -D "cn=ntservicos,ou=Servicos,dc=intranet,dc=farid" -w "e9.vf4?f76" "sAMAccountName=${USUARIO}" memberof | sed -n "/^memberOf:/p")
SERVER="ts.intranet.farid"

echo $GROUPS
case $GROUPS in
	*"RDS-LOGISTICA"*)
		SERVER="ts-logistica.intranet.farid"
		;;
	*"RDS-MAISCOR"*)
		SERVER="ts-maiscor.intranet.farid"
		;;
	*"RDS-FINANCEIRO"*)
		SERVER="ts-financeiro.intranet.farid"
		;;
	*"RDS-CONTABILIDADE"*)
		SERVER="ts-contabilidade.intranet.farid"
		;;
	*"RDS-COMPRAS"*)
		SERVER="ts-compras.intranet.farid"
		;;
	*"RDS-RH"*)
		SERVER="ts-rh.intranet.farid"
		;;
esac

echo $SERVER
xfreerdp /v:$SERVER /multimon /u:$USUARIO /p:$PASS /d:farid /f /cert-ignore +clipboard