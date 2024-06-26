-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

--------parser_config.gosling = {
--------  install_info = {
--------    url = "~/code/tree-sitter-gosling",    -- local path or git repo
--------    files = { "src/parser.c" },            -- note that some parsers also require src/scanner.c or src/scanner.cc
--------    generate_requires_npm = true,          -- if stand-alone parser without npm dependencies
--------    requires_generate_from_grammar = true, -- if folder contains pre-generated src/parser.c
--------  },
--------  filetype = "gs",                         -- if filetype does not match the parser name
--------}


require 'nvim-treesitter.configs'.setup {
  ensure_installed = {},
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = { enable = true },
  textobjects = { enable = true },
  indent = { enable = true },
  matchup = { enable = true },

  playground = {
    enable = true,
    disable = {},
    updatetime = 25,
  }
}

require("gooscript").setup()
