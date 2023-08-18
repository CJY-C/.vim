vim9script

# Setting [[[1
const is_tty = !match(&term, 'linux')
# general settings [[[2

# indent settings [[[3
set autoindent
# set cinoptions=>2,l1,p0,)50,*50,t0
# # Don't mess with 'tabstop', with 'expandtab' it isn't used.
# # Instead set softtabstop=-1, then 'shiftwidth' is used.
# set smarttab expandtab shiftwidth=4 softtabstop=-1
# # display settings [[[3
# # set display=lastline
# set laststatus=2
# set list
# set modeline
# set modelines=1
# set nostartofline
# set numberwidth=1
# set shortmess=aoOTIc
# set showcmd
# set showmatch
# set matchtime=0
# set showmode
#
# set fileencoding=utf-8
# set fileencodings=ucs-bom,utf-8,utf-16le,gbk,gb18030,gb2312,cp936,usc-bom,euc-jp
# set encoding=utf-8
# scriptencoding utf-8
#
# if !is_tty
#   if has('multi_byte') && &encoding ==# 'utf-8'
#     &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
#     &fillchars = 'diff: '  # ▚
#     &showbreak = '↳ '
#     highlight VertSplit ctermfg=242
#     augroup vimrc
#       autocmd InsertEnter * set listchars-=trail:⣿
#       autocmd InsertLeave * set listchars+=trail:⣿
#     augroup END
#   else
#     &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
#     #let &fillchars = 'stlnc:#'
#     &showbreak = '-> '
#     augroup vimrc
#       autocmd InsertEnter * set listchars-=trail:.
#       autocmd InsertLeave * set listchars+=trail:.
#     augroup END
#   endif
# endif

# 开启鼠标控制
set mouse=a

set encoding=utf-8
set nocompatible
set number relativenumber
set hidden
set incsearch hlsearch
set path+=$PWD/**
set nocp
filetype plugin on
set timeout timeoutlen=1000 ttimeoutlen=0
set clipboard=unnamed
# set undodir=~/.vim/undos
# set undofile
set nrformats+=alpha

# set updatecount=100
set undofile
$vimtmp = $HOME .. '/.config/vimtmp/'
for tmp in ['backup', 'swap', 'undo', 'info']
  call mkdir($vimtmp .. tmp, 'p')
endfor

set backupdir=$vimtmp/backup/
set directory=$vimtmp/swap/
set undodir=$vimtmp/undo/
set viminfo='100,n$vimtmp/info/viminfo

syntax on

set autoindent
set cinoptions=>2,l1,p0,)50,*50,t0
# Don't mess with 'tabstop', with 'expandtab' it isn't used.
# Instead set softtabstop=-1, then 'shiftwidth' is used.
set smarttab expandtab shiftwidth=4 softtabstop=-1

colorscheme gruvbox8

# ]]]
# ]]]
