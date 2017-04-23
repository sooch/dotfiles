# command alias
alias ..='cd ..'
alias ll='ls -al'
alias cp="cp -i"
alias mv="mv -i"
alias grep="grep --color"

# export enviroment path
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH=$PATH:"$ANDROID_HOME/platform-tools"
