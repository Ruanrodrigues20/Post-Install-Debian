#!/bin/bash

downloads(){
    echo -e "\e[1;34m===== 📥 Downloading Extra Software =====\e[0m"
    echo ""
    echo -e "\e[1;34m===== 🔥 Installing Fastfetch =====\e[0m"
    echo ""
    # Download and install Fastfetch
    #
    wget https://github.com/fastfetch-cli/fastfetch/releases/download/2.42.0/fastfetch-linux-amd64.deb
    sudo dpkg -i *.deb
    rm *.deb
}
