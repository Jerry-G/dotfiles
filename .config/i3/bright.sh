#!/usr/bin/env bash

#set the brightness of the screen
#NOTE requires sudo

#brightness increment value
#increment=651
increment=10

#extreme values of brightness
#subtract 1 from desired value b/c bash
max=7811
min=99

#file to conrol brightness
file="/sys/class/backlight/intel_backlight/brightness"

bright(){
    current=$(cat $file)
    new=$(($current + $increment))
    if [[ $new -gt $max ]]; then
        new=$(( $max + 1 ))
    fi
    tee $file <<< $new
}

dim(){
    current=$(cat $file)
    new=$(($current - $increment))
    if [[ $new -lt $min ]]; then
        new=$(( $min + 1 ))
    fi
    tee $file <<< $new
}

Help(){
    echo -ne "Usage:\n
    ./bright.sh up\t\tIncrease brightness
    ./bright.sh bright\t\tSame as './bright.sh up'
    ./bright.sh down\t\tDecrease brightness
    ./bright.sh dim\t\tSame as ./bright.sh down\n"
}


case $1 in
    up) bright ;;
    bright) bright;;
    down) dim ;;
    dim) dim ;;
    *) Help ;;
esac




