#!/bin/sh
if [[ $EUID -ne 0 ]]; then
   	echo "This script must be run as root" 
   	exit 1
else
    echo "exec pacman -Yu"
    pacman -Syu --noconfirm
    
    clear
    echo "starting software installation - basics"
    pacman -Syu --noconfirm wget curl git teamviewer zsh oh-my-zsh zsh-theme-powerlevel10k libreoffice dislocker gnome-shell-extensions os-prober openssh npm man-pages yay
    
    echo "starting software installation - web"
    pacman -Syu --noconfirm chromium firefox 
    
    # no vscode, I'll install this from binary (deb) and convert it to pacman-managable package.
    echo "starting software installation - dev"
    pacman -Syu --noconfirm \
        podman \
        buildah \
        ansible \
        filezilla \
        htop \
        vagrant \
        packer \
        go \
        go-tools \
        go-yq-bin \
        azure-cli \
        kubectl \
        helm \


    echo "\n\n +++++++++++++++++++++ \n 
    starting virtualization setup"
    pacman -Syu --noconfirm libvirt qemu virt-manager

    echo "connectivity"

    echo "starting software installation - entertainment"

    pacman -Syu --noconfirm spotify
    
    echo "installing most important piece of software"
    pacman -Syu --noconfirm cmatrix

    echo "AUR packages"
    pacman -Syu --noconfirm teams


    echo "loading ZSH config"
    cp common/.zshrc ~/.zshrc





    # end of script
    cmatrix   
fi