#!/bin/bash

flatpak_install(){
    echo -e "\e[1;34m===== 🔥 Installing Flatpak Applications =====\e[0m"
    echo ""

    # Adiciona o repositório flathub se ainda não estiver adicionado
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

    # Lista de aplicativos para instalar
    apps=("com.discordapp.Discord" "org.gnome.DejaDup")

    # Loop para instalar as aplicações
    for app in "${apps[@]}"; do
        echo -e "\e[33mInstalling $app...\e[0m"
        flatpak install -y flathub "$app"
    done
}
