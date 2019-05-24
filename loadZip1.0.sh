#!/bin/bash/

 ROM=$1
 GAPS=$2
 SUROOT=$3


USAGE () {
	echo "\n\nUSAGE : -->loadZip.sh ROM.zip Gapps.ZIP SUROOT.zip \n
	-->FORZA ROMA"
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

BANNER
USAGE
CHECK
ADBUPLOAD

