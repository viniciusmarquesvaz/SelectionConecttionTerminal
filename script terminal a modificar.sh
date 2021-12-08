#!/bin/bash

# XFreeRDP RemoteApp W/ Prompt Script
# Version 0.3
# Description:
# XFreeRDP Remote App Script utilizing Zentity to populate variables
# Written by Jarrett Higgins 12-2015

OUTPUT=$(zenity --forms --title="Connection Information" \
    --text="Enter information about your Remote Connection" \
    --separator="," \
    --add-entry="Server" \
    --add-entry="Port (Default: 3389)" \
    --add-entry="Domain (Optional)" \
    --add-entry="Username" \
    --add-password="Password" \
    --add-entry="Remote App Name (Optional)")
OUTPUT_RESULTS=$?
if ((OUTPUT_RESULTS != 0)); then
    echo "something went wrong"
    exit 1
fi
Blank=""
Server=$(awk -F, '{print $1}' <<<$OUTPUT)
Port=$(awk -F, '{print $2}' <<<$OUTPUT)
if ["$Port" = "$Blank"]
then
    Port="3389"
else
    Port="$Port"
fi
Domain=$(awk -F, '{print $3}' <<<$OUTPUT)
Username=$(awk -F, '{print $4}' <<<$OUTPUT)
Password=$(awk -F, '{print $5}' <<<$OUTPUT)
App=$(awk -F, '{print $6}' <<<$OUTPUT)
if ["$App" = "$Blank"]
then
    App="$App"
    Title="$Server"
else
    AppName="$App"
    Title="$AppName on $Server"
    App="/app:||$App"
fi
#zenity --info --title="Information Return" --text="$Server $Port $Domain $Username $Password $App"
xfreerdp /t:"$Title" /v:$Server:$Port /d:$Domain /u:$Username /p:$Password $App /cert-ignore /workarea +clipboard
Password=""