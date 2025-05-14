#!/bin/bash

source scripts/core.sh

setup_tlp(){
    echo -e "\e[1;34m===== 🔋 Configuring TLP for Power Saving =====\e[0m"
    echo ""
    # Checking whether the system is a notebook with battery (BAT0 or BAT1)
    if [ -d "/sys/class/power_supply/BAT0" ] || [ -d "/sys/class/power_supply/BAT1" ]; then
        remove_trava
        sudo apt install -y tlp tlp-rdw
        sudo systemctl enable tlp
        sudo systemctl start tlp
        sudo tlp-stat -s
    fi
}
