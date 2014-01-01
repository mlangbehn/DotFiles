################################################################################
#                                                                              #
#                                                                              #
#                      A Simple zsh Configuration File                         #
#                                                                              #
#                                                                              #
################################################################################

################################################################################
#                                                                              #
#                                 Aliases                                      #
#                                                                              #
################################################################################

# 'ee' should open the default editor
alias ee='$EDITOR'

# Emacs should open in the command line, rather than a new GUI window
alias emacs='emacs -nw'

# grep should always use color
alias grep='grep --color=always'

# ls should always use color
alias ls='ls --color=always'


################################################################################
#                                                                              #
#                             General Settings                                 #
#                                                                              #
################################################################################

# autocd causes zsh to change directory when a path is given without a command
unsetopt autocd

# Enable error beeping
setopt beep

# Use zsh's enhanced globs
setopt extended_glob

# Whenever a command competion is attempted,
# ensure the command path is hashed first
setopt hash_list_all
setopt completeinword

# Display PID when suspending processes
setopt longlistjobs

# Don't warn about backgrounded jobs when exiting
setopt nocheckjobs

# * shouldn't match dotfiles
setopt noglobdots

# Don't send SIGHUP to background processes when the shell exits
setopt nohup

# Unmatched patterns cause an error
setopt nomatch

# Report the status of backgrounded jobs immediately
setopt notify

# Alert if command fails
setopt printexitvalue

# Enable the new completion system
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit


# Report about cpu-/system-/user-time of command if running longer than
# 5 seconds
REPORTTIME=5


################################################################################
#                                                                              #
#                             Changing Directory                               #
#                                                                              #
################################################################################

# Changing directory behaves as pushd
# Run 'ls' after changing directories
DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi
function chpwd() {
    emulate -L zsh
    ls --color=always
    print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

DIRSTACKSIZE=20

# Changing Directories should behave as pushd
setopt autopushd

# Ignore duplicates in the directory stack
setopt pushdignoredups

# Supress output from pushd
setopt pushdsilent


################################################################################
#                                                                              #
#                                 History                                      #
#                                                                              #
################################################################################

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Apend history list to the history file
# Required for share_history
setopt append_history

# Share history between each zsh-session
setopt share_history

# Include extra information in the history file
setopt extended_history

# Avoid duplicate entries in the history file
setopt histignorealldups

# Do not include lines beginning with a space in the history file
# Similar to the way bash functions
setopt histignorespace


################################################################################
#                                                                              #
#                                  Prompt                                      #
#                                                                              #
################################################################################

autoload -U promptinit && promptinit
autoload -U colors && colors
PROMPT="%{$fg[cyan]%}%B[%n@%m %~]%#%b "


################################################################################
#                                                                              #
#                              Spell Checking                                  #
#                                                                              #
################################################################################

setopt correct
SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r?$reset_color ($fg[blue]Y${reset_color}es, $fg[blue]N${reset_color}o, $fg[blue]A${reset_color}bort, $fg[blue]E${reset_color}dit) "


################################################################################
#                                                                              #
#                               Key Bindings                                   #
#                                                                              #
################################################################################

# Use emacs keybindings
bindkey -e

# Enable CTRL + LEFT and CTRL + RIGHT to move cursor word by word
bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;5D' emacs-backward-word

# From the Arch Wiki:
# Create a zkbd compatible hash
# To add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}

key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# Setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

# Verify the terminal is in application mode when zle is active
# Only then are the values from $terminfo valid
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi


# History search
# Pressing [PAGE UP] or [PAGE DOWN] will only show previous commands
# that start the same way
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"    history-beginning-search-backward
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}"  history-beginning-search-forward
