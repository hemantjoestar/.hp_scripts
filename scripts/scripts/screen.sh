#!/bin/bash
xrandr_info="$(xrandr -q)"
xrandr --auto
# xrandr --output eDP-1 --mode 1680x1050
# xrandr --output eDP --mode 1680x1050
if [[ $xrandr_info == *"HDMI-1 connected"* ]]; then
  echo "HDMI-1 found"
  # xrandr --output LVDS-1 --off;
  # xrandr --output HDMI-1 --auto --primary --rotate left;
  xrandr --output HDMI-1 --rotate left --right-of eDP-1;
  # xrandr --output HDMI-1 --auto --primary --rotate normal;
  # xrandr --output HDMI-3 --auto;
  # xrandr --output HDMI-2 --left-of HDMI-1;
fi
if [[ $xrandr_info == *"HDMI-A-0 connected"* ]]; then
  echo "HDMI-A-0 found"
  # xrandr --output LVDS-1 --off;
  # xrandr --output HDMI-1 --auto --primary --rotate left;
  xrandr --output HDMI-A-0 --rotate left --right-of eDP;
  # xrandr --output HDMI-1 --auto --primary --rotate normal;
  # xrandr --output HDMI-3 --auto;
  # xrandr --output HDMI-2 --left-of HDMI-1;
fi
if [[ $xrandr_info == *"DisplayPort-0 connected"* ]]; then
  echo "displayport-0 found"
  xrandr --auto
  # xrandr --output lvds-1 --off;
  # xrandr --output hdmi-1 --auto --primary --rotate left;
  # xrandr --output displayport-0 --rotate left --right-of edp;
  # xrandr --output displayport-1 --auto --right-of  eDP;
  xrandr --output DisplayPort-0 --scale 2x2 --above  eDP;
  # xrandr --output hdmi-1 --auto --primary --rotate normal;
  # xrandr --output hdmi-3 --auto;
  # xrandr --output hdmi-2 --left-of hdmi-1;
fi
if [[ $xrandr_info == *"DisplayPort-1 connected"* ]]; then
  echo "displayport-1 found"
  xrandr --auto
  # xrandr --output lvds-1 --off;
  # xrandr --output hdmi-1 --auto --primary --rotate left;
  # xrandr --output displayport-0 --rotate left --right-of edp;
  # xrandr --output displayport-1 --auto --right-of  eDP;
  xrandr --output DisplayPort-1 --auto --above  eDP;
  # xrandr --output hdmi-1 --auto --primary --rotate normal;
  # xrandr --output hdmi-3 --auto;
  # xrandr --output hdmi-2 --left-of hdmi-1;
fi
if [[ $xrandr_info == *"DP-1"* ]]; then
  echo "DP-1"
  xrandr --auto
  # xrandr --output LVDS-1 --off;
  # xrandr --output HDMI-1 --auto --primary --rotate left;
  # xrandr --output DisplayPort-0 --rotate left --right-of eDP;
  # xrandr --output DP-1 --rotate left --right-of eDP-1;
  xrandr --output DP-1 --auto --above eDP-1;
  # xrandr --output HDMI-1 --auto --primary --rotate normal;
  # xrandr --output HDMI-3 --auto;
  # xrandr --output HDMI-2 --left-of HDMI-1;
fi
