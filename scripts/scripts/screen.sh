#!/bin/bash
xrandr_info="$(xrandr -q)"
if [[ $xrandr_info == *"HDMI-2 connected"* ]]; then
  echo "HDMI-2 found"
  xrandr --output LVDS-1 --off;
  xrandr --output HDMI-2 --auto --primary --rotate left;
  xrandr --output HDMI-3 --auto;
  xrandr --output HDMI-3 --right-of HDMI-2;
fi
