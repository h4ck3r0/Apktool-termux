#!/bin/bash

RED='\033[1;91m'
GREEN='\033[1;92m'
YELLOW='\033[1;93m'
BLUE='\033[1;34m'
CYAN='\033[1;96m'
RESET='\033[0m'

INSTALL_DIR="$PREFIX/bin"
WORK_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/files"


banner() {
    clear
    if command -v toilet >/dev/null; then
        toilet -F border -f mono12 "Apktool" | lolcat
    else
        echo -e "${CYAN}   APKTOOL INSTALLER   ${RESET}"
    fi
    printf "\n"
    printf "${BLUE}[*] ${CYAN}Tool created by ${YELLOW}Raj Aryan (@h4ck3r0_official)${RESET}\n"
    printf "${BLUE}[*] ${CYAN}Version Manager: ${GREEN}Auto-Latest${RESET}\n"
    echo "--------------------------------------------------"
}

check_dependencies() {
    echo -e "${BLUE}[*] Checking dependencies...${RESET}"
    
    # Map command names to packages
    declare -A pkg_map
    pkg_map[wget]="wget"
    pkg_map[curl]="curl"
    pkg_map[java]="openjdk-17"
    pkg_map[toilet]="toilet"
    pkg_map[lolcat]="lolcat"
    pkg_map[aapt]="aapt"

    deps=("wget" "curl" "java" "toilet" "lolcat" "aapt")
    for dep in "${deps[@]}"; do
        if ! command -v "$dep" >/dev/null; then
            pkg_name="${pkg_map[$dep]}"
            echo -e "${YELLOW}[!] Installing missing dependency: $pkg_name...${RESET}"
            pkg install "$pkg_name" -y > /dev/null 2>&1
        fi
    done
    echo -e "${GREEN}[+] Dependencies are ready.${RESET}"
}

pause_prompt() {
    read -n 1 -s -r -p "Press any key to continue..."
    menu
}


install_apktool() {
    mkdir -p "$WORK_DIR"
    
    echo -e "\n${BLUE}[*] Connecting to GitHub API...${RESET}"
    
    LATEST_TAG=$(curl -s https://api.github.com/repos/iBotPeaches/Apktool/releases/latest | grep "tag_name" | cut -d '"' -f 4)
    
    VERSION_NUM=${LATEST_TAG#v}

    if [ -z "$VERSION_NUM" ]; then
        echo -e "${RED}[!] Error: Could not fetch latest version. Check your internet connection.${RESET}"
        pause_prompt
        return
    fi

    echo -e "${GREEN}[+] Latest version found: ${YELLOW}$VERSION_NUM${RESET}"

    echo -e "${BLUE}[*] Downloading Apktool JAR...${RESET}"
    wget -q --show-progress "https://github.com/iBotPeaches/Apktool/releases/download/${LATEST_TAG}/apktool_${VERSION_NUM}.jar" -O "$INSTALL_DIR/apktool.jar"

    if [ $? -ne 0 ]; then
        echo -e "${RED}[!] Download failed!${RESET}"
        pause_prompt
        return
    fi

    chmod +r "$INSTALL_DIR/apktool.jar"

    echo -e "${BLUE}[*] Downloading Wrapper Script...${RESET}"
    wget -q "https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool" -O "$INSTALL_DIR/apktool"
    chmod +x "$INSTALL_DIR/apktool"

    # Patch shebang for Termux environments
    if [ -f "$INSTALL_DIR/apktool" ]; then
        echo -e "${BLUE}[*] Patching shebang for Termux...${RESET}"
        sed -i "1s|^#!/bin/bash|#!$PREFIX/bin/bash|" "$INSTALL_DIR/apktool"
    fi

    echo -e "${GREEN}[+] Installation Complete!${RESET}"
    
    echo -e "${BLUE}[*] Verifying installation...${RESET}"
    apktool -version
    
    echo
    read -p "Would you like to open the website (h4ck3r.me) in your browser? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        termux-open-url https://h4ck3r.me/
    fi
    pause_prompt
}

install_java() {
    echo -e "\n${BLUE}[*] Installing OpenJDK 17 (recommended)...${RESET}"
    pkg install openjdk-17 -y
    
    echo -e "${GREEN}[+] Java setup attempt finished.${RESET}"
    pause_prompt
}


menu() {
    banner
    echo -e "${RED}[${RESET}1${RED}]${GREEN} Install Latest Apktool (Auto-Update)"
    echo -e "${RED}[${RESET}2${RED}]${GREEN} Fix/Install Java"
    echo -e "${RED}[${RESET}3${RED}]${GREEN} Exit"
    echo ""
    echo -e -n "${CYAN}Select an option: ${RESET}"
    read -r choice

    case $choice in
        1) 
            check_dependencies
            install_apktool 
            ;;
        2) 
            install_java 
            ;;
        3) 
            echo -e "${YELLOW}Exiting... Goodbye!${RESET}"
            exit 0 
            ;;
        *) 
            echo -e "${RED}Invalid Selection!${RESET}"
            sleep 1
            menu 
            ;;
    esac
}

menu
