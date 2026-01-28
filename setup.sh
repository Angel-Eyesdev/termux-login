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

# 4. Create Login and Aliases
cat << "EOF" > ~/.bashrc
clear
figlet -f slant "PASHA"
alias get='yt-dlp -o "~/storage/downloads/%(title)s.%(ext)s"'
alias kurd='trans -t ckb'
# لێرەدا دەتوانیت کۆدی لۆگینەکەش دابنێیتەوە
EOF

# 5. بڕگەی گرنگ: ئەگەر فۆڵدەرەکە وون بوو، خۆی دایبەزێنێتەوە
if [ ! -d "~/termux-login" ]; then
    git clone https://github.com/Angel-Eyesdev/termux-login ~/termux-login
fi

echo -e "\e[1;32m[+] هەموو شتێک جێگیر کرا و فۆڵدەرەکەش پارێزراوە!\e[0m"
