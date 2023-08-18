vim9script

# todo: win support

const minpac_dir = $v .. '/pack/minpac/opt/minpac'
if !isdirectory(minpac_dir)
  silent! execute printf('!git clone https://github.com/k-takata/minpac.git %s', minpac_dir)
endif

# g:plugpac_plugin_config_path: Folder for plugin config. For example, if its
#   value is ~/.vim/plugin_config, config file for dense-analysis/ale would be
#   ~/.vim/plugin_config/ale.vim. If you want it to be sourced before the plugin
#   is loaded, prefix the file name with pre-, e.g. pre-ale.vim.
# g:plugpac_default_type: type option default value for plugin. Possible
#   values are start, opt, delay. Default is start.
g:plugpac_plugin_conf_path = $v .. '/rc'
g:plugpac_default_type = 'delay'

# plugins [[[1
plugpac#Begin({
  status_open: 'vertical',
  verbose: 2,
})

# Opt plugins [[[2
Pack 'k-takata/minpac', {'type': 'opt'}
# ]]]

# Start plugins [[[2
Pack 'vim-python/python-syntax', { 'type': 'start' }
Pack 'lifepillar/vim-gruvbox8', { 'type': 'start' }
Pack 'tomtom/tcomment_vim', { 'type': 'start' }
Pack 'Eliot00/auto-pairs', { 'type': 'start' }
Pack 'github/copilot.vim', { 'type': 'start' }
# 如果文件类型是markdown，那么就使用vim-markdown-preview插件
# 不要使用&filetype == 'markdown'，因为这个时候filetype还没有被设置
Pack 'godlygeek/tabular', { 'type': 'start' }
Pack 'preservim/vim-markdown', { 'type': 'start' }
Pack 'dkarter/bullets.vim', { 'type': 'start' }
Pack 'junegunn/vim-peekaboo', { 'type': 'start' }
Pack 'sheerun/vim-polyglot', { 'type': 'start' }
# ]]]


Pack 'junegunn/fzf', { 'delay': 1000 }
Pack 'junegunn/fzf.vim'
Pack 'rlue/vim-barbaric'
Pack 'yegappan/lsp'
Pack 'tpope/vim-surround', { 'type': 'delay' }
# Pack 'skywind3000/vim-terminal-help', { 'type': 'delay' }
Pack 'honza/vim-snippets'
Pack 'SirVer/ultisnips'
# post install (yarn install | npm install) then load plugin only for editing supported files
Pack 'prettier/vim-prettier', {
  \ 'do': '!yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
plugpac#End()

# ]]]

# plugpac helpers [[[1
def PackList(A: string, ...args: list<any>): list<string>
  plugpac#Init()
  const pluglist = minpac#getpluglist()->keys()->sort()
  return pluglist->Utils.Matchfuzzy(A)
enddef

command! -nargs=1 -complete=customlist,PackList
      \ PackUrl call plugpac#Init() | call openbrowser#open(
      \    minpac#getpluginfo(<q-args>).url)

command! -nargs=1 -complete=customlist,PackList
      \ PackDir call plugpac#Init() | execute 'edit ' .. minpac#getpluginfo(<q-args>).dir

command! -nargs=1 -complete=customlist,PackList
      \ PackRc call plugpac#Init() | execute 'edit ' ..
      \ g:plugpac_plugin_conf_path .. '/' ..
      \ substitute(minpac#getpluginfo(<q-args>).name, '\.n\?vim$', '', '') .. '.vim'

command! -nargs=1 -complete=customlist,PackList
      \ PackRcPre call plugpac#Init() | execute 'edit ' ..
      \ g:plugpac_plugin_conf_path .. '/pre-' ..
      \ substitute(minpac#getpluginfo(<q-args>).name, '\.n\?vim$', '', '') .. '.vim'
# ]]]
