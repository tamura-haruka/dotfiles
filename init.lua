---@diagnostic disable: undefined-global
vim.g['did_install_default_menus'] = 1
vim.g['did_install_syntax_menu']   = 1
vim.g['loaded_2html_plugin']       = 1
vim.g['loaded_man']                = 1
vim.g['loaded_remote_plugins']     = 1
vim.g['loaded_shada_plugin']       = 1
vim.g['loaded_tutor_mode_plugin']  = 1
vim.g['skip_loading_mswin']        = 1
vim.g['loaded_gzip']              = 1
vim.g['loaded_tar']               = 1
vim.g['loaded_tarPlugin']         = 1
vim.g['loaded_zip']               = 1
vim.g['loaded_zipPlugin']         = 1
vim.g['loaded_rrhelper']          = 1
vim.g['loaded_2html_plugin']      = 1
vim.g['loaded_vimball']           = 1
vim.g['loaded_vimballPlugin']     = 1
vim.g['loaded_getscript']         = 1
vim.g['loaded_getscriptPlugin']   = 1
vim.g['loaded_netrw']             = 1
vim.g['loaded_netrwPlugin']       = 1
vim.g['loaded_netrwSettings']     = 1
vim.g['loaded_netrwFileHandlers'] = 1
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
		    { "\nPress any key to exit..." }
		}, true, {})
	vim.fn.getchar()
	os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

----------------------------------------------------------------------------------------------------
--default setting
vim.g.mapleader = " "
vim.g.maplocalleader = " "

----------------------------------------------------------------------------------------------------
--keymap
--括弧の自動補完
vim.keymap.set('i', '{', '{}<LEFT>')
vim.keymap.set('i', '[', '[]<LEFT>')
vim.keymap.set('i', '(', '()<LEFT>')
vim.keymap.set('i', '"', '""<LEFT>')
vim.keymap.set('i', '\'', '\'\'<LEFT>')
vim.keymap.set('i', '`', '``<LEFT>')

--latexの$の自動補完
vim.api.nvim_create_autocmd("InsertEnter", {
	pattern = "*.tex",
	callback = function()
		vim.keymap.set('i', '$', '$$<LEFT>')
	end
})

--補完機能の設定()
--https://note.com/yasukotelin/n/na87dc604e042
--vim.keymap.set('i', '<S-Tab>', '<C-p>')
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

--ターミナルをフロートウィンドウで開くコマンドを定義
vim.keymap.set('n', 'ta', '<cmd>Lspsaga term_toggle<CR>')

--ターミナルモード中にescでノーマルモードに移行
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')

--エンター二回連打でバッファ切り替え
vim.keymap.set('n', '<CR><CR>', '<C-w><C-w>')

--Yを行末までのヤンクに設定
vim.keymap.set('n', 'Y', 'y$')

--検索時に画面中央
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
vim.keymap.set('n', '*', '*zz')
vim.keymap.set('n', '#', '#zz')

--neorgのlink
vim.keymap.set("n", "<S-CR>", "<Plug>(neorg.esupports.hop.hop-link)", {})

--lsp関連
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ctx)
    local set = vim.keymap.set
    set("n", "gn", "<cmd>lua vim.lsp.buf.rename()<CR>", { buffer = true })
    set("n", "ga", "<cmd>Lspsaga code_action<CR>", { buffer = true })
	set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
	set('n', 'gd', "<cmd>Lspsaga peek_definition<CR>")
	set('n', 'ge', vim.diagnostic.open_float, opts)
	set('n', 'gr', "<cmd>Lspsaga finder<CR>")
	set('n', "[d", "<cmd>lua vim.diagnostic.goto_prev({ float = false })<CR>zz")
	set('n', "]d", "<cmd>lua vim.diagnostic.goto_next({ float = false })<CR>zz")
  end
})

--カーソルをジャンプ前に戻す
vim.keymap.set('n', '<leader>j', '<C-o>')

--copilot chatを開く
vim.keymap.set('n', '<leader>cc', '<cmd>CopilotChat<CR>')

