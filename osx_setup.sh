#!/bin/sh

# install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install commands
brew install ag
brew install fontforge
brew install git
brew install homebrew/php/composer
brew install mercurial
brew install nkf
brew install peco
brew install tidy-html5
brew install tig
brew install tmux
brew install tree
brew install vim
brew install wget
brew install zsh

# install software
brew cask install dropbox
brew cask install google-chrome
brew cask install firefox
brew cask install virtualbox
brew cask install vagrant
brew cask install sequel-pro
brew cask install hyperswitch
brew cask install karabiner
brew cask install seil
brew cask install google-japanese-ime
brew cask install skitch
brew cask install bartender
brew cask install keepassx