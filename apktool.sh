
echo -e "\e[1;34m[+] \e[32m installing packages \e[0m"
echo -e "\e[8m"
apt update && apt upgrade
pkg install aapt
clear
echo "*--------------------------------------+"
echo -e "\e[1;34m[*] \e[1;31m apktool 2.4.1 by H4Ck3R \e[0m"
echo -e "\e[1;96m --- : script by Raj Aryan : \e[0m"
echo -e "\e[1;93m --- : Apktool 2.4.1 : \e[0m"
echo -e "\e[1;91m --- : java-jdk-8 by hax4us : \e[0m"
echo -e "\e[1;34m[•] \e[1;92m Note Only for termux\e[96m"
echo "*--------------------------------------+"
echo -e "\e[1;34m[-] please be patient \e[96m"
wget https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.4.1.jar

mv -v apktool_2.4.1.jar /data/data/com.termux/files/usr/bin/apktool.jar

rm -rf apktool_2.4.1.jar

wget https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool

mv -v apktool /data/data/com.termux/files/usr/bin/apktool

rm -rf apktool

chmod +x /data/data/com.termux/files/usr/bin/apktool

chmod +x /data/data/com.termux/files/usr/bin/apktool.jar
echo -e "\e[96m"

#!/data/data/com.termux/files/usr/bin/sh

print_status() {
    printf "[*] ${1}...\n"
}

set_arch() {
    case "$(uname -m)" in
        aarch64|armv8l)
            ARCH=aarch64
            ;;
        armv7l|arm)
            ARCH=arm
            ;;
        *)
            printf "[!] arch not supported yet\n"
            exit 1
            ;;
    esac
}

get_tar() {
    wget -c https://github.com/Hax4us/java/releases/download/v8/jdk8_${ARCH}.tar.gz -O jdk8_$ARCH.tar.gz
    tar -xf jdk8_$ARCH.tar.gz -C $PREFIX/share 
    chmod +x $PREFIX/share/bin/*
    mv $PREFIX/share/bin/* $PREFIX/bin
}

cleanup() {
    rm -f jdk8_${ARCH}.tar.gz
    rm -rf $PREFIX/share/bin
}

print_status "getting system info"
set_arch
print_status "getting tar file and setting all things"
get_tar
print_status "cleaning up"
tar zxvf jdk8_aarch64.tar.gz
rm -rf jdk8_aarch64.tar.gz

clear
echo -e "\e[1;91m-----------------🅻🅸🅺🅴 🅰🅽🅳 🆂🆄🅱🆂🅲🆁🅸🅱🅴 🆄🆂------------------\e[0m" 

echo -e "\e[96m+--------------------------------------*\e[0m"
echo -e "\e[1;96m Raj Aryan : \e[1;95m Apktool Version2.4.1"
echo    " Type Apktool to run"
echo    " Apktool v2.4.1 - a tool for reengineering Android apk files"

echo -e  " usage: apktool \e[96m"
echo "-advance,--advanced   prints advance information."
echo " -version,--version    prints the version then exits"
echo "usage: apktool if|install-framework [options] <framework.apk>"
echo " -p,--frame-path <dir>   Stores framework files into <dir>."
echo " -t,--tag <tag>          Tag frameworks using <tag>."
echo "usage: apktool d[ecode] [options] <file_apk>"
echo " -f,--force              Force delete destination directory."
echo " -o,--output <dir>       The name of folder that gets written. Default is>"
echo " -p,--frame-path <dir>   Uses framework files located in <dir>."
echo " -r,--no-res             Do not decode resources."
echo " -s,--no-src             Do not decode sources."
echo " -t,--frame-tag <tag>    Uses framework files tagged by <tag>."
echo "usage: apktool b[uild] [options] <app_path>"
echo " -f,--force-all          Skip changes detection and build all files."
echo " -o,--output <dir>       The name of apk that gets written. Default is dis>"
echo " -p,--frame-path <dir>   Uses framework files located in <dir>."
echo "don't forget to subscribe"
echo "+--------------------------------------*"
