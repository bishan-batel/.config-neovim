function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = "m"
vim.opt.shell = "/usr/bin/fish"

vim.opt.modeline = true
vim.opt.modelines = 5

vim.opt.swapfile = false
vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") .. "../.vim/undodir"


vim.cmd [[set conceallevel=1]]
vim.cmd [[syntax enable]]

-- tokyonight
require("tokyonight").setup({
	styles = {
		sidebars = "data",
		floats = "dark"
	}
})

-- gruvbox
vim.g.gruvbox_material_background = 'medium'
vim.g.gruvbox_material_better_performance = true
vim.g.gruvbox_material_enable_bold = true
vim.g.gruvbox_material_enable_italic = true
--vim.g.gruvbox_material_transparent_background = 1

--

-- terminal command
vim.api.nvim_create_user_command("T", function(opts)
	vim.cmd [[ split ]]
	vim.cmd [[ wincmd j]]
	vim.cmd("term " .. opts.args)
end, { nargs = "?" })