--latexのコンパイル
vim.keymap.set('n', '<leader>lm', '<cmd>!latexmk<CR>')
vim.keymap.set('n', '<leader>lp', '<cmd>!latexmk -pv<CR>')

--vim-translator
vim.keymap.set('n', 'tr', '<Plug>Translate')
vim.keymap.set('v', 'tr', '<Plug>TranslateV')
vim.keymap.set('n', 'tw', '<Plug>TranslateW')
vim.keymap.set('v', 'tw', '<Plug>TranslateWV')

--vsnipの補完時の設定
--https://zenn.dev/block/articles/aed0540e82d88a
--vim.keymap.set({'i', 's'}, '<Tab>', function() return vim.fn['vsnip#available'](1) == 1 and '<Plug>(vsnip-expand-or-jump)' or '<Tab>' end, { expr = true, noremap = false })
vim.keymap.set({'i', 's'}, '<S-Tab>', function() return vim.fn['vsnip#jumpable'](-1) == 1 and '<Plug>(vsnip-jump-prev)' or '<S-Tab>' end, { expr = true, noremap = false })

--gfでurlを開く
vim.keymap.set("n", "gf", function()
  local cfile = vim.fn.expand("<cfile>")
  if cfile:match("^https?://") then
    vim.ui.open(cfile)
  else
    vim.cmd("normal! gF")
  end
end)

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
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
vim.opt.softtabstop = -1
vim.opt.smartindent = true

vim.opt.encoding = 'utf-8'
vim.opt.fileencodings = {'utf-8', 'sjis'}

--無名のレジスタとクリップボードを結合
vim.opt.clipboard:append({ "unnamedplus" })

--ファイルの補完メソッド
vim.opt.wildmode = { "longest", "full" }

--インサートモードのカーソルを下線に変更
vim.opt.guicursor = 'i-ci:hor20'

--日本語の括弧もハイライト
vim.opt.matchpairs:append({'（:）','「:」', '『:』', '【:】', '［:］', '＜:＞'})

--行の折り返し
vim.opt.wrap = false

--スワップファイルを生成しない
vim.opt.swapfile = false

--カーソル行をハイライト
vim.opt.cursorline = true

--補完の設定
--https://note.com/yasukotelin/n/na87dc604e042
vim.opt.completeopt= 'menuone,noinsert'

--true color
vim.opt.termguicolors = true

--コマンドラインの補完候補をメニューのように表示
vim.opt.wildmenu = true

--補完の候補の行数を10に設定
vim.opt.pumheight = 20

--cursorholdの時間
vim.opt.updatetime = 100

--警告等の列を常に表示
vim.opt.signcolumn = 'yes'

----------------------------------------------------------------------------------------------------
--autocmd
--インサートモードを変えた時にIMEを自動でオフ
vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
    pattern = '*',
    command = ':call system(\'im-select com.apple.inputmethod.Kotoeri.RomajiTyping.Roman\')'
})
vim.api.nvim_create_autocmd({ 'CmdlineLeave' }, {
    pattern = '*',
    command = ':call system(\'im-select com.apple.inputmethod.Kotoeri.RomajiTyping.Roman\')'
})

--ターミナルを開いたときに自動でインサートモード
vim.api.nvim_create_autocmd({ 'TermOpen' }, {
  pattern = '*',
  command = 'startinsert'
})

--ターミナルで行番号を非表示
vim.api.nvim_create_autocmd({ 'TermOpen' }, {
    pattern = '*',
    command = 'setlocal norelativenumber'
})
vim.api.nvim_create_autocmd({ 'TermOpen' }, {
    pattern = '*',
    command = 'setlocal nonumber'
})

--norgファイルを開いたときにconcellevelを変更する
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.norg"},
  command = "set conceallevel=3"
})

--変数ハイライト
vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
  pattern = {"*.c", "*.cpp", "*.lua", "*.py", "*.tex"},
  command = "lua vim.lsp.buf.document_highlight()"
})
vim.api.nvim_create_autocmd({"CursorMoved", "CursorMovedI"}, {
  pattern = {"*.c", "*.cpp", "*.lua", "*.py", "*.tex"},
  command = "lua vim.lsp.buf.clear_references()"
})

