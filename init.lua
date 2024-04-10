vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


local confs = {
  "plugins",
  "default",
  "statusline",
  "ts",
  "lsp",
  "filemanage",
  --"snippets",
  "vimtex",
  "discord-rpc",
  "fugitive",
  "ui",
  "debug-adapt",
  "neovide",
  "tmux"
}

for _, file in pairs(confs) do
  require(file)
end



