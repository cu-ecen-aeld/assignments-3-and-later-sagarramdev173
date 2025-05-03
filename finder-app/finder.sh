#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments are required."
    exit 1
fi

filedir=$1
searchstr=$2

if [ ! -d "$filedir" ]; then
    echo "Error: $filedir is not a directory."
    exit 1
fi

if [ -z "$searchstr" ]; then
    echo "Error: Search string is empty."
    exit 1
fi

num_files=$(find "$filedir" -type f | wc -l)
num_matching_lines=$(grep -r "$searchstr" "$filedir" | wc -l)
echo "The number of files are $num_files and the number of matching lines are $num_matching_lines"
