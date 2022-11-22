#!/bin/sh

volume=$(amixer sget Master | grep 'Right:' | awk -F'[][]' '{ print $2 }' | cut -d % -f 1)

if [ "$(amixer sget Master | grep off)" != "" ]; then
  echo ﱝ muted
else
  if [ $volume -lt 30 ]; then
    echo  $volume%%
  elif [ $volume -ge 30 ] && [ $volume -le 75 ]; then
    echo 墳 $volume%%
  else
    echo    $volume%%
  fi
fi
