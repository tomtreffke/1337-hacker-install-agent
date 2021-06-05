#!/bin/sh
if [[ $EUID -ne 0 ]]; then
   	echo "This script must be run as root" 
   	exit 1
else
    echo "exec pacman -Yu"
    pacman -Syu
    
    clear
    echo "starting software installation - basics"
    pacman -Syu wget curl git teamviewer zsh oh-my-zsh zsh-theme-powerlevel10k libreoffice dislocker gnome-shell-extensions
    
    echo "starting software installation - web"
    pacman -Syu chromium firefox 
    
    echo "starting software installation - dev"
    pacman -Syu vscode podman buildah ansible filezilla htop vagrant go go-tools 

    echo "\n\n +++++++++++++++++++++ \n 
    starting virtualization setup"
    pacman -Syu libvirt qemu virt-manager

    echo "connectivity"
    pacman -Syu forticlient-vpn

    echo "starting software installation - entertainment"

    pacman -Syu spotify
    
    echo "installing most important piece of software"
    pacman -Syu install cmatrix


    echo "loading ZSH config"
    cp common/.zshrc ~/.zshrc





    # end of script
    cmatrix   
fi