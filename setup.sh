#!/bin/bash
# 1. Update and Install basics
pkg update && pkg upgrade -y
pkg install git python ffmpeg translate-shell figlet -y
pip install yt-dlp

# 2. Setup Storage
termux-setup-storage

# 3. Create bin folder and downloader
mkdir -p ~/bin
cat << "EOF" > ~/bin/termux-url-opener
#!/bin/bash
url=$1
yt-dlp -o "~/storage/downloads/%(title)s.%(ext)s" "$url"
EOF
chmod +x ~/bin/termux-url-opener

# 4. Create Aliases, Layout and Password System
cat << "EOF" > ~/.bashrc
clear
figlet -f slant "PASHA"
echo -e "\e[1;36m======================================\e[0m"
echo -e "\e[1;33m       WELCOME TO PASHA TERMINAL      \e[0m"
echo -e "\e[1;36m======================================\e[0m"

# --- LOGIN SYSTEM ---
PASSWORD="karma1234" # لێرە پاسۆردەکەت بگۆڕە
read -sp "[?] Enter Password to Access: " input_pass
echo -e "\n"

if [ "$input_pass" != "$PASSWORD" ]; then
    echo -e "\e[1;31m[!] Access Denied! Wrong Password.\e[0m"
    sleep 2
    exit
fi

clear
figlet -f slant "PASHA"
echo -e "\e[1;32m[+] Access Granted. Welcome back!\e[0m"

# Aliases
alias get='yt-dlp -o "~/storage/downloads/%(title)s.%(ext)s"'
alias kurd='trans -t ckb'
alias clean='rm -rf ~/.bash_history && clear && figlet -f slant "PASHA"'
EOF

# 5. Clone repository if it doesn't exist
if [ ! -d "$HOME/termux-login" ]; then
    git clone https://github.com/Angel-Eyesdev/termux-login.git "$HOME/termux-login"
fi

echo -e "\e[1;32m[+] Setup completed successfully!\e[0m"
echo -e "\e[1;32m[+] Restart Termux to see the changes.\e[0m"
-
