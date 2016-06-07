#!/bin/bash

# specify the path here
PATH="/home/nkantor/pcaps/"

WGET=/usr/bin/wget 
ECHO=/bin/echo
SHA1=/usr/bin/sha1sum
AWK=/usr/bin/awk

for filename in *; do
	$CURL $filename $PATH
done

while IFS='' read -r line || [[ -n "$line" ]]; do
    # echo "Text read from file: $line"
    SHA_LINE = `$ECHO -n $line | $SHA1 | $AWK '{print $1}'` 
    $WGET -O ${PATH}${SHA_LINE}.pcap $line
done < "$1"