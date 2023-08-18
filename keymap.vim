"vim9script

" Key Mapping [[[1

nnoremap <buffer> <expr> Q    peekaboo#peek(v:count1, '@', 0)
" nnoremap <silent> Q @peekaboo#peek(v:count1, '@', 0)

nnoremap <C-c> :noh<return><C-c>
nnoremap <S-y> "+y

inoremap <C-c> <esc>
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>
inoremap <CR> <C-g>u<CR>

vnoremap <S-y> "+y

" keymaps for fzf
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>w :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>

" keymaps lsp
" 如果当前文件类型是python则激活下面的nmap

inoremap <silent> <C-l> <C-o>:LspShowSignature<CR>
nnoremap <silent> <C-l> :LspPeekDefinition<CR>
nnoremap <silent> <C-]> :LspGotoDefinition<CR>
nnoremap <silent> <C-q> :LspHover<CR>

function! ScrollPopup(nlines)
    let winids = popup_list()
    if len(winids) == 0
        return
    endif

    " Ignore hidden popups
    let prop = popup_getpos(winids[0])
    if prop.visible != 1
        return
    endif

    let firstline = prop.firstline + a:nlines
    let buf_lastline = str2nr(trim(win_execute(winids[0], "echo line('$')")))
    if firstline < 1
        let firstline = 1
    elseif prop.lastline + a:nlines > buf_lastline
        let firstline = buf_lastline + prop.firstline - prop.lastline
    endif

    call popup_setoptions(winids[0], {'firstline': firstline})
endfunction

nnoremap <silent> <C-j> :call ScrollPopup(3)<CR>
nnoremap <silent> <C-k> :call ScrollPopup(-3)<CR>

" 修改Terminal的所有和alt相关的按键，和原来的alt按键一样
" tnoremap <silent> <M-[> <C-[>
" tnoremap <silent> <M-]> <C-[>
" tnoremap <silent> <M-;> <C-[>
" tnoremap <silent> <M-0> <C-[>0
" tnoremap <silent> <M-a> <C-[>a
" tnoremap <silent> <M-b> <C-[>b

inoremap <silent> {<CR> {<CR>}<C-o>O
"
" ]]]
