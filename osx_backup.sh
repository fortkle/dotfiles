#!/bin/bash
set -eu

for dir in .ssh .config
do
  [ -d $HOME/$dir ] && \cp -frp $HOME/$dir $HOME/Dropbox/auto_backups/
done

for file in dotfiles/.zsh_variables
do
  [ -e $HOME/$file ] && \cp -frp $HOME/$file $HOME/Dropbox/auto_backups/
done
