#!/bin/bash
# Update system
pkg update && pkg upgrade -y
pkg install figlet git python -y

# Setup password file (.bashrc)
cat << 'EOF' > ~/.bashrc
clear
figlet -f slant "PASHA"
echo -e "\e[1;36m======================================\e[0m"
echo -e "\e[1;33m       WELCOME TO PASHA TERMINAL      \e[0m"
echo -e "\e[1;36m======================================\e[0m"

PASSWORD="123"
echo -n "[?] Enter Password: "
read -s input_pass
echo ""

if [ "$input_pass" = "$PASSWORD" ]; then
    echo -e "\n\e[1;32m[+] Access Granted! Welcome.\e[0m\n"
else
    echo -e "\n\e[1;31m[!] Wrong Password. Closing...\e[0m"
    sleep 2
    exit
fi

alias clean='rm -rf ~/.bash_history && clear && figlet -f slant "PASHA"'
alias get='yt-dlp -o "~/storage/downloads/%(title)s.%(ext)s"'
EOF

echo "Done! Restart Termux now."

