#!/bin/bash
pkg update && pkg upgrade -y
pkg install figlet python ffmpeg translate-shell -y
pip install yt-dlp
mkdir -p ~/bin
termux-setup-storage
cat << "EOF" > ~/.bashrc
clear
figlet -f slant "PASHA"
while true; do
    echo -ne "\e[1;33m[?] Enter Access Key: \e[0m"
    read -sp "" pass
    echo
    if [ "$pass" = "1234" ]; then
        echo -e "\e[1;32m[+] Access Granted!\e[0m"
        break
    else
        echo -e "\e[1;31m[!] Wrong Key.\e[0m"
    fi
done
alias get='yt-dlp -o "~/storage/downloads/%(title)s.%(ext)s"'
alias kurd='trans -t ckb'
EOF
cat << "EOF" > ~/bin/termux-url-opener
#!/bin/bash
url=$1
yt-dlp -o "~/storage/downloads/%(title)s.%(ext)s" "$url"
EOF
chmod +x ~/bin/termux-url-opener
echo -e "\e[1;32m[+] Done!\e[0m"
