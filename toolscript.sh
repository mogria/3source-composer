#!/bin/sh

if [ "$1" == "composer" ]; then
    shift
    exec composer "$@"
elif [ -f "/data/www/vendor/bin/$1" ]; then
    shift
    exec "/data/www/vendor/bin/$2" "$@" # is $2 because of shift
fi

exec "composer" "$@"
