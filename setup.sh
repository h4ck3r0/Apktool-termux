echo -e "\e[1;34m[*] \e[32minstall packages....\e[0m";
apt update && apt upgrade
pkg install toilet
pip3 install gem
gem install lolcat
pkg install wget curl -y
chmod +x setup.sh
chmod +x apktool.sh
chmod +x /files/java.sh
echo -e "\e[1;34m[√] \e[96mNow run bash apktool.sh \e[0m"
