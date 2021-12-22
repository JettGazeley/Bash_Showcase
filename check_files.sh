#!/bin/bash

num_params=$#
file_name=$1

#check if there are no command line arguments
if [[ "$num_params" -eq 0 ]]; then
     echo "Usage: check_files.sh specfile">&2
     exit 1
fi

#check if the file exists in the current directory
if [[ ! -f "$file_name" ]]; then
     echo "$file_name is missing or could not be read">&2
     exit 2
fi

#check if the file exists in the current directory
if [[ -f "$file_name" ]]; then
     while read line; do

        #if statement to check for whitespace or commented line
        if ! [[ "$line" =~ ^[[:space:]]*$ || "$line" =~ \#.* ]]; then

          #create new variable for the current line
          corrected_line="$(echo -e "${line}" | tr -d '[[:space:]]')"

          #if statement to check if file is not in current directory - if it passes the tests, then it is good
          if [[ ! -f "$corrected_line" ]]; then
               echo "$corrected_line is missing or could not be read"
          fi

        fi
        done < "$file_name"
     exit 0
fi