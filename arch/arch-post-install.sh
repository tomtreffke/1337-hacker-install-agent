#!/bin/sh
if [[ $EUID -ne 0 ]]; then
   	echo "This script must be run as root" 
   	exit 1
else
    echo "exec pacman -Yu"
    pacman -Syu --noconfirm
    
    clear
    echo "starting software installation - basics"
    pacman -Syu --noconfirm \
        git \
        zsh-theme-powerlevel10k \
        gnome-shell-extensions \
        os-prober \
        yay
    
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
        kubectl \
        helm \
        openssh \
        npm \
        man-pages \
        zsh \
        oh-my-zsh \
        pamac


    echo "\n\n +++++++++++++++++++++ \n 
    starting virtualization setup"
    pacman -Syu --no-confirm libvirt qemu virt-manager

    echo "dev tools from AUR"
    pamac build yq2-bin azure-cli --no-confirm

    echo "connectivity"

    pamac build teamviewer dislocker --no-confirm

    echo "starting software installation - entertainment"

    pamac build spotify --no-confirm
    
    echo "installing most important piece of software"
    pamac build cmatrix --no-confirm

    echo "AUR packages"
    pamac build teams --no-confirm


    echo "loading ZSH config"
    #cp /../common/.zshrc ~/.zshrc





    # end of script
    echo "# # # # # # # # # # # # # \n\n FINISH \n\n # # # # # # # # # # # # "
fi