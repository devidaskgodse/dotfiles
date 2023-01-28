#!/bin/sh

sudo apt update
sudo apt upgrade

sudo apt install build-essential git apt-transport-https curl
git config --global user.name "Devidas Godse"
git config --global user.email "devidaskgodse@gmail.com"

# speed improvements and backups
sudo apt install preload timeshift tlp

# better terminal experience
sudo apt install autojump dmenu fzf neovim newsboat tmux rclone silversearcher-ag stow tldr xclip zsh
# install the vimplug for automatically managing the plugins
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
git clone --depth=1 https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.zsh/fast-syntax-highlighting
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions/ ~/.zsh/zsh-autosuggestions/

####################

## apt-repository based programs
# ledger
sudo add-apt-repository ppa:mbudde/ledger
# brave-browser
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
# sublime-text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
# sublime-merge
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
# anydesk
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list
# LAMMPS
sudo add-apt-repository ppa:gladky-anton/lammps
sudo add-apt-repository ppa:openkim/latest

sudo apt-get update
sudo apt install brave-browser sublime-text sublime-merge anydesk ledger lammps-stable lammps-stable-doc

####################

## packages & tools
sudo apt install adb dmenu dwm feh ffmpeg gnuplot go hugo imagemagick markdown mpv neovim pandoc pandoc-citeproc preload sxiv timeshift tlp tlp-rdw uuid-runtime virtualbox xclip youtube-dl zathura
# remote working
sudo apt install teams teamviewer zoom
# images & video tools
sudo apt install ffmpeg mpv vlc gimp imagemagick
# go
sudo apt install go hugo lf
# C/C++
sudo apt install cmake ctags mpich
# julia
sudo apt install julia
# add IJulia package using `add IJulia` in package environment by entering `]` in Julia prompt 
# texlive for latex
sudo apt install texlive-base texlive-latex-base texlive-latex-extra texlive-science texlive-publishers

# flatpak
sudo apt install flatpak gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# email configuration depepdencies for mutt-wizard by LukeSmithxyz
# git clone https://github.com/LukeSmithxyz/mutt-wizard
sudo apt install neomutt isync msmtp pass lynx notmuch abook urlview cronie

# python
# wget https://repo.anaconda.com/archive/Anaconda3-latest-Linux-x86_64.sh
# github-cli
conda install gh --channel conda-forge
conda install numpy scipy sympy numba matplotlib seaborn scikit-learn scikit-image pandas jupyter scikit-learn-intelex jupyterlab
