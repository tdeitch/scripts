#!/bin/bash

for FILE in "$@"
    do
        mv -n $FILE $HOME/.Trash/
    done
