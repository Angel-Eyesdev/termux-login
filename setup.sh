#!/bin/bash

VERSION="1.0.0"

# پشکنینی ئەپدیت لە گیتهەبەوە
RAW_URL="https://raw.githubusercontent.com/Angel-Eyesdev/termux-login/main/setup.sh"
REMOTE_VERSION=$(curl -s $RAW_URL | grep 'VERSION=' | head -1 | cut -d'"' -f2)

if [[ "$REMOTE_VERSION" != "$VERSION" && ! -z "$REMOTE_VERSION" ]]; then
    echo -e "\e[1;33m[!] وەشانێکی نوێ بەردەستە: $REMOTE_VERSION\e[0m"
    echo -e "\e[1;32m[*] خەریکی نوێکردنەوەم...\e[0m"
    curl -L $RAW_URL -o setup.sh
    chmod +x setup.sh
    ./setup.sh
    exit
fi


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

# 4. Create Aliases and Layout
cat << "EOF" > ~/.bashrc
clear
figlet -f slant "PASHA"
alias get='yt-dlp -o "~/storage/downloads/%(title)s.%(ext)s"'
alias kurd='trans -t ckb'

# لێرە کۆدی لۆگینەکە زیاد بکە ئەگەر پێت خۆشە
EOF

# 5. دابەزاندنی فۆڵدەرەکە ئەگەر نەبوو
if [ ! -d "~/termux-login" ]; then
    git clone https://github.com/Angel-Eyesdev/termux-login.git ~/termux-login
fi

echo -e "\e[1;32m[+] هەموو شتێک جێگیر کرا و فۆڵدەرەکە ئامادەیە!\e[0m"

