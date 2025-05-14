#!/bin/bash

snaps_install(){
    echo -e "\e[1;34m===== 🔥 Installing Snap Applications =====\e[0m"
    
    # Lista de aplicativos Snap
    snaps=("postman" "intellij-idea-ultimate" "code" "snap-store")

    for snap in "${snaps[@]}"; do
        echo ""  # Adiciona uma linha em branco entre os aplicativos
        if ! snap list "$snap" &> /dev/null; then
            echo -e "\e[33m$snap is not installed. Installing...\e[0m"
            # Comando sem redirecionamento, a saída será visível
            sudo snap install "$snap" --classic
            # Verifica o sucesso da instalação
            if [[ $? -eq 0 ]]; then
                echo -e "\e[32m✔️  $snap installed successfully.\e[0m"
            else
                echo -e "\e[31m❌  Failed to install $snap.\e[0m"
            fi
        else
            echo -e "\e[32m✔️  $snap is already installed.\e[0m"
        fi
    done
}
