clear
figlet -f slant "PASHA"
echo -e "\e[1;36m======================================\e[0m"
echo -e "\e[1;33m       WELCOME TO PASHA TERMINAL      \e[0m"
echo -e "\e[1;36m======================================\e[0m"

# --- LOGIN SYSTEM ---
PASSWORD="123" # لێرە پاسۆردەکەت بگۆڕە
read -sp "[?] Enter Password: " input_pass
echo -e "\n"

if [ "$input_pass" != "$PASSWORD" ]; then
    echo -e "\e[1;31m[!] Access Denied!\e[0m"
    exit
fi

clear
figlet -f slant "PASHA"
# Aliases
alias get='yt-dlp -o "~/storage/downloads/%(title)s.%(ext)s"'
alias kurd='trans -t ckb'
alias clean='rm -rf ~/.bash_history && clear && figlet -f slant "PASHA"'