--vsnipのスニペットの補完の設定
vim.api.nvim_create_autocmd("InsertCharPre", {
	pattern = "*",
	callback = function()
		vim.keymap.set(
			{'i', 's'},
			'<Tab>',
			function()
				if ( vim.fn['vsnip#expandable']() == 1 and vim.fn['vsnip#jumpable'](1) == 1 ) then
					return '<Plug>(vsnip-jump-next)'
				elseif ( vim.fn['vsnip#expandable']() == 1 and vim.fn['vsnip#jumpable'](1) == 0 ) then
					return '<Plug>(vsnip-expand)'
				elseif ( vim.fn['vsnip#expandable']() == 0 and vim.fn['vsnip#jumpable'](1) == 1 ) then
					return '<Plug>(vsnip-jump-next)'
				else
					return '<Tab>'
				end
			end,
			{ expr = true, noremap = false }
		)
	end
})

--自動でファイルタイプを設定
vim.api.nvim_create_autocmd({"BufNewFile", "BufEnter"}, {
    pattern = "*.plt",
    command = "set filetype=gnuplot"
})
vim.api.nvim_create_autocmd({"BufNewFile", "BufEnter", "CursorMoved", "InsertEnter"}, {
    pattern = "*.snippets",
    command = "set filetype=snippets"
})
vim.api.nvim_create_autocmd({"BufNewFile", "BufEnter"}, {
    pattern = "*.log",
    callback = function(event)
        local current_dir = vim.fn.expand("%:p:h")
        if current_dir:match("/tmp") then
            vim.bo[event.buf].filetype = "texlog"
        end
    end
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "help",
    command = "res 50"
})

