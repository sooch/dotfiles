##############################
# loading files
##############################
for file in ~/.{aliases,exports}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
