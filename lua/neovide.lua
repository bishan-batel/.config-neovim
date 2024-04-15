if vim.g.neovide then
	vim.o.guifont = "JetBrainsMono Nerd Font:h18"

	local alpha = function()
		return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8)))
	end
	vim.g.neovide_transparency = 0.95
	vim.g.transparency = 1.0

	vim.g.neovide_refresh_rate = 60
	vim.g.neovide_refresh_rate_idle = 5
	vim.g.neovide_cursor_vfx_mode = "wireframe"

	vim.g.neovide_background_color = [[#1E1E2E]] .. alpha()

	require("catppuccin").setup({
		transparent_background = false
	})

	vim.g.neovide_theme = 'catppuccin'

	vim.g.neovide_hide_mouse_when_typing = true

	vim.keymap.set('n', '<D-s>', ':w<CR>')     -- Save
	vim.keymap.set('v', '<D-c>', '"+y')        -- Copy
	vim.keymap.set('n', '<D-v>', '"+P')        -- Paste normal mode
	vim.keymap.set('v', '<D-v>', '"+P')        -- Paste visual mode
	vim.keymap.set('c', '<D-v>', '<C-R>+')     -- Paste command mode
	vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
end
