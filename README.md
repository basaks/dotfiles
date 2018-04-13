# dotfiles


## How to install vim plugins

1. Copy `vimrc` into `$HOME/.vimrc`.
2. Clone `Vundle`:
```
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
3. Fire up `VIM` and do `:PluginInstall`
4. Setup `YouCompleteME`:
```                                                                             
cd ~/.vim/bundle/YouCompleteMe/                                                 
git submodule update --init --recursive                                         
python install.py                                                               
``` 
