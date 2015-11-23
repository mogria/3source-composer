#!/bin/sh

if [ "$1" == "composer" ]; then
    shift
    exec composer "$@"
elif [ "$1" == "phpunit" ]; then
    shift
    exec phpunit "$@"
fi

exec "composer" "$@"
