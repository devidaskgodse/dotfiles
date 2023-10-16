#!/bin/sh

# Macbook with Apple Silicon
# Installation guide: https://mac.install.guide/ruby/3.html
# install homebrew package manager
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# add homebrew to path
echo '# Set PATH, MANPATH, etc., for Homebrew.' >> /Users/devidas/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/devidas/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Setting up git
git config --global user.name "Devidas Godse"
git config --global user.email "devidaskgodse@gmail.com"

# install manually
# brave-browser anydesk sublime-text sublime-merge msteams obsidian ovito r julia raindrop miniconda

# python packages
conda install numpy scipy sympy numba matplotlib seaborn scikit-learn scikit-image pandas jupyter jupyterlab

# install from appstore
# whatsapp davinci-resolve keynote numbers pages ticktick


# rust packages


# julia packages