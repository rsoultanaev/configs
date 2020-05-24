# Set prompt to display current dir
PS1="\${PWD}\$ "

# Set the editor to nvim
export VISUAL=nvim
export EDITOR=${VISUAL}

# Import aliases from ~/.bash_aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Set history size
HISTSIZE=100000
HISTFILESIZE=100000

# App installation dirs
export APPS_DIR=~/opt/apps
export APPS_BIN_DIR=~/opt/bin
export PATH=${PATH}:${APPS_BIN_DIR}
