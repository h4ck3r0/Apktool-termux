
banner ( ) { 
                  
                  toilet -F border -f mono12  "Apktool"  | lolcat
                  printf ""
                  printf "\e[1;34m[*] \e[1;96mcreated by \e[1;33m Raj Aryan ( @h4ck3r_0 )\e[0m"
                  }
                  
                  wr  ( )  {
                               printf "\033[1;91m Invalid input!!!\n"
                               selection
                               }
                               Apktool() {
                                                 cd files
                                                 export apktool_version=2.7.0

sh -c 'wget https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_$apktool_version.jar -O $PREFIX/bin/apktool.jar'

chmod +r $PREFIX/bin/apktool.jar

sh -c 'wget https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool -O $PREFIX/bin/apktool' && chmod +x $PREFIX/bin/apktool
                                                 
                                                 cd ~/Apktool-termux ; bash apktool.sh
                                                 
                                                 }
                                                 Java() {
                                                               cd files
                                                               bash java.sh
                                                               cd ~/Apktool-termux ; bash apktool.sh
                                                               }
                                                               
                                 selection () {
                                            cd ~/Apktool-termux
                                            echo -e -n "\e[1;96m Apktool\e[1;96m Termux : \e[0m"
                                            read a
                                            case $a in
                                            1) Apktool ;;
                                            2) Java ;;
                                            3) exit ;;
                                            *) wr ;;
                                            esac
                                            }
                                 
                  menu () {
                                  banner
                                  printf "\n\033[1;91m[\033[0m1\033[1;91m]\033[1;92m Apktool \n"
                                  printf "\033[1;91m[\033[0m2\033[1;91m]\033[1;92m Java ( If Apktool Don't Work )\n"
                                  printf "\033[1;91m[\033[0m3\033[1;91m]\033[1;92m Exit\n\n\n"
                                  selection
                                  }
                  menu
