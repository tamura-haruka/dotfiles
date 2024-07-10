"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('$HOME/.cache/dein')

" Let dein manage dein
" Required:
call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')

" Required:
call dein#end()

" Required:
filetype on
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

""++++++++++++++++++++++++++++++++++++++++++++++++++
""新しいプラグインをインストール
"
"" dein.vim settings {{{
"" install dir {{{
"let s:dein_dir = expand('~/.cache/dein')
"let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
"" }}}
"
"" dein installation check {{{
"if &runtimepath !~# '/dein.vim'
"  if !isdirectory(s:dein_repo_dir)
"    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
"  endif
"  execute 'set runtimepath^=' . s:dein_repo_dir
"endif
"" }}}
"
"" begin settings {{{
"if dein#load_state(s:dein_dir)
"  call dein#begin(s:dein_dir)
"
"  " .toml file
"  let s:rc_dir = expand('~/.vim')
"  if !isdirectory(s:rc_dir)
"    call mkdir(s:rc_dir, 'p')
"  endif
"  let s:toml = s:rc_dir . '/dein.toml'
"
"  " read toml and cache
"  call dein#load_toml(s:toml, {'lazy': 0})
"
"  " end settings
"  call dein#end()
"  call dein#save_state()
"endif
"" }}}
"
"" plugin installation check {{{
"if dein#check_install()
"  call dein#install()
"endif
"" }}}
"
"" plugin remove check {{{
"let s:removed_plugins = dein#check_clean()
"if len(s:removed_plugins) > 0
"  call map(s:removed_plugins,"delete(v:val, 'rf')")
"  call dein#recache_runtimepath()
"endif
"" }}}
"
""++++++++++++++++++++++++++++++++++++++++++++++++++

"zenhan---------------------------------------------------------------------
"インサートモードとコマンドモードを抜けたらIMEをオフ
if executable('zenhan')
autocmd InsertLeave * :call system('zenhan 0')
autocmd CmdlineLeave * :call system('zenhan 0')
endif

"-----------------------------------------------------------------------
"括弧の自動補完
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

"-----------------------------------------------------------------------
"補完機能の設定
"https://note.com/yasukotelin/n/na87dc604e042
inoremap <S-Tab> <C-p>
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"
set completeopt=menuone,noinsert
inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>"

"----------------------------------------------------------------------
"表示行移動
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
"論理行移動
nnoremap gj j
nnoremap gk k

"----------------------------------------------------------------------
"esc2回押しでハイライト解除
nnoremap <ESC><ESC> :noh<CR>

"-----------------------------------------------------------------------
"特殊文字の可視化
set listchars=tab:>-,trail:-,eol:↲,extends:»,precedes:«
set list

"-----------------------------------------------------------------------
"カラースキームの設定
"!
colo gotham

hi CursorLine ctermbg=237

hi texInputFile ctermfg=15 cterm=underline
hi texCmdArgs ctermfg=2
hi texRefZone ctermfg=80 cterm=italic
hi mathoftex ctermfg=9 cterm=italic
hi texTypeStyle ctermfg=5
hi Visual ctermbg=23
hi verbdoller ctermfg=220 cterm=bold

hi markdownH1 ctermfg=white
hi markdownH2 ctermfg=white cterm=underline
hi markdownH3 ctermfg=white
hi markdownH4 ctermfg=white
hi markdownH5 ctermfg=white
hi markdownH6 ctermfg=white
hi markdownH1Delimiter ctermfg=196
hi markdownH2Delimiter ctermfg=196 cterm=underline
hi markdownBold ctermfg=220
hi markdownStrike ctermfg=86
hi markdownBlockquote ctermfg=172
hi markdownListMarker ctermfg=33
hi markdownOrderedListMarker ctermfg=114
hi markdownCode ctermfg=white ctermbg=235
hi markdownCodeDelimiter ctermfg=51 ctermbg=236
hi markdownCodeBlock ctermfg=white ctermbg=235
hi markdownUrl ctermfg=39 cterm=underline
hi markdownLinkText ctermfg=white
hi markdownLinkTextDelimiter ctermfg=87
hi markdownEscape ctermfg=99
hi markdownFootnote ctermfg=172
hi markdownFootnoteDefinition ctermfg=172
hi markdownRule ctermfg=40
hi yamlPlainScalar ctermfg=white

"----------------------------------------------------------------------
"大文字小文字を無視して検索
set ignorecase

"----------------------------------------------------------------------
"ターミナルを開いたら常にinsertモードに入る
autocmd TermOpen * :startinsert

"---------------------------------------------------------------------
"行番号を表示
set number

"---------------------------------------------------------------------
"相対行番号を表示
set relativenumber

"---------------------------------------------------------------------
"シンタックスハイライトをon
syntax on

"---------------------------------------------------------------------
"行末まで検索した後行頭に戻って検索
set wrapscan

"---------------------------------------------------------------------
"検索結果をハイライト表示(:nohで消す)
set showmatch

"---------------------------------------------------------------------
"tabキーで挿入されるスペースの数
set shiftwidth=4

"---------------------------------------------------------------------
"中括弧を始めた後などの改行のあと自動的にインデントを入れる
set smartindent

"---------------------------------------------------------------------
"インデント周りの各種機能で操作されるスペースの数
set softtabstop=4

"---------------------------------------------------------------------
"VimではUTF-8で文字を表示する
set encoding=utf-8

"---------------------------------------------------------------------
"UTF-8でファイルを読み込み、ダメだったらShift_JISを試す
set fileencodings=utf-8,sjis

"---------------------------------------------------------------------
"UTF-8でファイルを書き込む
set fileencodings=utf-8

"---------------------------------------------------------------------
"クリップボードとVimの無名レジスタを結合する
set clipboard+=unnamed

"---------------------------------------------------------------------
"コマンドモードでtabを使ってファイル名を補完するときに、1回目は最大共通文字列、次からは順番にファイル名を完全補完する
set wildmode=longest,full

"---------------------------------------------------------------------
if has('nvim')
    "ターミナルを水平分割で開くコマンドを定義
    nnoremap <silent> tx <cmd>belowright new<CR><cmd>terminal<CR>

    "ターミナルモードで行番号を非表示
    autocmd TermOpen * setlocal norelativenumber
    autocmd TermOpen * setlocal nonumber
endif

"---------------------------------------------------------------------
"ターミナルモード中にEscでターミナルノーマルモードに移行
tnoremap <Esc> <C-\><C-n>

"---------------------------------------------------------------------
nnoremap <CR><CR> <c-w><c-w>

"---------------------------------------------------------------------
"vimでテンキーを使えるようにする
"!
if &term =~ "xterm" || &term =~ "screen" || &term =~ "vt100"
    " Disable appkeypad
    let &t_ks = "\e[?1h"
endif

"---------------------------------------------------------------------
"デフォルトのターミナルをpowershellに設定
"set shell=powershell
"set shellcmdflag=-command
"set shellquote=\"

""---------------------------------------------------------------------
""カーソルをアンダースコアに変更
set guicursor=i-ci:hor20

"---------------------------------------------------------------------
"日本語の括弧もハイライトする
set matchpairs+=（:）,「:」,『:』,【:】,［:］,＜:＞

"---------------------------------------------------------------------
"行の折り返し無効化
set nowrap

"---------------------------------------------------------------------
"スワップファイルを作らない
set noswapfile

"---------------------------------------------------------------------
"マッチする括弧のハイライトの色の設定
"!
hi MatchParen ctermfg=black ctermbg=50
hi MatchParen guibg=DarkSlateGray1

"---------------------------------------------------------------------
"検索時のハイライトの色の設定
"!
hi Search ctermfg=0 ctermbg=15
hi CurSearch ctermfg=0 ctermbg=15

"---------------------------------------------------------------------
"コマンドの補完時の色の設定
"!
hi Pmenu ctermfg=250 ctermbg=235
hi PmenuSel ctermfg=37 ctermbg=235
hi PmenuSbar ctermbg=240
hi PmenuThumb ctermbg=250

"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"Plugins

"lightline.vim---------------------------------------------------------------------
"ステータスラインの設定
let g:lightline = {
     \ 'colorscheme': 'goldfish',
     \ 'active': {
     \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'iuiu', 'modified' ] ],
     \ },
     \ 'component_function': {
     \ 'iuiu': 'AbsolutePath'
     \}
     \}
function! AbsolutePath()
  if winwidth(0) > 150
    return expand("%:p")
  else
    return expand("%")
  endif
endfunction

"NERDTree---------------------------------------------------------------------
"nerdtree
call dein#add('preservim/nerdtree')
"autocmd VimEnter * execute 'NERDTree'

"nerdtree以外のバッファを閉じると自動でnerdtreeも閉じる
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"nerdtreeで非表示のファイルをデフォルトで表示
let NERDTreeShowHidden = 1

hi Directory guifg=gray50

"line-number-interval.nvim--------------------------------------------------
"行番号の表示をいい感じにする
" Highlight cursorline number
hi CursorLineNr ctermfg=1
hi LineNr ctermfg=238

" Enable line number interval at startup. (default: 0(disable))
let g:line_number_interval_enable_at_startup = 1

" Set color to highlight and dim.
" (default: HighlightedLineNr use LineNr color,
"           DimLineNr use same as background color (it seems hide).)
highlight HighlightedLineNr ctermfg=White
highlight DimLineNr ctermfg=238

" Enable to use custom interval. (default: 0(disable))
" If this option is enabled, highlight for relative position of cursor position.
let g:line_number_interval#use_custom = 1

" Set custom interval list.
" Relative position to highlight.
let g:line_number_interval#custom_interval = [1,2,3,4,5,10,20,30,40,50,60,70,80,90]

" Additional highlight
" Use those colors for Nth (1st ~ 9th) element of custom interval.
highlight HighlightedLineNr1 ctermfg=125
highlight HighlightedLineNr2 ctermfg=178
highlight HighlightedLineNr3 ctermfg=154
highlight HighlightedLineNr4 ctermfg=44
highlight HighlightedLineNr5 ctermfg=26

set cursorline
hi LineNr ctermfg=238
hi CursorLineNr ctermfg=1

"vimdoc-ja-----------------------------------------------------------------------
"ヘルプを日本語化
call dein#add('vim-jp/vimdoc-ja')
set helplang=ja

autocmd InsertLeave set iminsert=0
autocmd CmdlineLeave set iminsert=0

"nvim-treesitter-----------------------------------------------------------------------
"構文解析
"lua <<EOF
"require'nvim-treesitter.configs'.setup {
"  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
"  highlight = {
"    enable = true,              -- false will disable the whole extension
"    disable = {},  -- list of language that will be disabled
"  },
"}
"EOF

"snipmate-----------------------------------------------------------------------
let g:snipMate = {'snippet_version':1}

"carbonpapaer-----------------------------------------------------------------------
let g:carbonpaper#colorscheme          = 'PaperColor'
let g:carbonpaper#background           = 'light'
let g:carbonpaper#set_background_color = 0
let g:carbonpaper#highlight_bold       = 1
