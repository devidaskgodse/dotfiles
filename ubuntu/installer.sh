#!/bin/sh

# TODO: Split the configurations that are valid for mac vs that are valid for ubuntu or linux otherwise

sudo apt update
sudo apt upgrade

sudo apt install build-essential git apt-transport-https curl zsh
git config --global user.name "Devidas Godse"
git config --global user.email "devidaskgodse@gmail.com"

# speed improvements and backups
sudo apt install preload timeshift tlp tlp-rdw

# better terminal experience
sudo apt install dmenu fzf newsboat silversearcher-ag stow xclip
sudo apt install autojump dmenu fzf neovim newsboat tmux rclone silversearcher-ag stow tldr xclip zsh synaptic
# install the vimplug for automatically managing the plugins
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
git clone --depth=1 https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.zsh/fast-syntax-highlighting
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions/ ~/.zsh/zsh-autosuggestions/


## packages & tools
sudo apt install adb ffmpeg imagemagick markdown mpv pandoc-citeproc preload sxiv virtualbox xclip youtube-dl zathura
# remote working
sudo apt install teams teamviewer zoom
# images & video tools
sudo apt install ffmpeg mpv vlc gimp imagemagick
# C/C++
sudo apt install cmake ctags mpich
# texlive for latex
sudo apt install texlive-base texlive-latex-base texlive-latex-extra texlive-science texlive-publishers

# flatpak
sudo apt install flatpak gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# email configuration depepdencies for mutt-wizard by LukeSmithxyz
# git clone https://github.com/LukeSmithxyz/mutt-wizard
sudo apt install neomutt isync msmtp pass notmuch abook urlview cronie

# python
# wget https://repo.anaconda.com/archive/Anaconda3-latest-Linux-x86_64.sh
# github-cli
conda install gh --channel conda-forge
conda install numpy scipy sympy numba matplotlib seaborn scikit-learn scikit-image pandas jupyter scikit-learn-intelex jupyterlab

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

sudo apt-get update
sudo apt install brave-browser sublime-text sublime-merge anydesk ledger lammps-stable lammps-stable-doc

####################

## packages & tools
sudo apt install adb dmenu dwm feh ffmpeg gnuplot go hugo imagemagick markdown mpv neovim pandoc pandoc-citeproc preload sxiv timeshift tlp tlp-rdw uuid-runtime virtualbox xclip youtube-dl zathura rclone
# remote working
sudo apt install teams teamviewer zoom
# images & video tools
sudo apt install ffmpeg mpv vlc gimp imagemagick inkscape

# flatpak
sudo apt install flatpak gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# email configuration depepdencies for mutt-wizard by LukeSmithxyz
# git clone https://github.com/LukeSmithxyz/mutt-wizard
sudo apt install neomutt isync msmtp pass lynx notmuch abook urlview cronie

sudo apt install gh # in Ubuntu 20.04 or less, use: `conda install gh --channel conda-forge`

# go
sudo apt install go hugo lf
# C/C++
sudo apt install cmake ctags mpich
# texlive for latex
sudo apt install texlive-base texlive-latex-base texlive-latex-extra texlive-science texlive-publishers


# github-cli
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

# python
# Julia installation and package setup
wget https://julialang-s3.julialang.org/bin/linux/x64/1.8/julia-1.8.1-linux-x86_64.tar.gz
tar -gz julia-1.8.1-linux-x86_64.tar.gz

# echo julia directory to system path variable

# Python installation and package setup
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh | sh
sh Miniconda3-latest-Linux-x86_64.sh
conda config --set auto_activate_base false
conda install numpy scipy sympy numba matplotlib seaborn scikit-learn scikit-image pandas jupyter scikit-learn-intelex jupyterlab numba mkl scikit-learn-intelex

#-----------------------------------------------------

sudo apt install markdown pandoc pandoc-citeproc
sudo apt install fzf silversearcher-ag cmake ctags adb xclip
sudo apt install youtube-dl teamviewer zoom teams
sudo apt install gnuplot gimp fzf gnuplot pass r-base rclone rsync silversearcher-ag tmux zsh-autosuggestions zathura

#  install open source vscode version
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor | sudo dd of=/etc/apt/trusted.gpg.d/vscodium.gpg
echo 'deb https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list
sudo apt update && sudo apt install codium
# projects
git clone https://github.com/sparta/sparta


# optional (comment out if not required for the moment)
sudo apt install vim emacs sublime-text sublime-merge 
sudo apt install gimp imagemagick
pip install markdown
# links
# ANACONDA: https://docs.anaconda.com/anaconda/install/linux/
# eatherpad
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -

export PATH="$PATH:$HOME/julia/bin"