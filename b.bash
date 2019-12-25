#!/bin/bash

# A Linux file system bookmark manager.

BOOKMARK_DIR=$HOME/.config/b
BOOKMARK_PATH=$BOOKMARK_DIR/bookmarks

_b_print_help() {
    echo "b - A Linux file system bookmark manager."
    echo "Bookmarks are stored in $BOOKMARK_PATH"
    echo
    echo "<ref>     Change directory to the path pointed by the given reference."
    echo "-h        Print this message."
    echo "-c <ref>  Add current directory as bookmark with <ref> as reference."
    echo "-d <ref>  Delete bookmark with reference <ref>."
    echo "-l        List all bookmarks."
}

_b_delete_bookmark() {
    sed -i "/^$1 / d" $BOOKMARK_PATH
}

b() {
    if [ ! -f $BOOKMARK_PATH ]
    then
        mkdir -p $BOOKMARK_DIR
        touch $BOOKMARK_PATH
    fi
    
    if [ "$1" = "-c" ] || [ "$1" = "-d" ]
    then
        if (( $# < 2 ))
        then
            echo "Missing bookmark reference."
            return
        fi
    
        if [ $1 == "-c" ]
        then
            _b_delete_bookmark $2
            echo "$2 $(pwd)" >> $BOOKMARK_PATH
        else
            _b_delete_bookmark $2
        fi
    elif [ "$1" = "-l" ]
    then
        TAB="\t"
        cat $BOOKMARK_PATH | sed "s/ /$TAB$TAB/"
    elif [ "$1" = "-h" ]
    then
        _b_print_help
    elif [ $# != 0 ]
    then
        match=$(sed -n "s/^$1 //p" $BOOKMARK_PATH)
        if [ -n "$match" ]
        then
            cd $match
        else
            echo "Bookmark not found."
        fi
    else
        _b_print_help
    fi
}
