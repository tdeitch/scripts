#!/bin/bash
NAME=$1
NUMBER=$2
shopt -s nullglob
FILES=*.JPG\ *.jpg
for i in $FILES
do
mv "$i" "$NAME `printf "%02d" $NUMBER`.jpg"
NUMBER=`expr $NUMBER + 1` 
done