----------------------------------------------------------------------------------------------------
--plugins
require("lazy").setup({
    spec = {
		{
		    'sainnhe/sonokai',
		    lazy = false,
		    priority = 1000,
		    config = function()
				vim.cmd([[colorscheme sonokai]])
		    end
		},
		{
		    'IMOKURI/line-number-interval.nvim',
			event = { "InsertEnter", "FocusLost", "BufRead", "BufNewFile" },
		    priority = 500,
		    init = function()
				vim.g.line_number_interval_enable_at_startup = 1
				vim.g['line_number_interval#use_custom'] = 1
				vim.g['line_number_interval#custom_interval'] = {1,2,3,4,5,10,20,30,40,50,60,70,80,90}
				vim.cmd[[
				    highlight HighlightedLineNr		ctermfg=white
				    highlight DimLineNr				ctermfg=238
				    highlight HighlightedLineNr1	ctermfg=125
				    highlight HighlightedLineNr2	ctermfg=178
				    highlight HighlightedLineNr3	ctermfg=254
				    highlight HighlightedLineNr4	ctermfg=44
				    highlight HighlightedLineNr5	ctermfg=26
				]]
		    end
		},
		{
		    'vim-jp/vimdoc-ja',
		    lazy = true,
		    keys = {
				{ "h", mode = "c", }
		    }
		},
		{
		    'nvim-lualine/lualine.nvim',
		    dependencies = { 'nvim-tree/nvim-web-devicons' },
			event = { "InsertEnter", "FocusLost", "BufRead", "BufNewFile" },
		    opts = {
			options = {
			    theme = 'horizon',
			    icons_enabled = true,
			    component_separators = { left = '', right = ''},
			    section_separators = { left = '', right = ''},
			    disabled_filetypes = {
			        statusline = {},
			        winbar = {}
			    },
			    ignore_focus = {},
			    always_divide_middle = true,
			    globalstatus = false,
			    refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000
			    }
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
		    }
		},
		{
		    "nvim-treesitter/nvim-treesitter",
			event = "BufRead",
			priority = 50,
		    build = ":TSUpdate",
		    main = 'nvim-treesitter.configs',
		    opts = {
				highlight = { enable = true },
				indent = { enable = true },
				ensure_installed = {
				    "bash",
  				    "c",
				    "cpp",
  				    "diff",
				    "gitcommit",
				    "gnuplot",
				    "html",
				    "json",
  				    "lua",
  				    "luadoc",
  				    "markdown",
				    "norg",
				    "python",
				    "toml",
				    "tsv",
				    "vim",
				    "vimdoc",
				    "yaml",
					"zathurarc"
				}
		    }
		},
		{
		    "shellRaining/hlchunk.nvim",
		    event = { "BufReadPre", "BufNewFile" },
		    opts = {
				indent = {
				    enable = true,
				    priority = 10,
				    style = { "#888888" },
				    use_treesitter = false,
				    chars = { "│" },
				    ahead_lines = 20,
				    delay = 100
				},
				chunk = {
				    enable = true,
				    priority = 15,
				    style = {
				        { fg = "#00FFFF" },
				        { fg = "#C21F30" }
				    },
				    use_treesitter = true,
				    chars = {
				        horizontal_line = "─",
				        vertical_line = "│",
				        left_top = "╭",
				        left_bottom = "╰",
				        right_arrow = ">"
				    },
				    textobject = "",
				    max_file_size = 2048 * 2048,
				    error_sign = true,
				    -- animation related
				    duration = 200,
				    delay = 150
				},
				blank = {
				    enabled = false,
				    priority = 5
				},
				line_num = {
				    enable = false,
				    priority = 4
				}
		    }
		},
		{
			"glts/vim-texlog",
			event = "BufRead"
		},
		{
			"s417-lama/carbonpaper.vim",
			dependencies = { "NLKNguyen/papercolor-theme" },
			cmd = 'CarbonPaper',
			init = function()
				vim.g['carbonpaper#colorscheme'] = 'PaperColor'
				vim.g['carbonpaper#background'] = 'light'
				vim.g['carbonpaper#set_background_color'] = 0
				vim.g['carbonpaper#highlight_bold'] = 1
			end
		},
		{
			"nvim-neorg/neorg",
			ft = 'norg',
			cmd = 'Neorg',
			dependencies = { "nvim-lua/plenary.nvim" },
			priority = 30,
			build = ":Neorg sync-parsers",
			opts = {
				load = {
			        ["core.defaults"] = {},
			        ["core.concealer"] = {
						config = {
							icons = {
								heading = {
									icons = { "◉", "◎", "○", "◈", "◇", "●" },
								},
								todo = {
									cancelled = {
										icon = "󰩺"
									},
									on_hold = {
										icon = ""
									},
									pending = {
										icon = "󰤆"
									},
									recurring = {
										icon = ""
									},
									uncertain = {
										icon = "?"
									},
									urgent = {
										icon = "󱈸"
									}
								}
							}
						}
					},
			        ["core.dirman"] = {
						config = {
			        	    workspaces = {
			        	    neorg = "~/neorg",
							},
			        	default_workspace = "neorg",
						}
			        },
					["core.completion"] = {
						config = { engine = "nvim-cmp", name = "[Norg]" },
					},
					["core.integrations.nvim-cmp"] = {},
					["core.esupports.indent"] = {
						config = {
							indents = {
								_ = { indent = 0 },
								heading1 = { indent = 0 },
								heading2 = { indent = 1 },
								heading3 = { indent = 2 },
								heading4 = { indent = 3 },
								heading5 = { indent = 4 },
								heading6 = { indent = 5 },
							},
						},
					},
					["core.export"] = {},
					["core.export.markdown"] = { config = { extensions = "all" } },
					["core.todo-introspector"] = {},
					["core.ui.calendar"] = {}
			    }
			}
		},
		{
			"williamboman/mason.nvim",
			cmd = {
				"Mason",
				"MasonInstall",
				"MasonUninstall",
				"MasonUninstallAll",
				"MasonLog",
				"MasonUpdate",
			},
			config = function()
				require("mason").setup()
			end
		},
		{
			"williamboman/mason-lspconfig.nvim",
			ft = { "c", "cpp", "lua", "python", "tex" },
			dependencies = { "williamboman/mason.nvim" },
			config = function()
				require("mason-lspconfig").setup()
				require("mason-lspconfig").setup_handlers({
				  function(server_name)
				    require("lspconfig")[server_name].setup({})
				  end,
				})
			end
		},
		{
			"neovim/nvim-lspconfig",
			ft = { "c", "cpp", "lua", "python", "tex" }
		},
		{
			"nvimdev/lspsaga.nvim",
			opts = {
				definition = {
					width = 0.3,
					height = 0.1
				},
				finder = {
					left_width = 0.2,
					right_width = 0.9,
					layout = 'float'
				}
			}
		},
		{
			"xiyaowong/transparent.nvim"
		},
		{
			"norcalli/nvim-colorizer.lua",
			event = { "InsertEnter", "FocusLost", "BufRead", "BufNewFile" },
			config = function()
				require'colorizer'.setup()
			end
		},
		{
		    'hrsh7th/nvim-cmp',
			dependencies = {
				'hrsh7th/cmp-nvim-lsp',
				'hrsh7th/cmp-buffer',
				'hrsh7th/cmp-path',
				'hrsh7th/cmp-cmdline',
				'hrsh7th/vim-vsnip',
				'hrsh7th/cmp-vsnip',
				'hrsh7th/cmp-emoji'
			},
			event = { "InsertEnter", "CmdlineEnter" },
		    config = function()
				local cmp = require'cmp'
		        cmp.setup({
					completion = {
      				  completeopt = "menuone,noinsert", -- "noselect"を除外した残り
      				},
					snippet = {
						expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
						end,
					},
					mapping = cmp.mapping.preset.insert({
						['<C-b>'] = cmp.mapping.scroll_docs(-4),
						['<C-f>'] = cmp.mapping.scroll_docs(4),
						['<C-Space>'] = cmp.mapping.complete(),
						['<C-j>'] = cmp.mapping.abort(),
						['<CR>'] = cmp.mapping.confirm({ select = true }),
					}),
					sources = cmp.config.sources({
						{ name = 'nvim_lsp' },
						{ name = 'vsnip' },
						{ name = 'gitmoji' },
						{ name = 'neorg'},
						{ name = 'emoji', insert = true },
						{ name = 'buffer' },
					})
		        })
		        cmp.setup.cmdline({ '/', '?' }, {
		          mapping = cmp.mapping.preset.cmdline(),
		          sources = {
		            { name = 'buffer' }
		          }
		        })
		        cmp.setup.cmdline(':', {
					completion = {
					completeopt = "menu,menuone,noinsert,noselect",
					},
					mapping = cmp.mapping.preset.cmdline(),
					sources = cmp.config.sources({
						{ name = 'path' }
					}, {
						{ name = 'cmdline' }
					})
		        })
		      end
		},
		{
			"github/copilot.vim",
			event = { "InsertEnter" },
			cmd = { "Copilot" },
			config = function()
				vim.keymap.set("i", "qq", 'copilot#Accept("qq")', { silent = true, expr = true, replace_keycodes = false })
				vim.g.copilot_no_tab_map = true
    		end
		},
		{
			"CopilotC-Nvim/CopilotChat.nvim",
			branch = "canary",
			dependencies = { "nvim-lua/plenary.nvim" },
			opts = {
				debug = true,
				auto_insert_mode = true,
				show_help = false,
				prompts = {
					Explain = {
						prompt = '/COPILOT_EXPLAIN カーソル上のコードの説明を段落をつけて書いてください。',
						mapping = '<leader>ce',
					},
					Review = {
						prompt = '/COPILOT_REVIEW 選択したコードをレビューしてください。レビューコメントは日本語でお願いします。',
						mapping = '<leader>cr',
					},
					Tests = {
						prompt = '/COPILOT_TESTS カーソル上のコードの詳細な単体テスト関数を書いてください。',
						mapping = '<leader>ct',
					},
					Fix = {
						prompt = '/COPILOT_FIX このコードには問題があります。バグを修正したコードに書き換えてください。',
						mapping = '<leader>cf',
					},
					Optimize = {
						prompt = '/COPILOT_REFACTOR 選択したコードを最適化し、パフォーマンスと可読性を向上させてください。',
						mapping = '<leader>co',
					},
					Docs = {
						prompt = '/COPILOT_REFACTOR 選択したコードのドキュメントを書いてください。ドキュメントをコメントとして追加した元のコードを含むコードブロックで回答してください。使用するプログラミング言語に最も適したドキュメントスタイルを使用してください（例：JavaScriptのJSDoc、Pythonのdocstringsなど）',
						mapping = '<leader>cd',
					},
					--FixDiagnostic = {
					--	prompt = 'ファイル内の次のような診断上の問題を解決してください:',
					--	selection = require('CopilotChat.select').diagnostics,
					--}
				},
				window = {
					layout = 'float',
					border = 'rounded',
					width = 0.8,
					height = 0.8
				},
			},
		},
		{
			"lewis6991/gitsigns.nvim",
			opts = {
				signs = {
					add          = { text = '+' },
					change       = { text = '~' },
					delete       = { text = '-' },
					topdelete    = { text = '-' },
					changedelete = { text = '~' },
					untracked    = { text = '┆' },
				},
				signs_staged = {
					add          = { text = '+' },
					change       = { text = '~' },
					delete       = { text = '-' },
					topdelete    = { text = '-' },
					changedelete = { text = '~' },
					untracked    = { text = '┆' },
				},
				signs_staged_enable = true,
				signcolumn = true,
				numhl      = false,
				linehl     = false,
				word_diff  = false,
				watch_gitdir = {
					follow_files = true
				},
				auto_attach = true,
				attach_to_untracked = false,
				current_line_blame = false,
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = 'eol',
					delay = 500,
					ignore_whitespace = false,
					virt_text_priority = 100,
				},
				current_line_blame_formatter = '   <author>, <author_time:%Y/%m/%d> - <summary>',
				sign_priority = 6,
				update_debounce = 100,
				status_formatter = nil,
				max_file_length = 40000,
				preview_config = {
					border = 'rounded',
					style = 'minimal',
					relative = 'cursor',
					row = 0,
					col = 1
				},
				on_attach = function(bufnr)
					local gitsigns = require('gitsigns')
					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end
				  -- Navigation
					map('n', ']c', function()
					if vim.wo.diff then
						vim.cmd.normal({']c', bang = true})
				    else
						gitsigns.nav_hunk('next')
				    end
					end)
					map('n', '[c', function()
				    if vim.wo.diff then
						vim.cmd.normal({'[c', bang = true})
				    else
						gitsigns.nav_hunk('prev')
				    end
					end)
					-- Actions
					map('n', '<leader>hs', gitsigns.stage_hunk)
					map('n', '<leader>hr', gitsigns.reset_hunk)
					map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
					map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
					map('n', '<leader>hS', gitsigns.stage_buffer)
					map('n', '<leader>hu', gitsigns.undo_stage_hunk)
					map('n', '<leader>hR', gitsigns.reset_buffer)
					map('n', '<leader>hp', gitsigns.preview_hunk)
					map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)
					map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
					map('n', '<leader>hd', gitsigns.diffthis)
					map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
					map('n', '<leader>tl', gitsigns.toggle_deleted)
					-- Text object
					map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
				end
			}
		},
		{
		    "Dynge/gitmoji.nvim",
		    ft = "gitcommit",
		    dependencies = {
		        "hrsh7th/nvim-cmp",
		    },
		    opts = {
		        filetypes = { "gitcommit" },
		        completion = {
		            append_space = false,
		            complete_as = "emoji",
		        }
		    }
		},
		{
			"nvimtools/none-ls.nvim",
			dependencies = 'nvim-lua/plenary.nvim',
			config = function()
				local null_ls = require("null-ls")
				local textlint = null_ls.builtins.diagnostics.textlint.with({
					filetypes = { "txt", "markdown", "lsp_markdown", "tex" },
				})
				null_ls.setup({
					sources = {
						textlint,
			    	},
				})
			end,
		},
		{
			"voldikss/vim-translator",
			config = function ()
				vim.g['translator_target_lang'] = 'ja'
				vim.g['translator_default_engines'] = {'google'}
				vim.g['translator_window_type'] = 'popup'
				vim.g['translator_window_max_width'] = 0.4
				vim.g['translator_window_max_height'] = 0.6
			end
		}
    },
    install = { colorscheme = { "habamax" } },
    checker = { enabled = true }
})

