----------------------------------------------------------------------------------------------------
--functions
local function path_option()
    if vim.o.columns > 89 then
        return 1
    else
        return 0
    end
end

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

----------------------------------------------------------------------------------------------------
--default setting
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

----------------------------------------------------------------------------------------------------
--keymap
--括弧の自動補完
vim.keymap.set('i', '{', '{}<LEFT>')
vim.keymap.set('i', '[', '[]<LEFT>')
vim.keymap.set('i', '(', '()<LEFT>')
vim.keymap.set('i', '"', '""<LEFT>')
vim.keymap.set('i', '\'', '\'\'<LEFT>')

--補完機能の設定()
--https://note.com/yasukotelin/n/na87dc604e042
vim.keymap.set('i', '<S-Tab>', '<C-p>')
vim.keymap.set('i', '<expr><CR>', 'pumvisible() ? "<C-y>" : "<CR>"')
vim.keymap.set('i', '<expr><C-n>', 'pumvisible() ? "<Down>" : "<C-n>"')
vim.keymap.set('i', '<expr><C-p>', 'pumvisible() ? "<Up>" : "<C-p>"')

--表示行移動
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', '<Down>', 'gj')
vim.keymap.set('n', '<Up>', 'gk')
--論理行移動
vim.keymap.set('n', 'gj', 'j')
vim.keymap.set('n', 'gk', 'k')

--esc2回押しでハイライト解除
vim.keymap.set('n', '<ESC><ESC>', '<cmd>noh<CR>')

--ターミナルを水平分割で開くコマンドを定義
vim.keymap.set('n', 'tx', '<cmd>belowright new<CR><cmd>terminal<CR>')

--ターミナルモード中にescでノーマルモードに移行
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')

--エンター二回連打でバッファ切り替え
vim.keymap.set('n', '<CR><CR>', '<C-w><C-w>')

--コマンドラインモードの補完で矢印キーで上下移動
vim.keymap.set('i', '<expr><Left>', 'wildmenuidx() ? "<Up>" : "<Left>"')
vim.keymap.set('i', '<expr><Right>', 'wildmenuidx() ? "<Down>" : "<Right>"')

----------------------------------------------------------------------------------------------------
--opt
--特殊文字表示
vim.opt.listchars = 'tab:| ,trail:-,eol:↲,extends:»,precedes:«'
vim.opt.list = true

--大文字小文字を無視して検索
vim.opt.ignorecase = true

--行番号
vim.opt.number = true
vim.opt.relativenumber = true

--行末まで検索した後行頭に戻って検索
vim.opt.wrapscan = true

--インデント周りの設定
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true

vim.opt.encoding = 'utf-8'
vim.opt.fileencodings = 'utf-8', 'sjis'

--無名のレジスタとクリップボードを結合
vim.opt.clipboard:append({ "unnamedplus" })

--ファイルの補完メソッド
--vim.opt.wildmode = 'longest','full'

--インサートモードのカーソルを下線に変更
vim.opt.guicursor = 'i-ci:hor20'

--日本語の括弧もハイライト
vim.opt.matchpairs:append({'（:）','「:」', '『:』', '【:】', '［:］', '＜:＞'})

--行の折り折り返し
vim.opt.wrap = false

--スワップファイルを生成しない
vim.opt.swapfile = false

vim.opt.cursorline = true

--補完の設定
--https://note.com/yasukotelin/n/na87dc604e042
vim.opt.completeopt= 'menuone,noinsert'

--true color
vim.opt.termguicolors = true

vim.opt.wildmenu = true

----------------------------------------------------------------------------------------------------
--autocmd
--インサートモードを変えた時にIMEを自動でオフ
vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
    pattern = '*',
    command = ':call system(\'zenhan 0\')',
})
vim.api.nvim_create_autocmd({ 'CmdlineLeave' }, {
    pattern = '*',
    command = ':call system(\'zenhan 0\')',
})

--ターミナルを開いたときに自動でインサートモード
vim.api.nvim_create_autocmd({ 'TermOpen' }, {
  pattern = '*',
  command = 'startinsert',
})

