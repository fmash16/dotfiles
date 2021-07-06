# dwm

#load xresources for st
xrdb -merge ~/.Xresources

export AWT_TOOLKIT=MToolkit
set WMName="LG3D"

# Set background
# feh --bg-scale Pictures/gentoo.webp
hsetroot -solid "#131313"
# hsetroot -solid "#c6ecc6"
# hsetroot -solid "#131720"
# hsetroot -solid "#5f6c86"
# Start compton
picom -b

# bash ~/.config/dwm/dwmbar

exec dbus-launch dwm
