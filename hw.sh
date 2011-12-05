TEXTEDITOR="mate"
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
fi

if [ "$2" == "math" ]; then
    FOLDER=$HOME/Stanford/MATH51
fi

if [ "$3" == "pset" ]; then
    SUFFIX="answers.tex"
    PDF="answers.pdf"
    TEMPLATE="template.tex"
    if [ "$1" == "new" ]; then
        DATE=`date +%m%d`
        echo "Most recent physics pset is `ls $FOLDER | grep $SUFFIX | tail -n 1`"
        echo -n "What number should this pset be? "
        read NUMBER
        cp $FOLDER/$TEMPLATE $FOLDER/$DATE-pset-$NUMBER-$SUFFIX
        $TEXTEDITOR $FOLDER/$DATE-pset-$NUMBER-$SUFFIX
    fi
    if [ "$1" == "open" ]; then
        $TEXTEDITOR $FOLDER/`ls $FOLDER | grep $SUFFIX | tail -n 1`
    fi
    if [ "$1" == "compile" ]; then
        pushd $FOLDER
        pdflatex `ls $FOLDER | grep $SUFFIX | tail -n 1`
        trash *.aux
        trash *.log
        open `ls $FOLDER | grep $PDF | tail -n 1`
    fi
fi

if [ "$3" == "book" ]; then
    SUFFIX="text.pdf"
    if [ "$1" == "open" ]; then
        open $FOLDER/$SUFFIX
    fi
fi
