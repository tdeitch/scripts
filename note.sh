#!/bin/bash

DIR=~/Dropbox/Notes
EXTENSION=md

if [ $1 == "new" -o $1 == "add" ]; then
    FILE=`date +%m%d`
    for var in "${@:2}"; do
        FILE="$FILE-$var"
    done
    $EDITOR "$DIR/$FILE.$EXTENSION"
fi

if [ $1 == "list" -o $1 == "ls" ]; then
    ls -tr1 $DIR
fi

if [ $1 == "edit" -o $1 == "open" ]; then
    SEARCH=''
    for var in "${@:2}"; do
        SEARCH="$SEARCH-$var"
    done
    SEARCH=${SEARCH:1}
    FILES="`ls -t1 $DIR`"
    for file in $FILES; do
        if [[ $file == *$SEARCH* ]]; then
            $EDITOR "$DIR/$file"
            break
        fi
    done
fi

if [ $1 == "help" ]; then
    echo "usage: note.sh (new | list | edit)"
fi
