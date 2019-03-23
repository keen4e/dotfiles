#!/bin/bash

set -e
set -o xtrace

# Remove info message
touch ~/.hushlogin

# Powerline Fonts
git clone https://github.com/powerline/fonts.git ~/dotfiles/fonts
cd ~/dotfiles/fonts
./install.sh

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Brewfile bundle
brew bundle -v

# Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Powerlevel9k theme
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# Oh-My-Zsh dd plugin 
git clone https://github.com/keen4e/dd.git $ZSH_CUSTOM/plugins/dd

# Config Symlinks
cd ~
ln -sf dotfiles/config/gitconfig .gitconfig
ln -sf dotfiles/config/gitignore_global .gitignore_global
ln -sf dotfiles/config/ssh_config .ssh/config
ln -sf dotfiles/config/tmux.conf .tmux.conf
ln -sf dotfiles/config/zshrc .zshrc
