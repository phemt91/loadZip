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
           echo -en "> "

 }

 MENU_EXE() {

         i=-1
         while [ "$i" != "q" ]; do
                 MENU
                 read i
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
read ROM
echo "\n######################\n"
echo "#####Check Upload#####\n\n"
echo "ROM	--> ${ROM}"
adb push ${ROM} /sdcard
echo "\n######################\n"


}


SUPERSU () {


echo "Inserire SuperSu.zip\n"
read SUROOT
echo "\n######################\n"
echo "#####Check Upload#####\n\n"
echo "SuperSU	--> ${SUROOT}"
adb push ${SUROOT} /sdcard
echo "\n######################\n"


}


DROZ () {
  rm -r /tmp/DrozerTmp                         && \
  mkdir /tmp/DrozerTmp                         && \
  cd /tmp/DrozerTmp                            && \
  wget https://github.com/mwrlabs/drozer/releases/download/2.3.4/drozer-agent-2.3.4.apk -O drozer.apk && \
  adb install drozer.apk                       && \
  cd ..                                        && \
  rm -r DrozerTmp


}


GAPPS () {


echo "Inserire GAPPS.zip\n"
read GAPS
echo "\n######################\n"
echo "#####Check Upload#####\n\n"
echo "Gapps	--> ${GAPS}"
adb push ${GAPS} /sdcard
echo "\n######################\n"


}



USAGE () {
	echo "\n\nUSAGE : -->loadZip.sh ROM.zip Gapps.ZIP SUROOT.zip \n
	-->FORZA ROMA - Pallotta Vattene"
}

CHECK () {
	echo "\n######################\n"
	echo "#####Check Upload#####\n\n"
	echo "ROM	--> ${ROM}"
	echo "Gapps	--> ${GAPS}"
	echo "SuperSU	--> ${SUROOT}"
}


ADBUPLOAD () {


	echo ${ROM}
	adb push ${ROM} /sdcard &&
	adb push ${GAPS} /sdcard &&
	adb push ${SUROOT} /sdcard &&
	echo "DONE"
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

# if [ "$#" -ne 3 ]
#  then
#      echo "Non sono stati inseriti i file necessari "
#      USAGE
#
#
#  else
#   BANNER
#   USAGE
#   CHECK
#   ADBUPLOAD
#
#   while true; do
#     read -p "Installare Drozer?" yn
#     case $yn in
#         [Yy]* ) echo "Install in progress" ;DROZ;;
#         [Nn]* ) exit;;
#         * ) echo "Rispondere yes or no.";;
#     esac
#   done
#
# fi
