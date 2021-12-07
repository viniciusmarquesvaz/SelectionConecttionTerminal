#!/bin/bash
ITEM_SELECIONADO=$(zenity  --list  --text "Selecione o Terminal que deseja entrar" \
    --radiolist \
    --column "Marcar" \
    --column "Ambiente Terminal" \
    FALSE Financeiro TRUE Rh FALSE Compras FALSE Ciex FALSE Dp False Logística FALSE );
if [ ITEM_SELECIONADO  == "TRUE Financeiro" ]; then    
xfreerdp /v:ts.compras\
/multimon \
/u:$(zenity \
--entry \
--title="Usuário" \
--text="Digite o usuário") \
/p:$(zenity \
--entry \
--title="Senha" \
--text="Digite a senha:" \
--hide-text) \
/d:farid \
/f \
/cert-ignore
+clipboard
elif [ ITEM_SELECIONADO  == "Rh" ]; then    
xfreerdp /v:ts.Rh\
/multimon \
/u:$(zenity \
--entry \
--title="Usuário" \
--text="Digite o usuário") \
/p:$(zenity \
--entry \
--title="Senha" \
--text="Digite a senha:" \
--hide-text) \
/d:farid \
/f \
/cert-ignore
+clipboard
elif [ ITEM_SELECIONADO  == "Logística" ]; then    
xfreerdp /v:ts.Logística\
/multimon \
/u:$(zenity \
--entry \
--title="Usuário" \
--text="Digite o usuário") \
/p:$(zenity \
--entry \
--title="Senha" \
--text="Digite a senha:" \
--hide-text) \
/d:farid \
/f \
/cert-ignore
+clipboard
elif [ ITEM_SELECIONADO  == "Ciex" ]; then    
xfreerdp /v:ts.Ciex\
/multimon \
/u:$(zenity \
--entry \
--title="Usuário" \
--text="Digite o usuário") \
/p:$(zenity \
--entry \
--title="Senha" \
--text="Digite a senha:" \
--hide-text) \
/d:farid \
/f \
/cert-ignore
+clipboard
elif [ ITEM_SELECIONADO  == "Dp" ]; then    
xfreerdp /v:ts.Dp\
/multimon \
/u:$(zenity \
--entry \
--title="Usuário" \
--text="Digite o usuário") \
/p:$(zenity \
--entry \
--title="Senha" \
--text="Digite a senha:" \
--hide-text) \
/d:farid \
/f \
/cert-ignore
+clipboard