--ターミナルで行番号を非表示
vim.api.nvim_create_autocmd({ 'TermOpen' }, {
    pattern = '*',
    command = 'setlocal norelativenumber',
})
vim.api.nvim_create_autocmd({ 'TermOpen' }, {
    pattern = '*',
    command = 'setlocal nonumber',
})

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
	-- add your plugins here
	{
	    'sainnhe/sonokai',
	    lazy = false,
	    priority = 1000,
	    config = function()
		vim.cmd([[colorscheme sonokai]])
	    end,
	},
	{
	    'IMOKURI/line-number-interval.nvim',
	    lazy = false,
	    priority = 500,
	    init = function()
		vim.g.line_number_interval_enable_at_startup = 1
		vim.g['line_number_interval#use_custom'] = 1
		vim.g['line_number_interval#custom_interval'] = {1,2,3,4,5,10,20,30,40,50,60,70,80,90}
		vim.cmd[[
		    highlight HighlightedLineNr ctermfg=white
		    highlight DimLineNr ctermfg=238
		    highlight HighlightedLineNr1 ctermfg=125
		    highlight HighlightedLineNr2 ctermfg=178
		    highlight HighlightedLineNr3 ctermfg=254
		    highlight HighlightedLineNr4 ctermfg=44
		    highlight HighlightedLineNr5 ctermfg=26
		]]
	    end,
	},
	{
	    'vim-jp/vimdoc-ja',
	    lazy = true,
	    keys = {
		{ "h", mode = "c", },
	    },
	},
	{
	    'nvim-lualine/lualine.nvim',
	    dependencies = { 'nvim-tree/nvim-web-devicons' },
	    opts = {
		options = {
		    theme = 'horizon',
		    icons_enabled = true,
		    component_separators = { left = '', right = ''},
		    section_separators = { left = '', right = ''},
		    disabled_filetypes = {
		        statusline = {},
		        winbar = {},
		    },
		    ignore_focus = {},
		    always_divide_middle = true,
		    globalstatus = false,
		    refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		    },
		},
		sections = {
		    lualine_a = {'mode'},
		    lualine_b = {'branch', 'diff', 'diagnostics'},
		    lualine_c = {{'filename', path = path_option()}},
		    lualine_x = {'encoding', 'fileformat', 'filetype'},
		    lualine_y = {'progress'},
		    lualine_z = {'location'}
		},
		inactive_sections = {
		    lualine_a = {},
		    lualine_b = {},
		    lualine_c = {'filename'},
		    lualine_x = {'location'},
		    lualine_y = {},
		    lualine_z = {}
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {}
	    },
	},
    },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

----------------------------------------------------------------------------------------------------
--highlight
--背景透過
vim.cmd[[
    highlight CursorLine    ctermbg=237	    cterm=NONE
    highlight Normal	    ctermbg=NONE    guibg=NONE
    highlight NonText	    ctermbg=NONE    guibg=NONE
    highlight LineNr	    ctermbg=NONE    guibg=NONE
    highlight Folded	    ctermbg=NONE    guibg=NONE
    highlight EndOfBuffer   ctermbg=NONE    guibg=NONE
]]

--行番号をいい感じに表示
vim.cmd[[
    highlight CursorLineNr	    ctermfg=161	    guifg=#e24775
    highlight HighlightedLineNr	    ctermfg=white   guifg=#f3fbff
    highlight DimLineNr		    ctermfg=238	    guifg=#5d595c
    highlight HighlightedLineNr1    ctermfg=172	    guifg=#fdae46
    highlight HighlightedLineNr2    ctermfg=220	    guifg=#f1d026
    highlight HighlightedLineNr3    ctermfg=254	    guifg=#b0e48d
    highlight HighlightedLineNr4    ctermfg=84	    guifg=#00d3a6
    highlight HighlightedLineNr5    ctermfg=33	    guifg=#2eacd8
]]
vim.g['did_install_default_menus'] = 1
vim.g['did_install_syntax_menu']   = 1
vim.g['did_indent_on']             = 1
vim.g['did_load_filetypes']        = 1
vim.g['did_load_ftplugin']         = 1
vim.g['loaded_2html_plugin']       = 1
vim.g['loaded_gzip']               = 1
vim.g['loaded_man']                = 1
vim.g['loaded_matchit']            = 1
vim.g['loaded_matchparen']         = 1
vim.g['loaded_netrwPlugin']        = 1
vim.g['loaded_remote_plugins']     = 1
vim.g['loaded_shada_plugin']       = 1
vim.g['loaded_spellfile_plugin']   = 1
vim.g['loaded_tarPlugin']          = 1
vim.g['loaded_tutor_mode_plugin']  = 1
vim.g['loaded_zipPlugin']          = 1
vim.g['skip_loading_mswin']        = 1
