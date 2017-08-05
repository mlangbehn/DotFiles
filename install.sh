#!/bin/bash

# vim: set ts=4 sw=4 expandtab:

#    Copyright (C) 2013-2017  Matthew Langbehn
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Install required pip packages
pip install -U pip
curl https://raw.githubusercontent.com/mlangbehn/DotFiles/master/requirements.txt > /tmp/requirements.txt
pip install -r /tmp/requirements.txt
rm /tmp/requirements.txt

# Install pathogen for vim plugin management
mkdir -p "$HOME"/.vim/autoload "$HOME"/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install airline status bar
if [[ -d "$HOME"/.vim/bundle/vim-airline ]]; then
    pushd "$HOME"/.vim/bundle/vim-airline
    git checkout master
    git fetch
    git reset --hard origin/master
else
    git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
fi

# Install ansible vim plugin
if [[ -d "$HOME"/.vim/bundle/ansible-vim ]]; then
    pushd "$HOME"/.vim/bundle/ansible-vim
    git checkout master
    git fetch
    git reset --hard origin/master
else
    git clone https://github.com/pearofducks/ansible-vim.git ~/.vim/bundle/ansible-vim
fi

# Install syntastic syntax checker
if [[ -d "$HOME"/.vim/bundle/syntastic ]]; then
    pushd "$HOME"/.vim/bundle/syntastic
    git checkout master
    git fetch
    git reset --hard origin/master
else
    git clone https://github.com/vim-syntastic/syntastic.git ~/.vim/bundle/syntastic
fi

# Check for existing ~/.vimrc and back it up if it exists
if [[ -f "$HOME"/.vimrc ]]; then
    echo
    echo "Existing ~/.vimrc found."
    echo "Backing it up to ~/.vimrc.backup"
    echo
    cp "$HOME"/.vimrc{,.backup}
fi
curl https://raw.githubusercontent.com/mlangbehn/DotFiles/master/vimrc > "$HOME"/.vimrc

# Check for ~/.zsh, and create if it doesn't
if [[ ! -d "$HOME"/.zsh ]]; then
    echo
    echo "No ~/.zsh found."
    echo "creating it."
    echo
    mkdir "$HOME"/.zsh
fi

# Check for existing ~/.zsh/_git and back it up if it exists
if [[ -f "$HOME"/.zsh/_git ]]; then
    echo
    echo "Existing ~/.zsh/_git found."
    echo "Backing it up to ~/.zsh/_git.backup"
    echo
    cp "$HOME"/.zsh/_git{,.backup}
fi
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh > "$HOME"/.zsh/_git

# Check for existing ~/.zsh/git-prompt.sh and back it up if it exists
if [[ -f "$HOME"/.zsh/git-prompt.sh ]]; then
    echo
    echo "Existing ~/.zsh/git-prompt.sh found."
    echo "Backing it up to ~/.zsh/git-prompt.sh.backup"
    echo
    cp "$HOME"/.zsh/git-prompt.sh{,.backup}
fi
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > "$HOME"/.zsh/git-prompt.sh

# Check for existing ~/.zshrc and back it up if it exists
if [[ -f "$HOME"/.zshrc ]]; then
    echo
    echo "Existing ~/.zshrc found."
    echo "Backing it up to ~/.zshrc.backup"
    echo
    cp "$HOME"/.zshrc{,.backup}
fi
curl https://raw.githubusercontent.com/mlangbehn/DotFiles/master/zshrc > "$HOME"/.zshrc

echo
echo "Installation complete."
echo "If zsh is not your current default shell, and you want it to be,"
echo "run the following:"
echo "    chsh -s $(which zsh)"
echo "Then, to switch to it, run:"
echo "    $(which zsh)"
echo
echo "If you are already running zsh, and you want to start using your"
echo "new configuration, either logout and back in, or run:"
echo "    source ~/.zshrc"
echo
