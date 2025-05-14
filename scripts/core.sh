#!/bin/bash

remove_trava(){
    sudo rm -f /var/lib/dpkg/lock-frontend
    sudo rm -f /var/lib/dpkg/lock
    sudo rm -f /var/cache/apt/archives/lock
    sudo rm -f /var/lib/apt/lists/lock
    sudo dpkg --configure -a
}

update(){
    echo -e "\e[1;34m===== 🔥 Updating System =====\e[0m"
    echo ""
    remove_trava
    sudo apt update
    sudo apt upgrade -y
    sudo apt autoremove -y
    sudo apt clean
}

install() {
    remove_trava
    local packages=("$@")  # Recebe a lista de pacotes como argumento
    for dep in "${packages[@]}"; do
        echo ""  # Salta uma linha antes de cada pacote

        # Verificar se o pacote está instalado usando dpkg
        if ! dpkg -l | grep -E "^ii\s+$dep" &> /dev/null; then
            echo -e "\e[33m$dep is not installed. Installing...\e[0m"
            # Redirecionando a saída para /dev/null e mostrando erro apenas em caso de falha
            if sudo apt install -y $dep &> /dev/null; then
                echo -e "\e[32m✔️  $dep installed successfully.\e[0m"
            else
                echo -e "\e[31m❌  Failed to install $dep.\e[0m"
            fi
        else
            echo -e "\e[32m✔️  $dep is already installed.\e[0m"
        fi
    done
}

ask_to_restart(){
    read -p "Do you want to restart your system now? (y/n): " ans
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        sudo reboot
    fi
}



git_config(){
    echo "Are you sure you want to set up git? (y/n)"
    read -p "Enter your choice: " choice
    if [[ "$choice" != "y" && "$choice" != "Y" ]]; then
        echo "Skipping git setup."
        return
    fi

    echo "Setting up git..."

    read -p "Enter your user name: " name
    echo "Your user name is: $name"

    read -p "Enter your email: " email
    echo "Your email is: $email"

    git config --global user.name "$name"
    git config --global user.email "$email"

    echo "Git config set successfully."
}

setup_directories() {
    mkdir -p ~/Projects ~/Downloads ~/Documents ~/Pictures ~/Videos
}

