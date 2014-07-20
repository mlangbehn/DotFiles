#!/bin/sh

# Check for existing ~/.zshrc and back it up if it exists
if [ -f $HOME/.zshrc ]; then
    echo
    echo "Existing ~/.zshrc found."
    echo "Backing it up to ~/.zshrc.bak"
    echo
    cp $HOME/.zshrc $HOME/.zshrc.bak
fi
curl https://raw.githubusercontent.com/mlangbehn/DotFiles/master/zshrc > $HOME/.zshrc

# Check for existing ~/.vimrc and back it up if it exists
if [ -f $HOME/.vimrc ]; then
    echo
    echo "Existing ~/.vimrc found."
    echo "Backing it up to ~/.vimrc.bak"
    echo
    cp $HOME/.vimrc $HOME/.vimrc.bak
fi
curl https://raw.githubusercontent.com/mlangbehn/DotFiles/master/vimrc > $HOME/.vimrc
