#!/bin/bash
set -eu

# install Homebrew
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install commands
# unix tools
brew install gnu-sed
brew install nkf
brew install wget
brew install tree
brew install ag
brew install vim

## MacAppStore
brew install mas

# phpenv(anyenv)
brew install bison
brew install re2c
brew install libxml2
brew install libzip

# git
brew install git
brew install hub
brew install tig
brew install ghq

# terminal UI
brew install peco
brew install tmux

# node
brew install yarn

# go
brew install go

# infra
brew install awscli
brew install awsebcli
brew install terraform
brew install jq

# db
brew install mysql@5.6
brew install redis

# Connehito
brew tap Connehito/gdp
brew install gdp
brew install imagemagick
brew install heroku/brew/heroku

# install software
brew cask install google-japanese-ime
brew cask install google-chrome
brew cask install firefox
brew cask install vivaldi
brew cask install hyperswitch
brew cask install skitch
brew cask install kindle
brew cask install appcleaner
brew cask install keepassx
brew cask install karabiner-elements
brew cask install bartender
brew cask install docker
brew cask install paw
brew cask install cursorsense
brew cask install kap
brew cask install imageoptim
brew cask install ngrok
brew cask install avast-security
brew cask install visual-studio-code
brew cask install mysqlworkbench
brew cask install spotify
brew cask install jetbrains-toolbox
brew cask install notion

# install software from MacAppStore
# Slack
mas install 803453959
# CotEditor
mas install 1024640650
# PopClip
mas install 445189367
# BetterSnapTool
mas install 417375580
# The Unarchiver
mas install 425424353
# Win Archiver Lite
mas install 414855915
# Fantastical2
mas install 975937182
# Bear
mas install 1091189122
