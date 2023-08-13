vim9script

# Setting [[[1
const is_tty = !match(&term, 'linux')
# general settings [[[2

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

# ]]]
# ]]]
