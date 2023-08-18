vim9script

# pyright language server
# 	\    args: ['--background-index']
var pythonpath = py3eval("sys.executable")
# echo pythonpath
g:LspAddServer([{
	\    name: 'pyright',
	\    filetype: ['python'],
	\    path: '/usr/bin/pyright-langserver',
 	\    args: ['--stdio'],
        \    workspaceConfig: {
        \      python: {
        \        pythonPath: pythonpath
        \    }}
	\  }])

# html language server
                 # \   path: '/usr/bin/emmet-language-server',
# g:LspAddServer([{name: 'emmet',
#                  \   filetype: 'html',
#                  \   path: '/usr/bin/emmet-language-server',
#                  \   args: ['--stdio'],
#                  \ }])

# typescript/javascript language server
g:LspAddServer([{name: 'deno',
                 \   filetype: ['javascript', 'typescript'],
                 \   path: '/usr/bin/deno',
                 \   args: ['lsp'],
                 \   debug: v:true,
                 \   initializationOptions: {
                 \        enable: v:true,
                 \        lint: v:true
                 \   }
                 \ }])
# markdown language server
# g:LspAddServer([{name: 'vscode-markdown-server',
#                  \   filetype: ['markdown'],
#                  \   path: '/usr/bin/vscode-markdown-language-server',
#                  \   args: ['--stdio'],
#                  \ }])


g:LspOptionsSet({
	\   aleSupport: v:false,
	\   autoComplete: v:true,
	\   autoHighlight: v:false,
	\   autoHighlightDiags: v:true,
	\   autoPopulateDiags: v:false,
	\   completionMatcher: 'case',
	\   completionTextEdit: v:true,
	\   completionKinds: {},
	\   customCompletionKinds: v:false,
	\   diagSignErrorText: 'E>',
	\   diagSignInfoText: 'I>',
	\   diagSignHintText: 'H>',
	\   diagSignWarningText: 'W>',
	\   diagVirtualTextAlign: 'above',
	\   echoSignature: v:false,
	\   hideDisabledCodeActions: v:false,
	\   highlightDiagInline: v:true,
	\   hoverInPreview: v:false,
	\   ignoreMissingServer: v:false,
	\   keepFocusInReferences: v:false,
	\   noNewlineInCompletion: v:false,
	\   outlineOnRight: v:false,
	\   outlineWinSize: 20,
	\   showDiagInBalloon: v:true,
	\   showDiagInPopup: v:true,
	\   showDiagOnStatusLine: v:false,
	\   showDiagWithSign: v:true,
	\   showDiagWithVirtualText: v:false,
	\   showInlayHints: v:false,
	\   showSignature: v:false,
	\   snippetSupport: v:false,
	\   ultisnipsSupport: v:false,
	\   usePopupInCodeAction: v:false,
	\   useQuickfixForLocations: v:false,
	\   useBufferCompletion: v:false,
	\ })
