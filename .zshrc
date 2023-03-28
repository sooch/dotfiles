# It's only loaded for login shells and interactive shells.

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
PROMPT="%{${fg[blue]}%}[%n@%m]%{${reset_color}%} %~
%# "


##############################
# loading files
##############################
for file in ~/.{aliases,exports}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"


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
# Check tmux command
if type tmux > /dev/null 2>&1 && [ -z $TMUX ]; then
	# VSCode does not start tmux.
	# https://github.com/Microsoft/vscode/commit/9c82ae899c79de07413af7cdbe262dbe4550abd0
	if [ -z "${TERM_PROGRAM}" ] || [ ${TERM_PROGRAM} != "vscode" ]; then
		# check session
		if $(tmux has-session 2> /dev/null); then
			tmux -2 attach
		else
			tmux -2
		fi
  fi
fi


##############################
# zsh settings
##############################

# Emacs style bindings (for Home/End keys...)
bindkey -e

# Compile if .zshrc has been updated.
if [ ~/.zshrc -nt ~/.zshrc.zwc ]; then
	zcompile ~/.zshrc
fi

##############################
# History
##############################
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

