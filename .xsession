#!/bin/bash
 
# Load resources
xrdb -merge .Xresources

# Set up icon tray
stalonetray &
 
# Fire up apps
nm-applet --sm-disable &
gajim &
xscreensaver -no-splash &
 
exec xmonad