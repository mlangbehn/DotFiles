#!/bin/sh

# Install pathogen for vim plugin management
mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install airline status bar
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline

# Check for existing ~/.vimrc and back it up if it exists
if [ -f $HOME/.vimrc ]; then
    echo
    echo "Existing ~/.vimrc found."
    echo "Backing it up to ~/.vimrc.bak"
    echo
    cp $HOME/.vimrc{,.bak}
fi
curl https://raw.githubusercontent.com/mlangbehn/DotFiles/master/vimrc > $HOME/.vimrc

# Check for ~/.zsh, and create if it doesn't
if [ ! -d $HOME/.zsh ]; then
    echo
    echo "No ~/.zsh found."
    echo "creating it."
    echo
    mkdir $HOME/.zsh
fi

# Check for existing ~/.zsh/_git and back it up if it exists
if [ -f $HOME/.zsh/_git ]; then
    echo
    echo "Existing ~/.zsh/_git found."
    echo "Backing it up to ~/.zsh/_git.bak"
    echo
    cp $HOME/.zsh/_git{,.bak}
fi
curl https://raw.githubusercontent.com/mlangbehn/DotFiles/master/zsh/_git > $HOME/.zsh/_git

# Check for existing ~/.zsh/git-prompt.sh and back it up if it exists
if [ -f $HOME/.zsh/git-prompt.sh ]; then
    echo
    echo "Existing ~/.zsh/git-prompt.sh found."
    echo "Backing it up to ~/.zsh/git-prompt.sh.bak"
    echo
    cp $HOME/.zsh/git-prompt.sh{,.bak}
fi
curl https://raw.githubusercontent.com/mlangbehn/DotFiles/master/zsh/git-prompt.sh > $HOME/.zsh/git-prompt.sh

# Check for existing ~/.zshrc and back it up if it exists
if [ -f $HOME/.zshrc ]; then
    echo
    echo "Existing ~/.zshrc found."
    echo "Backing it up to ~/.zshrc.bak"
    echo
    cp $HOME/.zshrc{,.bak}
fi
curl https://raw.githubusercontent.com/mlangbehn/DotFiles/master/zshrc > $HOME/.zshrc

echo
echo "Installation complete."
echo "If zsh is not your current default shell, and you want it to be,"
echo "run the following:"
echo "    chsh -s `which zsh`"
echo "Then, to switch to it, run:"
echo "    `which zsh`"
echo
echo "If you are already running zsh, and you want to start using your"
echo "new configuration, either logout and back in, or run:"
echo "    source ~/.zshrc"
echo
