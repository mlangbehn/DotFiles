#!/bin/sh

# Check for existing ~/.vimrc and back it up if it exists
if [ -f $HOME/.vimrc ]; then
    echo
    echo "Existing ~/.vimrc found."
    echo "Backing it up to ~/.vimrc.bak"
    echo
    cp $HOME/.vimrc $HOME/.vimrc.bak
fi
curl https://raw.githubusercontent.com/mlangbehn/DotFiles/master/vimrc > $HOME/.vimrc

# Check for existing ~/.zshrc and back it up if it exists
if [ -f $HOME/.zshrc ]; then
    echo
    echo "Existing ~/.zshrc found."
    echo "Backing it up to ~/.zshrc.bak"
    echo
    cp $HOME/.zshrc $HOME/.zshrc.bak
fi
curl https://raw.githubusercontent.com/mlangbehn/DotFiles/master/zshrc > $HOME/.zshrc

# Check if zsh is the default shell
#   If not, verify that it is installed
#   If it is, offer to make it to the default

echo
echo "Checking your default shell..."
if [ "$SHELL" != /bin/zsh ]; then
    CHANGE_DEFAULT_SHELL = yes
    echo
    echo "Your default shell is currently $SHELL."
    echo "Would you like to change your default shell to zsh? (YES/no)"
    read $CHANGE_DEFAULT_SHELL

    echo $CHANGE_DEFAULT_SHELL
    echo "$CHANGE_DEFAULT_SHELL"
    if [ "$CHANGE_DEFAULT_SHELL" == yes ]; then
        chsh -s `which zsh`
    fi
fi

ps `echo $$` | grep zsh
if [ $? = "0" ]; then
    CHANGE_SHELL = yes
    echo
    echo "You are not currently running zsh."
    echo "Would you like to change into zsh? (YES/no)"
    read $CHANGE_SHELL

    if [ $CHANGE_SHELL ]; then
        /usr/bin/env zsh
    fi
else
    SOURCE_ZSHRC
    echo "Would you like to source your new ~/.zshrc? (YES/no)"
    read $SOURCE_ZSHRC

    if [ $SOURCE_ZSHRC ]; then
        . $HOME/.zshrc
    fi
fi
