vim.opt.number=true
vim.opt.rnu=true
vim.opt.hlsearch=false
vim.opt.wrap=false
vim.opt.tabstop=2
vim.opt.shiftwidth=2
vim.opt.expandtab=false
vim.g.mapleader="m"

vim.cmd [[set conceallevel=1]]
vim.cmd [[syntax enable]]
vim.cmd [[colorscheme tokyonight]]

-- tokyonight
require("tokyonight").setup({
	styles = {
		sidebars="data",
		floats="dark"
	}
})

-- gruvbox
vim.g.gruvbox_material_background = 'medium'
vim.g.gruvbox_material_better_performance=true
vim.g.gruvbox_material_enable_bold=true
vim.g.gruvbox_material_enable_italic=true
vim.g.gruvbox_material_transparent_background=1
