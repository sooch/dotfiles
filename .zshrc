##############################
# environment variable
##############################
export LANG=ja_JP.UTF-8

##############################
# autoloads
##############################
# enable color
autoload -Uz colors
colors
# auto complete
autoload -Uz compinit
compinit

##############################
# prompt
##############################
# two-lines 1:out pwd 2:input command
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

# clipboard 'C'
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi

##############################
# color scheme
##############################
# solarized dark @see https://github.com/altercation/solarized
source /usr/lib/sol.dark

if [ -z $TMUX ]; then
  if $(tmux has-session 2> /dev/null); then
    tmux -2 attach
  else
    tmux -2
  fi
fi