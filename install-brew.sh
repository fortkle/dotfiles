#!/bin/bash
set -eu

# install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

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
brew install corepack

# go
brew install go

# infra
brew install jq
brew install awscli

# install software
brew install --cask google-chrome
brew install --cask skitch
brew install --cask appcleaner
brew install --cask docker
brew install --cask jetbrains-toolbox
brew install --cask notion
brew install --cask bitwarden
brew install --cask karabiner-elements
brew install --cask cursorsense
brew install --cask alt-tab
brew install --cask unity-hub
brew install --cask zoom
brew install --cask discord
brew install --cask notion-calendar
brew install --cask google-cloud-sdk
brew install --cask jump-desktop-connect
brew install --cask notunes
brew install --cask cursor

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
# Take A Break, Please
mas install 843150501
# Kindle
mas install 302584613
