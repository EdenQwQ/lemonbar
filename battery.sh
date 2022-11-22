#!/bin/sh

battery=/sys/class/power_supply/BAT0
mode=$(cat "${battery}/status")
percent=$(cat "${battery}/capacity")
symbol=""

if [ "$mode" = "Discharging" ]; then
    symbol=''
elif [ "$mode" = "Charging" ]; then
    symbol=''
else
    symbol=''
fi

echo "$symbol $percent%"
