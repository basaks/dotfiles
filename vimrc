set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'tmhedberg/SimpylFold'

" auto-indentation
Plugin 'vim-scripts/indentpython.vim'

" best thing ever for python
Bundle 'Valloric/YouCompleteMe'

" syntax checking
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'

" colour schemes
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

" git
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" file browsing
Plugin 'scrooloose/nerdtree'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'fholgado/minibufexpl.vim'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Enable folding
set foldmethod=indent
set foldlevel=99


" Enable folding with the spacebar
nnoremap <space> za


" Want to see the docstrings for folded code?
let g:SimpylFold_docstring_preview=1

" PEP8
" Indentation

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix


au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2



"define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred

"Flagging Unnecessary Whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"UTF8 Support
set encoding=utf-8

" The former line ensures that the autocomplete window goes 
" away when you are done with it
" and the latter defines a shortcut for goto definition.
let g:ycm_autoclose_preview_window_after_completion=1
map <F3> :YcmCompleter GoTo<CR>


"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" Finally, make your code look pretty
let python_highlight_all=1
syntax on


if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

call togglebg#map("<F5>")

" show line number
set nu

" nerdtree customizations

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

map <C-n> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" turn on backspace in vim
set backspace=indent,eol,start

" line bar at columnwidth 80
set colorcolumn=80

" set mapleader to a easier typable key
let mapleader = ","


" configure minibuffer
map <C-m> :MBEToggle<CR>


" shift insert in gvim
if has("gui_running")
  map  <silent>  <S-Insert>  "+p
  imap <silent>  <S-Insert>  <Esc>"+pa
endif

" set Monaco font in gvim
set guifont=*                                                                   
if has("gui_running")                                                           
  set guifont=Monaco:h10                                                        
endif
