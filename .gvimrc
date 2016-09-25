" Lang & Encoding {{{
set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936
set encoding=utf-8
set langmenu=zh_CN
let $LANG = 'en_US.UTF-8'
"language messages zh_CN.UTF-8
" }}}

" GUI {{{
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set cursorline
set hlsearch
set number
let g:Powerline_colorscheme='one'
set nowrap


if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


set background=dark " for the dark version
" set background=light " for the light version
colorscheme one
" 窗口大小
set lines=50 columns=80
" 分割出来的窗口位于当前窗口下边/右边
set splitbelow
set splitright
" 使用内置 tab 样式而不是 gui
set guioptions-=e
set nolist
" set listchars=tab:▶\ ,eol:¬,trail:·,extends:>,precedes:<
" set guifont=mononoki:h16
" }}}

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

set guifont=mononoki\ 16

