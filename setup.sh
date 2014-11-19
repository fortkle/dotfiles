#!/bin/bash

# php周りのインストール
sudo service iptables stop
sudo chkconfig iptables off

sudo yum -y update

sudo yum -y install http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
sudo sed -i -e "s/enabled = 1/enabled = 0/g" /etc/yum.repos.d/rpmforge.repo

sudo rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
sudo sed -i -e "s/enabled = 1/enabled = 0/g" /etc/yum.repos.d/epel.repo

sudo rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
sudo sed -i -e "s/enabled = 2/enabled = 0/g" /etc/yum.repos.d/remi.repo

sudo yum -y update --enablerepo=rpmforge,epel,remi,remi-php55

sudo yum -y install --enablerepo=remi,remi-php55 php php-opcache php-devel php-mbstring php-mcrypt php-mysql php-phpunit-PHPUnit php-pecl-xdebug php-cli php-common

sudo yum -y install --enablerepo=remi gd-last
sudo yum -y install --enablerepo=remi-php55 php-gd
sudo yum -y install --enablerepo=remi ImageMagick-last
sudo yum -y install --enablerepo=remi-php55 phpMyAdmin

# Vim7.4のインストール
sudo yum -y install gcc
sudo yum install ncurses-devel
mkdir ~/src
mkdir ~/local
mkdir ~/bin
cd ~/src
wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
tar jxvf vim-7.4.tar.bz2
cd vim74/
./configure --with-features=huge --enable-xim --enable-fontset --enable-multibyte --enable-rubyinterp --prefix=$HOME/local
make
make install
cd ~/bin
ln -s ~/local/bin/vim
source ~/.bash_profile

# vimrcの設定 
git clone https://github.com/fortkle/dotfiles.git .dotfiles
ln -s .dotfiles/.vimrc
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
#cd ~/.vim/bundle/vimproc/
#sudo make -f make_unix.mak

# tmuxのインストール
sudo yum install tmux -y
ln -s .dotfiles/.tmux.conf
