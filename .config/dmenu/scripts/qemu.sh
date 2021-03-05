#!/bin/sh

dmenu_cmd() {
    dmenu -i -p "$1" \
        -l 15 -x 565 -y 200 -w 250 \
        -fn "JetBrainsMo no Nerd Font:style=Regular:size=10" \
        -nb "#282828" -nf "#ebdbb2" -sb "#fb6150" -sf "#1d2021" -bw 2;
}

case $(echo -e " Poweroff\nﰇ Reboot\n Suspend" | dmenu_cmd " ") in
 
    " Poweroff")
        # [ $(echo -e "Yes\nNo" | dmenu_cmd "Poweroff?") == "Yes" ] \
        st -e doas poweroff
        ;;

    "ﰇ Reboot")
        st -e doas reboot 
        ;;

    " Suspend")
        st -e doas s2ram
        ;;
esac
