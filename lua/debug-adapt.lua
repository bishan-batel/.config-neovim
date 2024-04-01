-- Debug Adapter

local dap = require('dap')
local dapui = require('dapui')

dapui.setup()

dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

-- vnoremap <M-k> <Cmd>lua require("dapui").eval()<CR>
vim.keymap.set('v', '<leader>de', function() dapui.eval() end)


vim.keymap.set('n', '<leader>dt', function() dapui.toggle() end)
vim.keymap.set('n', '<leader>db', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<leader>dc', function()
	if vim.fn.filereadable('.vscode/launch.json') then
		require('dap.ext.vscode').load_launchjs(nil, { lldb = { 'c', 'cpp' } })
	end
	require('dap').continue()
end)

vim.keymap.set('n', '<leader>dn', function() dap.step_over() end)
vim.keymap.set('n', '<leader>di', function() dap.step_into() end)
vim.keymap.set('n', '<leader>di', function() dap.step_into() end)
vim.keymap.set('n', '<leader>do', function() dap.step_out() end)

vim.keymap.set('n', '<leader>dr', function() dapui.open({ reset = true }) end)

vim.keymap.set('n', '<leader>dk', function() require('dap.ui.widgets').hover() end)

dap.adapters.lldb = {
	type = 'executable',
	command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
	name = 'lldb'
}

dap.configurations.cpp = {
	{
		name = 'Launch',
		type = 'lldb',
		request = 'launch',
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		cwd = '${workspaceFolder}',
		stopOnEntry = false,
		args = {},
		runInTerminal = true,
	},
}
