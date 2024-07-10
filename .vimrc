set ignorecase
set number
set relativenumber
syntax on
set wrapscan
set showmatch
set shiftwidth=4
set smartindent
set softtabstop=4
set encoding=utf-8
set clipboard+=unnamed
set mouse=a
nnoremap <CR><CR> <c-w><c-w>
tnoremap <Esc> <C-\><C-n>
inoremap <S-Tab> <C-p>

nnoremap <silent> tx <cmd>bo terminal<CR>
"autocmd TermOpen * setlocal norelativenumber
"autocmd TermOpen * setlocal nonumber

set nowrap
set noswapfile
set nobackup
set nowritebackup
set cursorline
set encoding=utf-8
scriptencoding utf-8

let &t_SI.="\e[6 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[2 q"

inoremap { {}<LEFT>
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

set t_Co=256
set list
set listchars=tab:>-,eol:↲,extends:»,precedes:«,nbsp:%
	hi SpecialKey ctermbg=None ctermfg=232

"plugins======================================================================
"packadd vim-jetpack
"call jetpack#begin()
"Jetpack 'tani/vim-jetpack'
"Jetpack 'markonm/traces.vim'
"Jetpack 'altercation/vim-colors-solarized'
"Jetpack 'vim-python/python-syntax'
"call jetpack#end()
