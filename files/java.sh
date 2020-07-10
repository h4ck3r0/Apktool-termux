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
