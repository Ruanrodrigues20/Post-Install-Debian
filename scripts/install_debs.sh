#!/bin/bash

source scripts/core.sh


install_dependencies(){
	echo ""
	echo -e "\e[1;34m===== 🔥 Installing Dependencies =====\e[0m"
    dependencies=("git" "curl" "wget" "snap" "flatpak")
    install "${dependencies[@]}"
}

install_debs(){
	echo ""
	echo -e "\e[1;34m===== 🔥 Installing Debian Packages =====\e[0m"
    debs=("maven" "python3-pip" "python3-venv" "python3-poetry" "openjdk-21-jdk")
    install "${debs[@]}"
}


install_gnome_tools(){
	echo ""
	echo -e "\e[1;34m===== 🔥 Installing GNOME Tools =====\e[0m"
    gnome_tools=("gnome-builder" "gnome-tweaks" "gnome-software-plugin-flatpak" "gnome-software-plugin-deb" "gnome-software-plugin-snap" "gnome-shell-extension-manager" "gnome-shell-extension-appindicator" "gnome-shell-extension-dashtodock" "gnome-shell-extension-blur-my-shell" "gnome-shell-extension-caffeine" "gnome-shell-extension-user-theme")
    install "${gnome_tools[@]}" 
}
