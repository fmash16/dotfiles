# dwm

#load xresources for st
xrdb ~/.Xresources
feh --bg-scale ~/Pictures/boy.jpg
#hsetroot -solid "#171a1c"
#hsetroot -solid "#4d77cb"

#xrdb -merge ~/.Xresources.gruvboxlight
#feh --bg-scale ~/index.jpe

export AWT_TOOLKIT=MToolkit
set WMName="LG3D"

# Set background

# Start compton
picom -b

#bash ~/.config/dwm/dwmbar
exec dbus-launch startdwm
#exec dwm
