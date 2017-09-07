##############################
# environment variable
##############################
# Character code
export LANG=en_US.UTF-8
# export LANG=ja_JP.UTF-8
# PATH
export PATH=/usr/local/opt/openssl/bin:$PATH
export PATH=/usr/local/opt/openssh/bin:$PATH
export PATH="~/.composer/vendor/bin:$PATH"

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
PROMPT="%{${fg[blue]}%}[%n@%m]%{${reset_color}%} %~
%# "


##############################
# command alias
##############################
if [ -r .aliases ] && [ -f .aliases ] ; then
	source .aliases
fi


##############################
# color scheme
##############################

# Cygwin with Windows
# @see https://github.com/altercation/solarized
# 1. In any directory git clone.
# 2. Set the this file path.
COLORSCHEME_FILE="${HOME}/src/github.com/mavnn/mintty-colors-solarized/sol.dark"
if [ -r $COLORSCHEME_FILE ] && [ -f $COLORSCHEME_FILE ] ; then 
	source $COLORSCHEME_FILE
fi

# Mac OSX
# @see https://github.com/tomislav/osx-terminal.app-colors-solarized
# 1. In any directory git clone.
# 2. Open Terminal.app > Environment Settings > Settings > Gear Button > Import
# 3. Select theme file in cloned directory.


#############################
# tmux settings
##############################
if [ -z $TMUX ] && [ -z $VSCODE_PID ] ; then
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

# History
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

