#!/bin/sh

OUTPUT="eDP-1"
LOW_SCALE="1"
HIGH_SCALE="1.25"

current=$(swaymsg -t get_outputs -r | \
  jq -r --arg o "$OUTPUT" '.[] | select(.name==$o) | .scale')

if [ "$current" = "$HIGH_SCALE" ]; then
  swaymsg output "$OUTPUT" scale "$LOW_SCALE"
else
  swaymsg output "$OUTPUT" scale "$HIGH_SCALE"
fi
