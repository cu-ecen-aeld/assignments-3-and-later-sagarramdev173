#!/bin/bash 

if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments are required."
    exit 1
fi

filedir=$1
writestr=$2


if [ ! -d "$(dirname "$filedir")" ]; then
    # echo "Error: Directory $(dirname "$filedir") does not exist."
    mkdir -p $(dirname "$filedir")
    if [ $? -eq 0 ]; then       
        echo "Created directory $(dirname "$filedir")"
    fi
fi

if [ ! -f "$filedir" ]; then
    touch "$filedir"
    if [ $? -ne 0 ]; then
        echo "Error: Could not create file $filedir"
        exit 1
    fi
fi

echo $writestr > $filedir
echo >> $filedir

if [ $? -ne 0 ]; then
    echo "Error: Could not write to $filedir"
    exit 1
fi

exit 0
