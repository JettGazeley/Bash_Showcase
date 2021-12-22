#!/bin/bash

function to_array {
    for ((i=0; i<${#s}; i++)); do
        arr[$i]="${s:$i:1}";
        done
}

function to_string {
    #use input field separator and set '' as the delimiter
    s=$( IFS=$''; echo "${arr[*]}" )
    echo "$s"
}

function rand {
    a=0
    b=${#s} 
    random_number=$(( a + $RANDOM % b ))
    echo "$random_number"
}


function shuffle {
    for (( i=${#s}-1; i>0; i-- )); do
        j=$(rand)
        tmp=${arr[$i]}
        arr[$i]=${arr[$j]}
        arr[$j]=$tmp
    done
}

#initalize variables
num_params=$#
s=$1
arr[0]=""

#check if there are no input arguments
if [[ "$num_params" -eq 0 ]]; then
    exit 0
fi

#check if there is input argument of length one when there's more than one argument given
if [[ "$num_params" -gt 1 || ${#s} -eq 1 ]]; then
    s=${s%% *}
    echo "$s"
    exit 0
fi


to_array        # puts the characters of s into arr
shuffle         # shuffles arr
to_string       # makes a string from the elements of arr