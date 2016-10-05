" vundle 环境设置
set nocp
set nu
set nofoldenable    " disable folding"
"set backspace=indent,eol,start
set backspace=2
let python_highlight_all=1
syntax on

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'jnurmine/Zenburn'
Plugin 'Lokaltog/vim-powerline'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kshenoy/vim-signature'
Plugin 'majutsushi/tagbar'
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'gcmt/wildfire.vim'
Plugin 'sjl/gundo.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'suan/vim-instant-markdown'
Plugin 'lilydjwg/fcitx.vim'
"Plugin 'jedi-vim'
Bundle 'pbrisbin/vim-mkdir'
Bundle 'scrooloose/syntastic'
Plugin 'rakr/vim-one'
Plugin 'klen/python-mode'
Bundle 'Raimondi/delimitMate'
Plugin 'danro/rename.vim'

" 插件列表结束
call vundle#end()
filetype plugin indent on
filetype plugin on


if has('gui_running')
  set background=light
  colorscheme one 
else
  colorscheme one 
endif

call togglebg#map("<F6>")


" markdown preview
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
"let g:instant_markdown_autostart = 0

" NERD tree
let NERDChristmasTree=0
let NERDTreeWinSize= 20
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
" Automatically open a NERDTree if no files where specified
autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Open a NERDTree
nmap <F4> :NERDTreeToggle<cr>

" font and size
:set guifont=mononoki:14

" Format {{{
au BufNewFile,BufRead *.py
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix
" }}}

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" shortcut
:nnoremap <C-s> :update<CR>
silent !stty -ixon > /dev/null 2>/dev/null
:set clipboard=unnamed
:set clipboard=unnamedplus

" autocomplete
au FileType python let b:delimitMate_nesting_quotes = ['"']
au FileType mail let b:delimitMate_autoclose = 0

" relative number
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber

" mutli cursor
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

set clipboard=unnamedplus
