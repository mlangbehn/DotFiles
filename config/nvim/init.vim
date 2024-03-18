" vim: set ts=4 sw=4 expandtab:

" Default stuff...figure this out later...
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" Fix Python3 issues
let g:loaded_python_provider = 0
let g:python3_host_prog = '/usr/local/bin/python3'
set pyxversion=3

" Source old .vimrc
source ~/.vimrc
