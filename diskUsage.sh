#!/bin/bash

# check for argument provided for a directory
if [ "$#" -eq 2 ] && [ "$1" == "-d" ] && [ -d $2 ]
then
	echo "Disk Usage in this directory"
	sudo du -h --max-depth=1 "$2" | sort -rh | head
fi

if [ "$#" -eq 2 ] && [ "$1" == "-n" ]
then
	n=8
	dir_arg="$2"
	echo "The top $n entries by default base on dixsk usage:"
	sudo du -h --max-depth=1 "$dir_arg" | sort -rh | head -n "$n"

elif [ "$#" -eq 3 ] && [ "$1" == "-n" ] && [ "$2" -gt 0 ]
then
	n="$2"
	dir_arg="$3"
	echo "Top $n write disk usage:"
	sudo du --max-depth=1 "$dir_arg" | sort -rh | head -n "$n"
fi
