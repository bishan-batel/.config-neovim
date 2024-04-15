vim.api.nvim_create_user_command("OverseerRestartLast", function()
  local overseer = require("overseer")
  local tasks = overseer.list_tasks({ recent_first = true })
  if vim.tbl_isempty(tasks) then
    vim.notify("No tasks found", vim.log.levels.WARN)
  else
    overseer.run_action(tasks[1], "restart")
  end
end, {})

require('overseer').setup {
  direction = "bottom",
}

vim.keymap.set('n', "<leader>ot", ":OverseerToggle bottom<cr>")
vim.keymap.set('n', "<leader>or", ":OverseerRun<cr>")
vim.keymap.set('n', "<leader>oc", ":OverseerClose<cr>")
vim.keymap.set('n', "<leader>ol", ":OverseerRestartLast<cr>")
