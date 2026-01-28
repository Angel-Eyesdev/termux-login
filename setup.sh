#!/bin/bash
# نوێکردنەوەی سیستم و دابەزاندنی پێداویستییەکان
pkg update && pkg upgrade -y
pkg install figlet python ffmpeg -y
pip install yt-dlp

# دروستکردنی فۆڵدەرەکان
mkdir -p ~/bin
mkdir -p ~/.config/termux
termux-setup-storage

# دروستکردنی فایلی لۆگین و کورتەبڕەکان
cat << "EOF" > ~/.bashrc
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
        break
    else
        echo -e "\e[1;31m[!] Access Denied. Try Again.\e[0m"
    fi
done
alias get='yt-dlp -o "~/storage/downloads/%(title)s.%(ext)s"'
EOF

# دروستکردنی سکریپتی داگرتنی ڤیدیۆ (Share)
cat << "EOF" > ~/bin/termux-url-opener
#!/bin/bash
url=$1
clear
echo -e "1) Video (Best) | 2) Video (720p) | 3) Audio (MP3)"
read -p "Choice: " choice
case $choice in
    1) yt-dlp -f "bestvideo+bestaudio/best" -o "~/storage/downloads/%(title)s.%(ext)s" "$url" ;;
    2) yt-dlp -f "best[height<=720]" -o "~/storage/downloads/%(title)s.%(ext)s" "$url" ;;
    3) yt-dlp -x --audio-format mp3 -o "~/storage/downloads/%(title)s.%(ext)s" "$url" ;;
esac
EOF

chmod +x ~/bin/termux-url-opener
echo -e "\e[1;32m[+] هەموو شتێک بە سەرکەوتوویی جێگیر کرا!\e[0m"
