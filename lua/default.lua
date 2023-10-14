function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.opt.number = true
vim.opt.rnu = true
vim.opt.hlsearch = false
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
vim.opt.autoindent = true 
vim.g.mapleader = "m"
vim.opt.shell = "/usr/bin/fish"


if vim.g.neovide then 
	vim.o.guifont = "JetBrainsMono Nerd Font:h13"

	local alpha = function() 
		return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
	end
	vim.g.neovide_transparency = 0.0
	vim.g.transparency = 0.8
	vim.g.neovide_background_color = "#0f1117" .. alpha()

	  vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
		vim.keymap.set('v', '<D-c>', '"+y') -- Copy
		vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
		vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
		vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
		vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode

end

vim.opt.modeline=true
vim.opt.modelines=5

vim.cmd [[set conceallevel=1]]
vim.cmd [[syntax enable]]

-- tokyonight
require("tokyonight").setup({
	styles = {
		sidebars = "data",
		floats = "dark"
	}
})

--nightfox
require("nightfox").setup({
	options = {
		transparent = true,
	},
})

require("catppuccin").setup({
		transparent_background = true
})

-- gruvbox
vim.g.gruvbox_material_background = 'medium'
vim.g.gruvbox_material_better_performance = true
vim.g.gruvbox_material_enable_bold = true
vim.g.gruvbox_material_enable_italic = true
vim.g.gruvbox_material_transparent_background = 1

--

-- terminal command
vim.api.nvim_create_user_command("T", function(opts)
	vim.cmd [[ split ]]
	vim.cmd [[ wincmd j]]
	vim.cmd("term " .. opts.args)
end, { nargs = "?" })


-- colorscheme
--vim.cmd [[colorscheme carbonfox]]
vim.cmd [[colorscheme catppuccin-macchiato]]
