#!/bin/bash

setup_aliases_and_tools(){
    echo -e "\e[1;34m===== 🔥 Configuration of the Aliases =====\e[0m"
    echo ""

    # Aliases
    cat <<EOF >> ~/.bash_aliases

# Aliases úteis
alias ll='ls -lah'
alias gs='git status'
alias gp='git push'
alias gl='git log --oneline --graph'
alias update='echo "Updates DEBs"; echo ""; sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y;  echo "";echo "Updates Snaps"; echo "";sudo snap refresh;  echo ""; echo "Updates Flatpaks"; echo "";sudo flatpak update -y'
alias bat='upower -i /org/freedesktop/UPower/devices/battery_BAT1'
EOF

    echo "Aliases adicionados a ~/.bash_aliases"

    # Garante que o arquivo ~/.bash_aliases será carregado no .bashrc
    if ! grep -q "source ~/.bash_aliases" ~/.bashrc; then
        echo "source ~/.bash_aliases" >> ~/.bashrc
        echo "Linha 'source ~/.bash_aliases' adicionada ao ~/.bashrc"
    fi
}

