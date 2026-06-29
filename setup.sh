#!/usr/bin/env bash

clear

RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

echo -e "${RED} ███████ ▓█████▄▄▄█████▓ █    ██  ██▓███  " 
echo -e "${RED}▒██    ▒ ▓█   ▀▓  ██▒ ▓▒ ██  ▓██▒▓██░  ██▒" 
echo -e "${RED}░ ▓██▄   ▒███  ▒ ▓██░ ▒░▓██  ▒██░▓██░ ██▓▒" 
echo -e "${RED}  ▒   ██▒▒▓█  ▄░ ▓██▓ ░ ▓▓█  ░██░▒██▄█▓▒ ▒" 
echo -e "${RED}▒██████▒▒░▒████▒ ▒██▒ ░ ▒▒█████▓ ▒██▒ ░  ░" 
echo -e "${RED}▒ ▒▓▒ ▒ ░░░ ▒░ ░ ▒ ░░   ░▒▓▒ ▒ ▒ ▒▓▒░ ░  ░" 
echo -e "${RED}░ ░▒  ░ ░ ░ ░  ░   ░    ░░▒░ ░ ░ ░▒ ░     " 
echo -e "${RED}░  ░  ░     ░    ░       ░░░ ░ ░ ░░       " 
echo -e "${RED}     ░     ░  ░           ░           ${ENDCOLOR}   " 
                                          
echo  ""                                          
echo -e "\e[1;34m[*] \e[32mInstalling Packages....\e[0m"
                                          
# Update and install required dependencies natively
pkg update -y
pkg install openjdk-17 toilet lolcat aapt wget curl -y

# Get current script directory dynamically
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Fix executable permissions for script files
chmod +x "$SCRIPT_DIR/setup.sh"
chmod +x "$SCRIPT_DIR/apktool.sh"
chmod +x "$SCRIPT_DIR/files/java.sh"

cd "$SCRIPT_DIR/files" || exit 1

echo -e "\e[1;34m[√] \e[96mNow run bash apktool.sh \e[0m"

echo -e "\n\e[1;34m[*] \e[32mFor guides and usage info, visit:\e[0m \e[4;96mhttps://www.h4ck3r.me/how-to-install-apktool-in-termux/\e[0m\n"

read -p "Would you like to open the installation guide in your browser? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    termux-open-url "https://www.google.com/search?q=How%20to%20install%20apktool%20in%20termux%20site%3Ah4ck3r.me"
fi

