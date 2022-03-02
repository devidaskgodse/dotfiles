#!/bin/sh

sudo apt update
sudo apt upgrade
sudo apt install git
git config --global user.name "Devidas Godse"
git config --global user.email "devidaskgodse@gmail.com"

sudo apt install build-essential
sudo apt install preload timeshift stow tlp

sudo apt install neovim sublime-text sublime-merge pandoc pandoc-citeproc 
# install the vimplug for automatically managing the plugins
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

sudo apt install fzf silversearcher-ag cmake tldr xclip dmenu 
sudo apt install anydesk zoom teams ffmpeg mpv zathura youtube-dl dwm hugo go gnuplot ctags rclone zsh autojump mpich ctags adb vlc gimp imagemagick
sudo apt install texlive-base texlive-latex-base texlive-latex-extra texlive-science texlive-publishers

# email configuration depepdencies for mutt-wizard by LukeSmithxyz
# git clone https://github.com/LukeSmithxyz/mutt-wizard
sudo apt install neomutt curl isync msmtp pass lynx notmuch abook urlview cronie

# flatpak install
sudo apt install flatpak gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# ledger for money management
sudo add-apt-repository ppa:mbudde/ledger
sudo apt-get update
sudo apt-get install ledger