#!/bin/bash

# specify the path here
PATH="/home/nkantor/pcaps/"

# commands
WGET=/usr/bin/wget 
ECHO=/bin/echo
SHA1=/usr/bin/sha1sum
AWK=/usr/bin/awk

# loop through every url
while IFS='' read -r line || [[ -n "$line" ]]; do
    # create a SHA1 hash of the url
    F=`$ECHO -n $line | $SHA1 | $AWK '{print $1}'`

    # check if the file exists. If it does then do nothing, otherwise download it with wget and save it.
    if [ -f ${PATH}${F}.pcap ]
    then
    	echo "${PATH}${F}.pcap already downloaded"
    else
    	$WGET -O ${PATH}${F}.pcap $line
    fi
done < "$1"