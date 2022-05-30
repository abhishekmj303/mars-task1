#!/bin/bash

printf "Password 1: "
date +%s | sha256sum | base64 | head -c 16 ; echo

printf "Password 2: "
< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-16};echo;

printf "Password 3: "
openssl rand -base64 16

printf "Password 4: "
date | md5sum

printf "Password 5: "
strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 16 | tr -d '\n'; echo

printf "Password 6: "
gpg --gen-random --armor  1 16

printf "Password 7: "
dd if=/dev/urandom bs=1 count=16 2>/dev/null | base64 -w 0 | rev | cut -b 2- | rev

printf "Password 8: "
cat /dev/urandom | tr -cd [:graph:]|head -c 16; echo

printf "Password 9: "
tr -cd '[:alnum:]' < /dev/urandom | fold -w16 | head -n1

printf "Password 10: "
shuf -er -n16  {A..Z} {a..z} {0..9} | tr -d '\n'; echo

printf "Password 11: "
apg -a1 -m14 | head -1

printf "Password 12: "
ping -c 1 google.com | md5sum | head -c 16 ; echo