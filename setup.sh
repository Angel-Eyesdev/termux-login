#!/bin/bash
# Install required tools
pkg update && pkg upgrade -y
pkg install figlet git python neofetch -y

# Setup the main startup file (.bashrc)
cat << 'EOF' > ~/.bashrc
clear
# پیشاندانی لۆگۆ بە ڕەنگی زەرد و شین
echo -e "\e[1;33m"
figlet -f slant "PASHA"
echo -e "\e[0m"

# پیشاندانی زانیاری سیستم (مۆبایل و ئەندرۆید)
neofetch --ascii_distro android

echo -e "\e[1;36m======================================\e[0m"
echo -e "\e[1;33m       WELCOME TO PASHA TERMINAL      \e[0m"
echo -e "\e[1;36m======================================\e[0m"

# --- LOGIN SYSTEM ---
PASSWORD="123"
echo -n "[?] Enter Password: "
read -s input_pass
echo ""

if [ "$input_pass" = "$PASSWORD" ]; then
    echo -e "\n\e[1;32m[+] Access Granted! Welcome.\e[0m\n"
    clear
    neofetch
    figlet -f slant "PASHA"
else
    echo -e "\n\e[1;31m[!] Wrong Password. Closing...\e[0m"
    sleep 2
    exit
fi

# کورتکراوەکان (Aliases)
alias clean='clear && neofetch && figlet -f slant "PASHA"'
alias get='yt-dlp -o "~/storage/downloads/%(title)s.%(ext)s"'
alias kurd='trans -t ckb'
EOF

echo "All beauty features added! Restart Termux."

