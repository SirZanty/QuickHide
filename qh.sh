#!/bin/bash

cli_log() {
  script_name=${0##*/}
  timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
  echo "== $script_name $timestamp $1"
}

path=""
encode=""
decode=0


case $1 in
    -h)
    if [[ $# = 1 ]]
    then 
        echo "QuickHide version: QuickHide/1.0"
        echo "Usage: QuickHide [-h] [-e bytes] [-d byte_number] [-p path]"
        echo "Options:"
        printf "\t-h             : this help\n"
        printf "\t-e bytes       : bytes string to add to the head file\n"
        printf "\t-d byte_number : bytes number to remove from the head file\n"
        printf "\t-p path        : path of directory to hide\n"  
        printf "\n\tExample:\n"
        printf "\tqh.sh -h                     - this help\n"
        printf "\tqh.sh -p /tmp -e bytes       - hide all files of tmp path adding bytes to head\n" 
        printf "\tqh.sh -p /tmp -d 2           - show all files of tmp path removing the first two bytes\n"
        exit
    else
        echo "Error with args!"
        exit
    fi
    ;;
    -p)
    if [[ $# = 4 ]]
    then
        path=$2
        case $3 in
            -e)
            encode=$4
            ;;
            -d)
            decode=$4
            ;;
        esac
    else
        echo "Error with args!"
        exit
    fi
    ;;
esac

if [[ encode -eq '' ]]
then
    echo "Decoding..."
    readarray -d $'\n' -t files <<< "$(find $2  -type f -not -path '*/\.*')" 
    echo "Files to dencode " ${#files[*]}
    for ((n=0; n <   ${#files[*]}   ;n++))
    do
    echo Decoding  "${files[n]}"...
    dd bs=$4 skip=1 if="${files[n]}" of="${files[n]%_*}" && rm "${files[n]}"
    done
else
    echo "Encoding..." 
    readarray -d $'\n' -t files <<< "$(find $2  -type f -not -path '*/\.*')" 
    echo "Files to encode "  ${#files[*]}
    for ((n=0; n <   ${#files[*]}   ;n++))
    do
    echo Encoding  "${files[n]}"...
    printf $4 | cat - "${files[n]}"  > "${files[n]}"_ && rm "${files[n]}" 
    done
fi