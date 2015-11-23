#!/bin/sh

if [ "$1" == "composer" ]; then
    shift
    exec composer "$@"
elif [ -f "/data/www/vendor/bin/$1" ]; then
    shift
    exec "/data/www/vendor/bin/$1" "$@"
fi

exec "composer" "$@"
