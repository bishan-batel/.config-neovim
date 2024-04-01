vim.cmd [[filetype plugin indent on]]

vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_view_method="zathura"
vim.g.vimtex_view_general_viewer="zathura"
vim.g.vimtex_view_general_options = '--unique file:@pdf#src:@line@tex'

--vim.keymap.set("n", "\\", "", {})
vim.g.tex_conceal="abdmg"

