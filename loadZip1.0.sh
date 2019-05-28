#!/bin/bash/

 # ROM=$1
 # GAPS=$2
 # SUROOT=$3


 MENU() {

         echo
         echo
         echo "-- adb PUSH PULL --"
         echo "1. Load ROM"
         echo "2. Load SuperSU"
         echo "3. Install Drozer"
         echo "4. Install Gapps"
         echo "q. ESCI"


 }

 MENU_EXE() {

         i=-1
         while [ "$i" != "q" ]; do
                 MENU
                 read -p "--> " i
                 i=`echo $i | tr '[A-Z]' '[a-z]'`
                 case "$i" in
                         "1")
                         ROM
                         ;;
                         "2")
                         SUPERSU
                         ;;
                         "3")
                         DROZ
                         ;;
                         "4")
                         GAPPS
                         ;;
                         "q")
                         echo "GoodBye"
                         exit 0
                         ;;
                         *)
                         echo "no, retry"
                         ;;
                 esac
         done

 }


ROM () {


echo "Inserire ROM.zip\n"
read -p "--> " ROM
echo "\n######################\n"
echo "#####Check Upload#####\n\n"
echo "ROM	--> ${ROM}"
adb push ${ROM} /sdcard
echo "\n######################\n"


}


SUPERSU () {


echo "Inserire SuperSu.zip\n"
read -p "--> " SUROOT
echo "\n######################\n"
echo "#####Check Upload#####\n\n"
echo "SuperSU	--> ${SUROOT}"
adb push ${SUROOT} /sdcard
echo "\n######################\n"


}


DROZ () {
  if [ -d /tmp/DrozerTmp ]
  then
    rm -r /tmp/DrozerTmp
  else

    mkdir /tmp/DrozerTmp                         && \
    cd /tmp/DrozerTmp                            && \
    wget https://github.com/mwrlabs/drozer/releases/download/2.3.4/drozer-agent-2.3.4.apk -O drozer.apk && \
    adb install drozer.apk                       && \
    cd ..                                        && \
    rm -r DrozerTmp
  fi

}


GAPPS () {


echo "Load GAPPS.zip\n"
read -p "--> " GAPS
echo "\n######################\n"
echo "#####Check Upload#####\n\n"
echo "Gapps	--> ${GAPS}"
adb push ${GAPS} /sdcard
echo "\n######################\n"


}


BANNER () {
		cat<<"LIM"
     _    ____  ____    ____  _   _ ____  _   _   ____  _   _ _     _
    / \  |  _ \| __ )  |  _ \| | | / ___|| | | | |  _ \| | | | |   | |
   / _ \ | | | |  _ \  | |_) | | | \___ \| |_| | | |_) | | | | |   | |
  / ___ \| |_| | |_) | |  __/| |_| |___) |  _  | |  __/| |_| | |___| |___
 /_/   \_\____/|____/  |_|    \___/|____/|_| |_| |_|    \___/|_____|_____|

LIM
}


BANNER
USAGE
MENU_EXE
