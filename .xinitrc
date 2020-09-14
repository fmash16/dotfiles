# dwm

#load xresources for st
xrdb ~/.Xresources

# Set background
# hsetroot -solid "#c6ecc6"
hsetroot -solid "#131720"
# Start compton
picom -b

bash ~/.config/dwm/dwmbar

exec dbus-launch dwm
