#!/bin/bash/

 ROM=$1
 GAPS=$2
 SUROOT=$3


DROZ () {
  rm -r /tmp/DrozerTmp                         && \
  mkdir /tmp/DrozerTmp                         && \
  cd /tmp/DrozerTmp                            && \
  wget https://github.com/mwrlabs/drozer/releases/download/2.3.4/drozer-agent-2.3.4.apk -O drozer.apk && \
  adb install drozer.apk                       && \
  cd ..                                        && \
  rm -r DrozerTmp


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
 ____  _                    _    ___  _
|  _ \| |__   ___ _ __ ___ | |_ / _ \/ |
| |_) | '_ \ / _ \ '_ ` _ \| __| (_) | |
|  __/| | | |  __/ | | | | | |_ \__, | |
|_|   |_| |_|\___|_| |_| |_|\__|  /_/|_|
			        loadZip
LIM
}


if [ "$#" -ne 3 ]
 then
     echo "Non sono stati inseriti i file necessari "
     USAGE


 else
  BANNER
  USAGE
  CHECK
  ADBUPLOAD

  while true; do
    read -p "Installare Drozer?" yn
    case $yn in
        [Yy]* ) echo "Install in progress" ;DROZ;;
        [Nn]* ) exit;;
        * ) echo "Rispondere yes or no.";;
    esac
  done

fi
