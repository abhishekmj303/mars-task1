#!/bin/bash
set -e

IFS=$'\n' list=($(ls *.py))
i=0

for file in ${list[@]}; do
    if [[ -f $file ]]; then
        mv $file ${file//.py/.c}
        echo "Renamed $file to ${file//.py/.c}"
        (( i++ ))
    fi
done

if (( i == 0 )); then
    echo "No programs found"
    exit 1
fi