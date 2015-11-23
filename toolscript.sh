#!/bin/sh

tools[0]=composer
tools[1]=phpunit

for t in "${tools[@]}"; do
    if [[ "$t" == "$1" ]]; then
        exec "$t" "${@:2}"
    fi
done

exec "composer" "$@"
