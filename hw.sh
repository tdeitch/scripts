CLASSES="classes: physics, math"
NEWOPTS="'new' options: pset"
OPENOPTS="'open' options: pset, book"

if [[ $# -eq 0 || "$1" == "help" ]]; then
    echo $CLASSES
    echo $NEWOPTS
    echo $OPENOPTS
fi

if [ $# -eq 1 ]; then
    if [ "$1" == "new" ]; then
        echo $CLASSES
        echo $NEWOPTS
    fi
    if [ "$1" == "open" ]; then
        echo $CLASSES
        echo $OPENOPTS
    fi
fi

if [ "$2" == "physics" ]; then
    FOLDER=$HOME/Stanford/PHYSICS61
    if [ "$3" == "pset" ]; then
        SUFFIX="answers.tex"
        TEMPLATE="template.tex"
        if [ "$1" == "new" ]; then
            DATE=`date +%m%d`
            NUMBER=`ls $FOLDER | grep -c $SUFFIX`
            NUMBER=`expr $NUMBER + 1`
            cp $FOLDER/$TEMPLATE $FOLDER/$DATE-pset-$NUMBER-$SUFFIX
            bbedit $FOLDER/$DATE-pset-$NUMBER-$SUFFIX
        fi
        if [ "$1" == "open" ]; then
            bbedit $FOLDER/`ls $FOLDER | grep $SUFFIX | tail -n 1`
        fi
    fi
    if [ "$3" == "book" ]; then
        SUFFIX="text.pdf"
        if [ "$1" == "open" ]; then
            open $FOLDER/$SUFFIX
        fi
    fi
fi

if [ "$2" == "math" ]; then
    FOLDER=$HOME/Stanford/MATH51
        if [ "$3" == "pset" ]; then
        SUFFIX="answers.tex"
        TEMPLATE="template.tex"
        if [ "$1" == "new" ]; then
            DATE=`date +%m%d`
            NUMBER=`ls $FOLDER | grep -c $SUFFIX`
            NUMBER=`expr $NUMBER + 1`
            cp $FOLDER/$TEMPLATE $FOLDER/$DATE-pset-$NUMBER-$SUFFIX
            bbedit $FOLDER/$DATE-pset-$NUMBER-$SUFFIX
        fi
        if [ "$1" == "open" ]; then
            bbedit $FOLDER/`ls $FOLDER | grep $SUFFIX | tail -n 1`
        fi
    fi
    if [ "$3" == "book" ]; then
        SUFFIX="text.pdf"
        if [ "$1" == "open" ]; then
            open $FOLDER/$SUFFIX
        fi
    fi
fi
