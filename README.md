<p align="center">
    <img src="dotfiles.png">
</p>

These are the different configurations for my desktop rice and builds of my window
manager and terminal. My current configuration is:

* **WM:** dwm
* **Terminal:** st
* **Shell:** zsh
* **Font:** Iosveka Term
* **Compositor:** picom
* **File Manager:** ranger
* **PDF Viewer:** zathura
* **Browser:** Firefox with custom css.
* **Terminal Multiplexer:** tmux

# Setup

CLone the repo and issue the following commands to apply the rice

```bash
git clone https://github.com/fmash16/dotfiles
cp -rv dotfiles/* ~/

cd ~/.config/dwm && sudo make clean install
cd ~/.config/st && sudo make clean install

cd ~/ && xrdb .Xresources
```

Install the following packages on the distro:
  1. ranger
  2. zathura pdf viewer
  3. picom
  4. tmux
  5. zsh (oh-my-zsh)
  6. vim


## Firefox custom CSS



