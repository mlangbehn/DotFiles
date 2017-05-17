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

" Enable Pathogen
" Easy vim plugin management
execute pathogen#infect()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                              "
"                              Completion System                               "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable Omni Completion
" Requires filetype plugin to be turned on
set omnifunc=syntaxcomplete#Complete

" Set completion system to use the longest common text, and always show a menu
set completeopt=longest,menuone

" Set menu color to grey
:highlight Pmenu ctermbg=grey gui=bold

" Set keys for completion menu
" [ENTER]             = Select
" Arrow Keys          = Scroll through options
" PageUp and PageDown = Jump through options
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" Setup smart tab completion
" This enables accessing the completion menu by pressing [TAB]
function! Smart_TabComplete()
    let line = getline('.')
    let substr = strpart(line, -1, col('.')+1)
    let substr = matchstr(substr, "[^ \t]*$")

    if (strlen(substr)==0)
        return "\<tab>"
    endif

    let has_period = match(substr, '\.') != -1
    let has_slash = match(substr, '\/') != -1

    if (!has_period && !has_slash)
        return "\<C-X>\<C-P>"
    elseif ( has_slash )
        return "\<C-X>\<C-F>"
    else
        return "\<C-X>\<C-O>"
    endif
endfunction

" Bind [TAB] to call Smart_TabComplete()
inoremap <tab> <c-r>=Smart_TabComplete()<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                              "
"                       Previous Session Information                           "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END


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
"                            Text Formatting                                   "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" When in front of a line, insert space according to shift width,
" rather than tab stop
set smarttab

" Set <F3> to toggle paste mode
"   This is to be used when pasting from another application, and
"   prevents autoindent from breaking existing formating.
"   The second line allows this to work while in insert mode.
"   The third like shows the change while in insert mode.
nnoremap <F3> :set invpaste paste?<CR>
set pastetoggle=<F3>
set showmode

" Lines should be soft-wrapped at 80 columns
set wrap
set linebreak
set nolist

" If par is installed, use it to format text
"   use 'gq' to reformat, or 'gw' to use vim's built-in formatter
if executable("par")
    set formatprg=par\ -w72
endif

" Enable file type plug-ins
filetype plugin on
filetype indent on

" Specific filetype settings
autocmd Filetype bash setlocal ts=4 sw=4 expandtab
autocmd Filetype sh setlocal ts=4 sw=4 expandtab

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

" Show line numbers
set number

" Show the cursor position
set ruler

" Enable spell checking by default
"   <F2> will toggle spell checking
set spell
nmap <F2> :set invspell<CR>

" Always keep 3 lines above and below the cursor
set scrolloff=3

" Backspace and cursor movements should wrap between lines
set whichwrap=b,s,h,l,<,>,[,]

" Show matching brackets
set showmatch
" Show match for 2 tenths of a second
set matchtime=2

" Use vim-airline for status bar
set laststatus=2
let g:airline#extensions#tabline#enabled = 1


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

" <F4> removes all trailing whitespace
nnoremap <silent> <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
