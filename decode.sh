#!/bin/bash
readarray -d $'\n' -t files <<< "$(find $(pwd)/testing  -type f -not -path '*/\.*' | sort )" 
echo "Files to dencode " + ${#files[*]}
for ((n=0; n <   ${#files[*]}   ;n++))
do
echo Decoding  "${files[n]}"...
dd bs=2 skip=1 if="${files[n]}" of="${files[n]%_*}" && rm "${files[n]}"
done
