#!/bin/bash
set -eu

THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR
cd $HOME

for file in .editorconfig .gitconfig .gitignore_global .tmux.conf .vimrc .ideavimrc .zshrc .zsh_variables
do
  [ ! -e $file ] && ln -s dotfiles/$file .
done
