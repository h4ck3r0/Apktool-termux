banner ( ) {
                  random
                  figlet -F mono12 -F border APKTOOL-TERMUX
                  printf "\e[1;96m created by \e[1;33m Raj Aryan\e[0m"
                  }
                  
                  wr  ( )  {
                               printf "\033[1;91m Invalid input!!!\n"
                               selection
                               }
                               Apktool() {
                                                 cd files
                                                 bash apktool.sh
                                                 }
                                                 Java() {
                                                               cd files
                                                               bash java.sh
                                                               }
                                                               
                                 selection () {
                                            cd ~/apktool-termux
                                            echo -e -n "\e[1;96m Apktool \e[1;96m Termux \e[0m"
                                            read a
                                            case $a in
                                            1) Apktool ;;
                                            2) Java ;;
                                            3) Exit ;;
                                            *) wr ;;
                                            esac
                                            }
                                 
                  menu () {
                                  banner
                                  printf "\n\033[1;91m[\033[0m1\033[1;91m]\033[1;92m Apktool \n"
                                  printf "\033[1;91m[\033[0m2\033[1;91m]\033[1;92m Java \n"
                                  printf "\033[1;91m[\033[0m4\033[1;91m]\033[1;92m Exit\n\n\n"
                                  selection
                                  }
            