----------------------------------------------------------------------------------------------------
--lsp
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
vim.lsp.handlers.hover,
{
	border = "rounded",
	width = 60
}
)
vim.diagnostic.config({
	update_in_insert = true,
	float = {
		border = "rounded",
		width = 60
	},
	severity_sort = true
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
    highlight NormalFloat   ctermbg=NONE    guibg=NONE
]]

--行番号をいい感じに表示
vim.cmd[[
    highlight CursorLineNr			ctermfg=161	    guifg=#E24775
    highlight HighlightedLineNr	    ctermfg=white   guifg=#F3FBFF
    highlight DimLineNr				ctermfg=238	    guifg=#5D595C
    highlight HighlightedLineNr1    ctermfg=172	    guifg=#FDAE46
    highlight HighlightedLineNr2    ctermfg=220	    guifg=#F1D026
    highlight HighlightedLineNr3    ctermfg=254	    guifg=#B0E48D
    highlight HighlightedLineNr4    ctermfg=84	    guifg=#00D3A6
    highlight HighlightedLineNr5    ctermfg=33	    guifg=#2EACD8
]]

--対応する括弧をハイライト
vim.cmd[[
    highlight MatchParen guifg=#505050 guibg=#23FFB9
    highlight MatchParenCur guifg=#E3E3E3 guibg=#FF317F
]]

