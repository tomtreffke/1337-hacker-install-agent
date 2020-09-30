#!/bin/sh
if [[ $EUID -ne 0 ]]; then
   	echo "This script must be run as root" 
   	exit 1
else
    echo "exec apt-get update -y"
    apt-get update -y
    
    echo "exec apt-get upgrade -y"
    apt-get upgrade -y
    
    clear
    echo "starting software installation - basics"
    apt-get install wget curl git teamviewer
    
    echo "starting software installation - web"
    apt-get install google-chrome-stable chromium-browser firefox
    
    echo "starting software installation - dev"
    apt-get install vscode
    
    echo "installing most important piece of software"
    apt-get install cmatrix







    # end of script
    cmatrix   
fi