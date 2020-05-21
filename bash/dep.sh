#!/bin/bash

display_usage() { 
	echo "This script can be used to find python packages that depends on a package." 
	echo -e "\nUsage:\ndep.sh <package name> \n" 
}

if [  $# -le 1 ];then 
    display_usage
    exit 1
fi 

REQUIRES=$1

for NAME in $(pip freeze | cut -d= -f1); do 
    REQ=$(pip show "$NAME"| grep Requires); 
    if [[ "$REQ" =~ $REQUIRES ]]; then 
        echo "$REQ";
        echo "Package: $NAME"; 
        echo "---" ; 
    fi
done
