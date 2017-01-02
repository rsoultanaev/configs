# Set prompt to display current dir
PS1="\${PWD}\$ "

# Set the editor to vim
export VISUAL=vim
export EDITOR=${VISUAL}

# Import aliases from ~/.bash_aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Set history size
HISTSIZE=10000
HISTFILESIZE=10000