--neorgの配色の設定
vim.api.nvim_create_autocmd( { "BufRead", "CursorMoved" }, {
	pattern = "*.norg",
	callback = function()
		vim.cmd[[
			highlight @neorg.lists.unordered.prefix.norg	guifg=#FFFFFF
			highlight @neorg.headings.1.title				guifg=#FC5D7C gui=bold
			highlight @neorg.headings.1.prefix				guifg=#FC5D7C
			highlight @neorg.headings.2.title				guifg=#F39660 gui=bold
			highlight @neorg.headings.2.prefix				guifg=#F39660
			highlight @neorg.headings.3.title				guifg=#E7C664 gui=bold
			highlight @neorg.headings.3.prefix				guifg=#E7C664 gui=bold
			highlight @neorg.headings.4.title				guifg=#A7DF78
			highlight @neorg.headings.4.prefix				guifg=#A7DF78
			highlight @neorg.headings.5.title				guifg=#76CCE0
			highlight @neorg.headings.5.prefix				guifg=#76CCE0
			highlight @neorg.headings.6.title				guifg=#B39DF2
			highlight @neorg.headings.6.prefix				guifg=#B39DF2
			highlight @neorg.todo_items.done.norg			guifg=#A7DF78
    		highlight @neorg.todo_items.cancelled.norg		guifg=#3A4F70
			highlight @neorg.todo_items.on_hold.norg		guifg=#23FFB9
			highlight @neorg.todo_items.urgent.norg			guifg=#f32039
			highlight @neorg.todo_items.recurring.norg		guifg=#E7C664
		]]
	end
})

--lspの配色の設定
vim.cmd[[
    highlight LspReferenceText guibg=#767676
	highlight DiagnosticVirtualTextError guifg=#FC5D7C
	highlight DiagnosticVirtualTextWarn guifg=#E7C664
]]

vim.cmd[[
	highlight Visual guibg=#41A7A1
	highlight Search guifg=#000000 guibg=#EEEEEE
	highlight CurSearch guifg=#000000 guibg=#B6FF00
]]
