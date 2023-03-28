# Loaded only once for login shells.

##############################
# loading files
##############################
for file in ~/.{aliases,exports}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"
