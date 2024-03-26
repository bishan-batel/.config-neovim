vim.opt.number = true
vim.opt.rnu = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.wrap = false

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.scrolloff = 5

vim.opt.updatetime = 50

vim.opt.colorcolumn = "-1"

vim.opt.termguicolors = true


-- notify
local notify = require("notify")
vim.notify = notify
notify.setup {
  background_colour = "#1e2030"
}


require("catppuccin").setup({
  transparent_background = true
})


--nightfox
require("nightfox").setup({
  options = {
    transparent = true,
  },
})

local bufferline = require('bufferline')
bufferline.setup {
  highlights = {
    tab_selected = {
      fg = '#cba6f7',
      bg = '#cba6f7',
    },
  },
  options = {
    mode = "buffers",                               -- set to "tabs" to only show tabpages instead
    style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
    -- themable = true | false, -- allows highlight groups to be overriden i.e. sets highlights as default
    right_mouse_command = "bdelete! %d",            -- can be a string | function | false, see "Mouse actions"
    left_mouse_command = "buffer %d",               -- can be a string | function, | false see "Mouse actions"
    middle_mouse_command = nil,                     -- can be a string | function, | false see "Mouse actions"
    indicator = {
      icon = '󰞔',
      style = 'icon',
    },
    buffer_close_icon = '󰅖',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    --- name_formatter can be used to change the buffer's label in the bufferline.
    --- Please note some names can/will break the
    --- bufferline so use this at your discretion knowing that it has
    --- some limitations that will *NOT* be fixed.
    name_formatter = function(buf) -- buf contains:
      -- name                | str        | the basename of the active file
      -- path                | str        | the full path of the active file
      -- bufnr (buffer only) | int        | the number of the active buffer
      -- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
      -- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
    end,
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    truncate_names = true,  -- whether or not tab names should be truncated
    tab_size = 18,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and " " or ""
      return " " .. icon .. count
    end,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    custom_filter = function(buf_number, buf_numbers)
      -- filter out filetypes you don't want to see
      if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
        return true
      end
      -- filter out by buffer name
      if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
        return true
      end
      -- filter out based on arbitrary rules
      -- e.g. filter out vim wiki buffer from tabline in your work repo
      if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
        return true
      end
      -- filter out by it's index number in list (don't show first buffer)
      if buf_numbers[1] ~= buf_number then
        return true
      end
    end,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "left",
        separator = true
      }
    },
    color_icons = true, -- whether or not to add the filetype icon highlights
    get_element_icon = function(element)
      local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
      return icon, hl
    end,
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    show_duplicate_prefix = true,    -- whether to show duplicate buffer prefix
    duplicates_across_groups = true, -- whether to consider duplicate paths in different groups as duplicates
    persist_buffer_sort = true,      -- whether or not custom sorted buffers should persist
    move_wraps_at_ends = false,      -- whether or not the move command "wraps" at the first or last position
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = { '', '' },
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    hover = {
      enabled = true,
      delay = 200,
      reveal = { 'close' }
    },
    sort_by = 'insert_after_current' }
}

vim.keymap.set('n', '<leader>bdl', ':BufferLineCloseRight<cr>')
vim.keymap.set('n', '<leader>bdh', ':BufferLineCloseLeft<cr>')
vim.keymap.set('n', '<leader>bdo', ':BufferLineCloseOthers<cr>')
vim.keymap.set('n', '<leader>bdw', ':bdelete<cr>')
vim.keymap.set('n', '<leader>bdd', ':bdelete<cr>')

vim.keymap.set('n', '<leader>bp', ':BufferLineTogglePin<cr>')

vim.keymap.set('n', '<S-h>', ':BufferLineCyclePrev<cr>')
vim.keymap.set('n', '<leader>bh', ':BufferLineMovePrev<cr>')

vim.keymap.set('n', '<leader>bl', ':BufferLineMoveNext<cr>')
vim.keymap.set('n', '<S-l>', ':BufferLineCycleNext<cr>')
vim.keymap.set('n', '<C-Tab>', ':e #<cr>')

vim.cmd [[set conceallevel=1]]
vim.cmd [[syntax enable]]
vim.cmd [[colorscheme catppuccin-mocha]]