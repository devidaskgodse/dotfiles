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
sudo apt install anydesk zoom teams  zathura youtube-dl dwm hugo go  ctags rclone zsh autojump mpich ctags adb
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


# images & video tools
sudo add-apt-repository ppa:inkscape.dev/stable
sudo apt update
sudo apt install inkscape
sudo apt install ffmpeg mpv gnuplot vlc gimp imagemagick

####################

sudo apt install build-essential git  
git config --global user.name "Devidas Godse"
git config --global user.email "devidaskgodse@gmail.com"

sudo apt install markdown pandoc pandoc-citeproc fzf silversearcher-ag cmake ctags preload timeshift tlp rclone zsh autojump

# Brave browser
sudo apt install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

# anydesk
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list
sudo apt update
sudo apt install anydesk

# sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install sublime-text sublime-merge

# misc
sudo apt install teamviewer zoom teams

sudo apt install uuid-runtime

# heavy tools
sudo apt install texlive-base texlive-latex-base texlive-latex-extra texlive-science texlive-publishers

# wget https://repo.anaconda.com/archive/Anaconda3-latest-Linux-x86_64.sh

sudo apt install julia zathura sxiv mpv youtube-dl dmenu dwm xclip neovim hugo go gnuplot ffmpeg xclip 

# add IJulia package using `add IJulia` in package environment by entering `]` in Julia prompt 
