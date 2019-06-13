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
         echo "5. Install Burp Cert "
         echo "6. Start Frida-Server"
         echo "q. ESCI"


 }

 FRIDA () {


		adb root # might be required
		adb push frida-server /data/local/tmp/ 
		adb shell "chmod 755 /data/local/tmp/frida-server"
		adb shell "/data/local/tmp/frida-server &"


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
                         "5")
                         LOADCACERT
                         ;;
                         "6")
                         FRIDA
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


LOADCACERT(){

  echo "Insert .cer file"
  read CERT

  openssl x509 -inform DER -in ${CERT} -out cacert.pem             &&
  CODECER=$(openssl x509 -inform PEM -subject_hash_old -in cacert.pem |head -1)  &&
  echo  " --> ${CODECER}"
  mv cacert.pem ${CODECER}.0

  CERTX=${CODECER}.0
  echo ${CERTX}

  echo "Reboot root device"
  echo "##################"


  adb root
  adb remount
  adb push ${CERTX}   /sdcard/

  adb shell "mv /sdcard/${CERTX} /system/etc/security/cacerts/"
  adb shell "chmod 644 /system/etc/security/cacerts/${CERTX}"
  echo "\n\n ### DONE ###"
  echo "##################"


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
