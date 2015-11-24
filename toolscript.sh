#!/bin/sh

if [ "$1" == "composer" ]; then
    shift
    exec composer "$@"
elif [ -f "/data/www/vendor/bin/$1" ]; then
    executable="$1" # save executable name because of shift
    shift
    exec "/data/www/vendor/bin/$executable" "$@"
fi

exec "composer" "$@"
