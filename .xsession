#!/bin/bash
 
# Load resources
xrdb -merge .Xresources

# Set up icon tray
stalonetray &
 
# Set the background color<
#xsetroot -solid midnightblue
 
# Fire up apps
gajim &
xscreensaver -no-splash &
 
#if [ -x /usr/bin/nm-applet ] ; then
#   nm-applet --sm-disable &
#fi
 
#if [ -x /usr/bin/gnome-power-manager ] ; then
#   sleep 3
#   gnome-power-manager &
#fi
 
exec xmonad