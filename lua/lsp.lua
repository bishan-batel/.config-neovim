local lsp_zero = require('lsp-zero')


lsp_zero.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)

  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)

  vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
  vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "<leader>.", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "gl", function() vim.lsp.buf.open_float() end, opts)

  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)

  vim.keymap.set("n", "<M-S-f>", [[:Fmt<cr>]], opts)
  vim.api.nvim_create_user_command("Format", [[:LspZeroFormat]], {})
  vim.api.nvim_create_user_command("Fmt", [[:LspZeroFormat]], {})

  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'tsserver', 'rust_analyzer', 'clangd' },
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      require('lspconfig').lua_ls.setup(lsp_zero.nvim_lua_ls())
    end,
  }
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

-- this is the function that loads the extra snippets to luasnip
-- from rafamadriz/friendly-snippets
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'luasnip',                keyword_length = 2 },
    { name = 'buffer',                 keyword_length = 3 },
    { name = 'nvim_lsp_signature_help' },
  },
  formatting = lsp_zero.cmp_format({ details = false }),
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<Enter>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered()
  }
})

require("trouble").setup({
  position = "bottom", -- position of the list can be: bottom, top, left, right
  height = 10, -- height of the trouble list when position is top or bottom
  width = 50, -- width of the list when position is left or right
  icons = true, -- use devicons for filenames
  mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
  severity = nil, -- nil (ALL) or vim.diagnostic.severity.ERROR | WARN | INFO | HINT
  fold_open = "", -- icon used for open folds
  fold_closed = "", -- icon used for closed folds
  group = true, -- group results by file
  padding = true, -- add an extra new line on top of the list
  cycle_results = true, -- cycle item list when reaching beginning or end of list
  action_keys = { -- key mappings for actions in the trouble list
    -- map to {} to remove a mapping, for example:
    -- close = {},
    close = "q",                                                                        -- close the list
    cancel = "<esc>",                                                                   -- cancel the preview and get back to your last window / buffer / cursor
    refresh = "r",                                                                      -- manually refresh
    jump = { "<cr>", "<tab>", "<2-leftmouse>" },                                        -- jump to the diagnostic or open / close folds
    open_split = { "<c-x>" },                                                           -- open buffer in new split
    open_vsplit = { "<c-v>" },                                                          -- open buffer in new vsplit
    open_tab = { "<c-t>" },                                                             -- open buffer in new tab
    jump_close = { "o" },                                                               -- jump to the diagnostic and close the list
    toggle_mode = "m",                                                                  -- toggle between "workspace" and "document" diagnostics mode
    switch_severity = "s",                                                              -- switch "diagnostics" severity filter level to HINT / INFO / WARN / ERROR
    toggle_preview = "P",                                                               -- toggle auto_preview
    hover = "K",                                                                        -- opens a small popup with the full multiline message
    preview = "p",                                                                      -- preview the diagnostic location
    open_code_href = "c",                                                               -- if present, open a URI with more information about the diagnostic error
    close_folds = { "zM", "zm" },                                                       -- close all folds
    open_folds = { "zR", "zr" },                                                        -- open all folds
    toggle_fold = { "zA", "za" },                                                       -- toggle fold of current file
    previous = "k",                                                                     -- previous item
    next = "j",                                                                         -- next item
    help = "?"                                                                          -- help menu
  },
  multiline = true,                                                                     -- render multi-line messages
  indent_lines = true,                                                                  -- add an indent guide below the fold icons
  win_config = { border = "single" },                                                   -- window configuration for floating windows. See |nvim_open_win()|.
  auto_open = false,                                                                    -- automatically open the list when you have diagnostics
  auto_close = false,                                                                   -- automatically close the list when you have no diagnostics
  auto_preview = true,                                                                  -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
  auto_fold = false,                                                                    -- automatically fold a file trouble list at creation
  auto_jump = { "lsp_definitions" },                                                    -- for the given modes, automatically jump if there is only a single result
  include_declaration = { "lsp_references", "lsp_implementations", "lsp_definitions" }, -- for the given modes, include the declaration of the current symbol in the results
  signs = {
    -- icons / text used for a diagnostic
    error = "",
    warning = "",
    hint = "",
    information = "",
    other = "",
  },
  use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
})



-- Lua
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
