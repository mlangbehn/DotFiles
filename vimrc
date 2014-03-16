""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                              "
"                                                                              "
"                     A simple vim Configuration File                          "
"                                                                              "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                              "
"                            Text Formatting                                   "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Number of spaces that [TAB] inserts
set tabstop=4

" Number of spaces that are used for each autoindent
set shiftwidth=4

" Expand [TAB] to the equivalent number of spaces
" If a litteral tab is preferred, use CTRL-V [TAB]
set expandtab

" When infront of a line, insert space according to shiftwidth,
" rather than tabstop
set smarttab

" Lines should be wrapped at 80 columns
set textwidth=80

" Show matching brackets
set showmatch
" Show match for n tenths of a second
set mat=2

" Enable filetype plugins
filetype plugin on
filetype indent on

" Use UTF8 encoding
set encoding=utf8

" Set Unix as the standard file type
set ffs=unix,dos,mac


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                              "
"                              User Interface                                  "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable

" Configure colors for a dark background
set background=dark

" Automatically read changes made to the file from the outside
set autoread

" Show the cursor position
set ruler


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                              "
"                              Search Settings                                 "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ignore case
set ignorecase

" Try to be smart about case
set smartcase

" Highlight results
set hlsearch

" Incremental search -- search as you type
set incsearch
