##############################
# environment variable
##############################
# Character code
export LANG=ja_JP.UTF-8
# PATH
export PATH=/usr/local/opt/openssl/bin:$PATH
export PATH=/usr/local/opt/openssh/bin:$PATH


##############################
# autoloads
##############################

# enable color
autoload -Uz colors
colors
# Auto complete
autoload -Uz compinit
compinit


##############################
# prompt settings
##############################
# L1: out pwd 
# L2: input command
PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
%# "


##############################
# command alias
##############################
alias ..='cd ..'
alias ll='ls -al'
alias cp="cp -i"
alias mv="mv -i"
alias grep="grep --color"
alias ssh="ssh -F ~/.ssh/config"
alias gip='curl ipconfig.io'

case ${OSTYPE} in
    darwin*)
        # mac
        ;;
    linux*)
        # linux
        ;;
    cygwin*)
        # cygwin
        alias ipconfig='ipconfig | nkf -w'
        ;;
esac


##############################
# color scheme
##############################

# Cygwin with Windows
# @see https://github.com/altercation/solarized
# 1. In any directory git clone.
# 2. Set the this file path.
source ~/src/github.com/mavnn/mintty-colors-solarized/sol.dark

# Mac OSX
# @see https://github.com/tomislav/osx-terminal.app-colors-solarized
# 1. In any directory git clone.
# 2. Open Terminal.app > Environment Settings > Settings > Gear Button > Import
# 3. Select theme file in cloned directory.


##############################
# tmux settings
##############################
if [ -z $TMUX ]; then
  if $(tmux has-session 2> /dev/null); then
    tmux -2 attach
  else
    tmux -2
  fi
fi


##############################
# zsh settings
##############################

# Compile if .zshrc has been updated.
if [ ~/.zshrc -nt ~/.zshrc.zwc ]; then
  zcompile ~/.zshrc
fi
