##############################
# prompt settings
##############################
# \[\e[0;34m\]DO SOMETHING\[\e[0;0m\]
PS1="\[\e[0;34m\][\u@\h]\[\e[0;0m\] \w
\$ "


##############################
# loading files
##############################
for file in ~/.{aliases,exports}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;


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
# history
##############################
HISTTIMEFORMAT='%Y-%m-%dT%T%z '
HISTSIZE=100000

