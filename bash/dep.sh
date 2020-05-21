#!/bin/sh

REQUIRES=$1

for NAME in $(pip freeze | cut -d= -f1); do 
    REQ=$(pip show "$NAME"| grep Requires); 
    if [[ "$REQ" =~ $REQUIRES ]]; then 
        echo "$REQ";
        echo "Package: $NAME"; 
        echo "---" ; 
    fi
done
