#!/bin/bash
xrandr_info="$(xrandr -q)"
if [[ $xrandr_info == *"HDMI-2 connected"* ]]; then
  echo "HDMI-2 found"
  xrandr --output LVDS-1 --off;
  xrandr --output HDMI-1 --auto --primary --rotate left;
  xrandr --output HDMI-3 --auto;
  xrandr --output HDMI-2 --right-of HDMI-1;
  # xrandr --output HDMI-2 --left-of HDMI-1;
fi
