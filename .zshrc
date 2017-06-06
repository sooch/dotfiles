# environment variable
export LANG=ja_JP.UTF-8

# enable color
autoload -Uz colors
colors

# prompt
# two-lines 1:out pwd 2:input command
PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
%# "

# enable auto complete
autoload -Uz compinit
compinit

# command alias
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
