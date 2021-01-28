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
brew install autoconf
brew install bison
brew install bzip2
brew install curl
brew install libedit
brew install libiconv
brew install libxml2
brew install libzip
brew install re2c
brew install tidy-html5
brew install zlib

# git
brew install git
brew install hub
brew install tig
brew install ghq
brew install gibo

# terminal UI
brew install peco
brew install tmux

# node
brew install yarn

# go
brew install go

# infra
brew install awscli@1
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
brew install --cask google-japanese-ime
brew install --cask google-chrome
brew install --cask firefox
brew install --cask hyperswitch
brew install --cask skitch
brew install --cask kindle
brew install --cask appcleaner
brew install --cask karabiner-elements
brew install --cask bartender
brew install --cask docker
brew install --cask paw
brew install --cask cursorsense
brew install --cask imageoptim
brew install --cask ngrok
brew install --cask visual-studio-code
brew install --cask mysqlworkbench
brew install --cask jetbrains-toolbox
brew install --cask notion
brew install --cask tableplus
brew install --cask bitwarden
brew install --cask discord

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
