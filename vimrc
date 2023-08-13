vim9script

const is_win = has('win32')

$v = $HOME .. (is_win ? '\vimfiles' : '/.vim')
$VIMRC = $v .. '/vimrc'

def Source(file: string)
  execute $'source $v/{file}.vim'
enddef


# clear double configuration !nb!
if exists('#vimrc')
  augroup vimrc
    autocmd!
  augroup END
  augroup! vimrc
endif

Source('setting')
Source('pack')
Source('keymap')
