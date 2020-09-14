#! /bin/bash

mkdir work && cd work/

sudo apt-get install cc make dh-autoreconf libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev libxcb-shape0 libxcb-shape0-dev

# clone the repository
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps

# compile & install
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/

# Disabling sanitizers is important for release versions!
# The prefix and sysconfdir are, obviously, dependent on the distribution.
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install

cd ../

sudo apt-get install i3status i3bar compton feh ranger tmux vim evince

sudo apt-get install cmake cairo libxcb python xcb-proto xcb-util-image xcb-util--util-cursor xcb-util-xrm alsa-lib 

git clone https://github.com/polybar/polybar

cd polybar
./build.sh
# mkdir build
# cd build
# cmake ..
# make -j$(nproc)
# sudo make install

cd ../

sudo apt-get install rxvt-unicode

cp ./.vimrc ~/.vimrc
cp ./.tmux.conf ~/.tmux.conf
cp ./.Xresources ~/..Xresources
cp ./.config/* ~/.config/
