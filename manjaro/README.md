## Manjaro

### Bash

```bash
cat .bashrc >> ~/.bashrc
cp .bash_aliases ~/
```

### Packages

Enable AUR for PAMAC and for `pacman`.

```
tree
tmux
neovim
cmake
```

### Neovim setup

```bash
# Create neovim config dir
mkdir -p ~/.config/nvim

# Copy configs
cp .vimrc ~/
cp init.vim ~/.config/nvim/

# Install Plug
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
     --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall
```
