#!/bin/bash
set -e

IFS=$'\n' list=($(ls programs/*.c))
i=0

echo "Programs: "
for file in "${list[@]}"; do
    if [[ -f "${file}" ]]; then
        ((i++))
        printf "\t${i}. ${file}\n"
    fi
done

read -p "Enter the program number to run: " prog

if (( prog > i || prog < 0 )); then
    echo "Invalid program number"
    exit 1
fi

run=${list[$((prog-1))]}
cmd="gcc $run -o ${run//.c/} && ./${run//.c/} && read -p \"Press enter to close...\" "
x-terminal-emulator -e bash -c $cmd