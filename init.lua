require("config.lazy")

vim.opt.relativenumber = true

-- Move
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-j>', '<C-w>j')

-- Save shortcut
vim.keymap.set('n', '<C-s>', ':w<CR>', { desc = "Save file" })
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>', { desc = "Save file" })

-- Git commands
vim.keymap.set('n', '<leader>gd', ':Gdiffsplit<CR>', { desc = "Git diff split" })
vim.keymap.set('n', '<leader>bd', ':bd<CR>', { desc = "Close delete buffer" })
vim.keymap.set('n', '<leader>q', ':close<CR>', { desc = "Close tab" })

-- Show diagnostic
vim.keymap.set("n", "<leader>td", vim.diagnostic.open_float, { desc = "Show diagnostic" })

-- List diagnostics in buffer
vim.keymap.set("n", "<leader>tf", ":Telescope diagnostics<CR>", { desc = "List all diagnostics in buffer" })

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		vim.lsp.buf.format({ async = false })
	end,
})

-- Diagnostics for error and warning
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})
