#!/bin/bash

downloads(){
    echo -e "\e[1;34m===== 📥 Downloading Extra Software =====\e[0m"
    echo ""
    # Download and install Fastfetch
    #
    wget https://github.com/fastfetch-cli/fastfetch/releases/download/2.42.0/fastfetch-linux-amd64.deb
    wget http://ftp.de.debian.org/debian/pool/contrib/m/msttcorefonts/ttf-mscorefonts-installer_3.8.1_all.deb
    sudo apt install ./*.deb -y
    rm *.deb
}
