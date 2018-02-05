#!/usr/bin/env bash

# optional add on script to update vim
# install vim8 for better python virtualenv support via command line
sudo yum update -y
sudo yum install -y ncurses-devel
sudo yum install -y yum-builddep vim-X11
wget https://github.com/vim/vim/archive/v8.0.1438.tar.gz && \
    tar -xzf v8.0.1438.tar.gz && \
    cd vim-8.0.1438/src/ && \
    ./configure --enable-pythoninterp=yes --enable-python3interp=yes --enable-gui && \
    make && \
    sudo make install
