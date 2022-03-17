#!/bin/bash
readarray -d $'\n' -t files <<< "$(find $(pwd)/RecuperacionDiscoPequenita  -type f -not -path '*/\.*' | sort )" 
echo "Files to encode " + ${#files[*]}
for ((n=0; n <   ${#files[*]}   ;n++))
do
echo Encoding  "${files[n]}"...
printf "\x68\x65" | cat - "${files[n]}"  > "${files[n]}"_ && rm "${files[n]}" 
done
