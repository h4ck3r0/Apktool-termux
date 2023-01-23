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
echo -e "\e[1;34m[*] \e[32mInstalling Packages....\e[0m";                                       
                                          
                                                                                                
apt update && apt upgrade -y
pkg install ruby python python2 -y
pkg install toilet -y
pkg install openjdk-17 -y
pip3 install gem
gem install lolcat
pkg install wget curl -y
chmod +x setup.sh
chmod +x apktool.sh
cd ~/Apktool-termux/files
chmod +x java.sh

echo -e "\e[1;34m[√] \e[96mNow run bash apktool.sh \e[0m"

termux-open-url https://h4ck3r.me/how-to-install-apktool-in-termux-without-error/
