#!/bin/bash
pkg install figlet -y
cat << "EOT" > ~/.bashrc
clear
echo -e "\e[1;32m"
figlet -f slant "PASHA"
echo -e "\e[0m"
echo -e "\e[1;36m[ Date: $(date +%Y-%m-%d) | Time: $(date +%H:%M:%S) ]\e[0m"
echo -e "\e[1;34m---------------------------------------\e[0m"
while true; do
    echo -ne "\e[1;33m[?] Enter Access Key: \e[0m"
    read -sp "" pass
    echo
    if [ "$pass" = "1234" ]; then
        echo -e "\e[1;32m[+] Access Granted! Welcome back.\e[0m"
        echo -e "\e[1;34m---------------------------------------\e[0m"
        break
    else
        echo -e "\e[1;31m[!] Access Denied. Try Again.\e[0m"
    fi
done
EOT
echo -e "\e[1;32m[+] Setup Complete! Please restart Termux.\e[0m"

