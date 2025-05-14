#!/bin/bash
set -e

# Função para carregar os módulos
sources() {
    source wallpapers/wallpapers.sh
    for script in scripts/*.sh; do
        source "$script"
    done
}


# Verifica a conexão com a internet
check_internet_connection() {
    echo -e "\e[1;34m===== 🌐 Checking internet connection =====\e[0m"

    if ping -c 1 google.com &> /dev/null; then
        echo -e "\e[1;32m✔️ Internet is up!\e[0m"
    else
        echo -e "\e[1;31m❌ No internet connection detected. Please check your connection.\e[0m"
        exit 1
    fi
}

# Verifica se há atualizações no repositório
check_for_updates() {
    echo -e "\e[1;34m===== 🔎 Checking for updates =====\e[0m"

    # Pega a versão local do arquivo VERSION presente no repositório
    SCRIPT_VERSION=$(cat VERSION)

    # Pega a versão remota do arquivo VERSION no repositório do GitHub
    REMOTE_VERSION=$(curl -s https://raw.githubusercontent.com/Ruanrodrigues20/Post-Install-Debian/main/VERSION)

    # Compara a versão local com a versão remota
    if [[ "$SCRIPT_VERSION" != "$REMOTE_VERSION" ]]; then
        echo -e "\e[1;33m⚠️ A newer version is available: $REMOTE_VERSION (You have $SCRIPT_VERSION)\e[0m"
        echo -e "Visit \e[1;34mhttps://github.com/Ruanrodrigues20/Post-Install-Debian\e[0m to update."

        # Pergunta ao usuário se ele quer atualizar o repositório
        read -p "Do you want to update the repository to the latest version? (y/n): " ans
        if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
            echo -e "\e[1;34m🔄 Updating the repository...\e[0m"
            
            # Realiza o git pull para atualizar o repositório
            git pull origin main
            
            echo -e "\e[1;32m✅ Repository updated. Run the new version with ./main.sh\e[0m"
            exit 0
        fi
    else
        echo -e "\e[1;32m✅ You are using the latest version ($SCRIPT_VERSION)\e[0m"
    fi

    echo ""
}

# Exibe a mensagem de boas-vindas
show_intro_message(){
    echo -e "\e[1;34m🎉 Welcome! Starting the post-installation setup... 🚀\e[0m"
    echo "This script will help you install and configure useful 💻"
    echo "software and settings on your system. It's made for"
    echo "Debian 13, Ubuntu 24.04, and Pop!_OS 22.04. It might not"
    echo -e "work properly on other distros. Found a bug or something 🐞"
    echo -e "not working? Open an issue on the GitHub repo! 🛠️\n"
    
    echo "Developed by Ruan Rodrigues 👨‍💻"
    echo "email: ruan.rodrigues.silvaa@gmail.com"
    echo "GitHub: Ruanrodrigues20 🌐"
    echo "LinkedIn: https://www.linkedin.com/in/ruan-rodrigues-317a40292/ 🔗"
    echo ""

    echo -e "\e[1;33mThe setup will start automatically in 10 seconds... ⏳"
    echo -e "Or press any key to start immediately. 💡\e[0m"

    for i in {10..1}; do
        echo -ne "\rStarting in $i... Press any key to skip. ⏰"
        read -t 1 -n 1 -s key && break
    done
    echo -e "\rStarting now... 🚀                           \n"
}



# Exibe o resumo das ações executadas
show_summary() {
    echo -e "\e[1;34m===== 📋 Post-Installation Summary =====\e[0m"
    echo -e "\e[1;32m✔\e[0m Internet connection verified"
    echo -e "\e[1;32m✔\e[0m System updated"
    echo -e "\e[1;32m✔\e[0m Dependencies installed"
    echo -e "\e[1;32m✔\e[0m DEB packages installed"
    echo -e "\e[1;32m✔\e[0m GNOME tools installed"
    echo -e "\e[1;32m✔\e[0m Firefox (DEB) installed"
    echo -e "\e[1;32m✔\e[0m Flatpak applications installed"
    echo -e "\e[1;32m✔\e[0m Snap packages installed"
    echo -e "\e[1;32m✔\e[0m Extra downloads completed"
    echo -e "\e[1;32m✔\e[0m Wallpapers applied"
    echo -e "\e[1;32m✔\e[0m GTK theme configured"
    echo -e "\e[1;32m✔\e[0m Useful aliases added"
    echo -e "\e[1;32m✔\e[0m Git configured"
    echo -e "\e[1;32m✔\e[0m TLP configured for power saving"
    echo -e "\e[1;32m✔\e[0m User directories set up"
    echo -e "\e[1;34m🎉 All tasks completed successfully!\e[0m\n"
}

show_logo(){
    clear
    echo ""

    echo "██████╗  ██████╗ ███████╗████████╗
██╔══██╗██╔═══██╗██╔════╝╚══██╔══╝
██████╔╝██║   ██║███████╗   ██║   
██╔═══╝ ██║   ██║╚════██║   ██║   
██║     ╚██████╔╝███████║   ██║   
╚═╝      ╚═════╝ ╚══════╝   ╚═╝   
"

    echo "██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     
██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     
██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     
██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     
██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗
╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝
"

    echo ""
}

# Função principal que executa todas as etapas
main() { 
    sources
    
    show_logo

    show_intro_message

    ### 🛠️ System Preparation
    check_internet_connection

    ### 📦 System Updates
    update

    ### 🧰 Install Dependencies
    install_dependencies

    check_for_updates



    ### 💾 Software Installation
    install_debs
    install_gnome_tools
    install_firefox_deb
    flatpak_install
    snaps_install
    downloads

    ### ⚙️ Configurations and Customizations
    wallpapers
    gtk_theme
    setup_aliases_and_tools
    git_config
    setup_tlp
    setup_directories

    echo -e "\e[1;34m===== ✅ Post-installation completed! =====\e[0m"


    show_summary
    ask_to_restart
}


main