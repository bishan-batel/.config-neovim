vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'twh2898/vim-scarpet'
	use { 'tpope/vim-dispatch', opt = true, cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } }
	use { 'andymass/vim-matchup', event = 'VimEnter' }
	use "EdenEast/nightfox.nvim" -- Packer
	use 'ARM9/arm-syntax-vim'
	use 'andweeb/presence.nvim'

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

	use 'nvim-tree/nvim-web-devicons'

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
			 {'williamboman/mason.nvim'},
			 {'williamboman/mason-lspconfig.nvim'},

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


	use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview' }

	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use 'nvim-treesitter/playground'


	use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!

	use {
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim" } }
	}

	--	use {
	--		'nvim-treesitter/nvim-treesitter',
	--		run = function()
	--			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
	--			ts_update()
	--		end,
	--	}

	use {
		'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
		config = function() require('gitsigns').setup() end
	}
	use { 'tjdevries/colorbuddy.vim', { opt = true } }
	use { 'sainnhe/gruvbox-material', as = 'gruvbox-material' }
	use { 'folke/tokyonight.nvim', as = 'tokyonight' }

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly'               -- optional, updated every week. (see issue #1193)
	}

	use 'lervag/vimtex'

	use 'github/copilot.vim'
	use 'sheerun/vim-polyglot'
	use 'SirVer/ultisnips'
	use 'elkowar/yuck.vim'
	use 'wakatime/vim-wakatime'

	use { "catppuccin/nvim", as = "catppuccin" }
	use 'mbbill/undotree'
	use 'tpope/vim-fugitive'

	use 'llathasa-veleth/vim-brainfuck'
	use '9999years/befunge.vim'
	use 'zoomlogo/vim-apl'
end)
