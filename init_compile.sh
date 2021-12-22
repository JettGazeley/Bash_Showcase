#!/bin/bash

num_params=$#
argument_name=$1

#check if there are no command line arguments
if [[ "$num_params" -eq 0 ]]; then
     echo "Usage: init_compile.sh fully-qualified-classname">&2
     exit 1
fi

#check if argument is a directory and if the file exists in the current directory
if [[ "$argument_name" == *.* ]]; then
     #check if the file at the end exists in the directory
     file_name=${argument_name##*.}".java"
     if [[ ! -f "$file_name" ]]; then
          echo "$file_name missing in current directory">&2
          exit 2

     else
          file_name=${argument_name##*.}".java" #get the file name
          final=$(echo "src/${argument_name%.*}" | tr '.' '/' ) #make each "." a "/"
          mkdir -p "$final" #make the directory
          cp "$file_name" "$final" #copy the file to that directory
          exit 0
     fi
fi

#instructions for when we just have the filename
if [[ ! "$argument_name" == *.* ]]; then
     file_name=${argument_name##*.}".java"
     if [[ ! -f "$file_name" ]]; then
          echo "$file_name is missing in the current directory">&2
          exit 2

     #file exist in the current directory
     elif [[ -f "$file_name" ]]; then
          echo "we just have the filename"
          mkdir src
          cp "$file_name" src
          exit 0
     fi
fi