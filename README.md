# Dotfiles
These are my dotfiles.

## Install


```sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

git clone https://github.com/neume/dotfiles.git ~/dotfiles


touch ~/.vimrc

echo 'so ~/dotfiles/vim/vimrc.vim' >> ~/.vimrc
# or
echo 'so ~/dotfiles/vim/mini.vim' >> ~/.vimrc

echo | vim +BundleInstall +qall
```

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

touch ~/.tmux.conf

echo 'source-file ~/dotfiles/tmux/tmux.conf' >> ~/.tmux.conf
# or
echo 'source-file ~/dotfiles/tmux/mini.conf' >> ~/.tmux.conf

~/.tmux/plugins/tpm/scripts/install_plugins.sh

tmux

# To install plugins, type:
# Ctrl+b Shift+I
# or
# Ctrl+a Shift+I
```
