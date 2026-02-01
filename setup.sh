#!/bin/bash
VERSION="1.1.0"

# 1. سیستەمی ئەپدیت
RAW_URL="https://raw.githubusercontent.com/Angel-Eyesdev/termux-login/main/setup.sh"
REMOTE_VERSION=$(curl -s $RAW_URL | grep 'VERSION=' | head -1 | cut -d'"' -f2)

if [[ "$REMOTE_VERSION" != "$VERSION" && ! -z "$REMOTE_VERSION" ]]; then
    echo -e "\e[1;33m[!] وەشانێکی نوێ بەردەستە: $REMOTE_VERSION\e[0m"
    curl -L $RAW_URL -o setup.sh && chmod +x setup.sh && ./setup.sh
    exit
fi

# 2. سڕینەوەی NetHunter و زیادەکان
echo -e "\e[1;34m[*] خەریکی پاککردنەوەی پاشماوەی نێت‌هەنتەرم...\e[0m"
rm -rf ~/nethunter-fs ~/nethunter-personal install-nethunter-termux 2>/dev/null
pkg clean && pkg autoremove -y

# 3. دروستکردنی لۆگین بۆ ناو .bashrc
cat << "EOF" > ~/.bashrc
clear
figlet -f slant "PASHA"
echo -e "\e[1;31m--------------------------------------\e[0m"
# لێرە پاسۆرد دابنێ
PASS="1234"
read -sp "[?] پاسۆرد بنووسە: " user_pass
echo ""

if [ "$user_pass" != "$PASS" ]; then
    echo -e "\e[1;31m[!] پاسۆرد هەڵەیە! تێرموکس دادەخرێت.\e[0m"
    exit
fi

clear
figlet -f slant "WELCOME"
alias get='yt-dlp -o "~/storage/downloads/%(title)s.%(ext)s"'
alias kurd='trans -t ckb'
alias clean='rm -rf ~/.bash_history && clear'
EOF

echo -e "\e[1;32m[+] سکرێپتەکە ئەپدیت کرا و نێت‌هەنتەر سڕایەوە!\e[0m"

