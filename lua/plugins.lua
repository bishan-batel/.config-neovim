vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'twh2898/vim-scarpet'
	use { 'tpope/vim-dispatch', opt = true, cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } }
	use { 'andymass/vim-matchup', event = 'VimEnter' }
	use "EdenEast/nightfox.nvim" -- Packer
	use 'ARM9/arm-syntax-vim'
	use 'andweeb/presence.nvim'

	-- use 'voldikss/vim-floaterm'
	use { 'stevearc/overseer.nvim' }
	use { "akinsho/toggleterm.nvim", tag = '*', config = function()
		require("toggleterm").setup()
	end }

	use {
		'numToStr/Comment.nvim',
	}


	use "nvim-lua/plenary.nvim"
	use {
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim" } }
	}

	use 'nvim-treesitter/nvim-treesitter-context'

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

	use { 'nvim-tree/nvim-web-devicons' }

	use 'mboughaba/i3config.vim'

	--use {
	-- 'w0rp/ale',
	-- ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'vim', 'tex', 'lua', 'rust'},
	-- cmd = 'ALEEnable',
	-- config = 'vim.cmd[[ALEEnable]]'
	--}
	-- use { 'neoclide/coc.nvim', branch = 'release' }
	--

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'L3MON4D3/LuaSnip' },
		}
	}

	use "rafamadriz/friendly-snippets"

	use {
		'haorenW1025/completion-nvim',
		opt = true,
		requires = { { 'hrsh7th/vim-vsnip', opt = true }, { 'hrsh7th/vim-vsnip-integ', opt = true } }
	}

	-- use	'cdelledonne/vim-cmake'
	use 'Civitasv/cmake-tools.nvim'

	use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview' }

	-- use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }



	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}
	use 'nvim-treesitter/playground'

	use {
		'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
		config = function() require('gitsigns').setup() end
	}
	-- use { 'tjdevries/colorbuddy.vim', { opt = true } }
	use { 'sainnhe/gruvbox-material', as = 'gruvbox-material' }
	use { 'folke/tokyonight.nvim', as = 'tokyonight' }

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	--use {
	--	'nvim-tree/nvim-tree.lua',
	--	requires = {
	--		'nvim-tree/nvim-web-devicons', -- optional, for file icons
	--	},
	--	tag = 'nightly'               -- optional, updated every week. (see issue #1193)
	--}

	use 'lervag/vimtex'

	use 'github/copilot.vim'
	use 'sheerun/vim-polyglot'
	---use 'SirVer/ultisnips'
	use 'elkowar/yuck.vim'
	use 'wakatime/vim-wakatime'


	use { "catppuccin/nvim", as = "catppuccin" }

	use 'mbbill/undotree'
	use 'tpope/vim-fugitive'

	use 'llathasa-veleth/vim-brainfuck'
	use '9999years/befunge.vim'
	use 'zoomlogo/vim-apl'
	use {
		"cbochs/grapple.nvim",
		requires = { "nvim-tree/nvim-web-devicons" }
	}

	use 'stevearc/dressing.nvim'
	use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }

	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim",           -- Optional image support in preview window: See `# Preview Mode` for more information
			{
				's1n7ax/nvim-window-picker',
				version = '2.*',
				config = function()
					require 'window-picker'.setup({
						filter_rules = {
							include_current_win = false,
							autoselect_one = true,
							-- filter using buffer options
							bo = {
								-- if the file type is one of following, the window will be ignored
								filetype = { 'neo-tree', "neo-tree-popup", "notify" },
								-- if the buffer type is one of following, the window will be ignored
								buftype = { 'terminal', "quickfix" },
							},
						},
					})
				end,
			},
		},
		config = function()
			vim.fn.sign_define("DiagnosticSignError",
				{ text = " ", texthl = "DiagnosticSignError" })
			vim.fn.sign_define("DiagnosticSignWarn",
				{ text = " ", texthl = "DiagnosticSignWarn" })
			vim.fn.sign_define("DiagnosticSignInfo",
				{ text = " ", texthl = "DiagnosticSignInfo" })
			vim.fn.sign_define("DiagnosticSignHint",
				{ text = "󰌵", texthl = "DiagnosticSignHint" })
		end
	}

	use 'rcarriga/nvim-notify'
	use 'folke/trouble.nvim'
	use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } }
	use 'theHamsta/nvim-dap-virtual-text'

	use 'christoomey/vim-tmux-navigator'

	-- use 'bishan-batel/tree-sitter-gooscript'
	use '~/code/gooscript/tree-sitter'
end)
