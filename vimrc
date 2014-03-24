""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                              "
"                                                                              "
"                     A simple vim Configuration File                          "
"                                                                              "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set vi incompatible mode
" (must be set before any other options)
set nocompatible


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                              "
"                            Text Formatting                                   "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Number of spaces that [TAB] inserts
set tabstop=4

" Number of spaces that are used for each auto indent
set shiftwidth=4

" Expand [TAB] to the equivalent number of spaces
" If a literal tab is preferred, use CTRL-V [TAB]
set expandtab

" When in front of a line, insert space according to shift width,
" rather than tab stop
set smarttab

" Indent to the same level as the previous line
set autoindent

" Lines should be wrapped at 80 columns
set textwidth=80

" Show matching brackets
set showmatch
" Show match for 2 tenths of a second
set mat=2

" Enable file type plug-ins
filetype plugin on
filetype indent on

" Use UTF-8 encoding
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

" Enable spell checking
set spell

" Always keep 3 lines above and below the cursor
set scrolloff=3

" Backspace and cursor movements should wrap between lines
set whichwrap=b,s,h,l,<,>,[,]


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                              "
"                              Search Settings                                 "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Highlight results
set hlsearch

" Ignore case
set ignorecase

" Incremental search -- search as you type
set incsearch

" Try to be smart about case
set smartcase


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                              "
"                           Whitespace Control                                 "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Create the pattern "ExtraWhitespace" and set its highlight color to red
highlight ExtraWhitespace ctermbg=red guibg=red

" Search for whitespace at the end of lines
match ExtraWhitespace /\s\+$/

" When opening a new buffer, search for whitespace at the end of lines
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

" Search for whitespace at the end of lines when entering insert mode
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/

" Search for whitespace at the end of lines when leaving insert mode
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

" Added to avoid performance issues due to repeated matching
autocmd BufWinLeave * call clearmatches()
