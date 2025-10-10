require("config.lazy")
require("utils.keep_tabs").setup()

vim.cmd.colorscheme("cyberdream")

vim.opt.shell = 'cmd.exe'

vim.opt.relativenumber = true

-- Move
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-j>', '<C-w>j')

-- Terminal mode window navigation
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h', { silent = true })
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j', { silent = true })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k', { silent = true })
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l', { silent = true })

-- In terminal mode, pressing Esc goes to normal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { silent = true })

-- Save shortcut
vim.keymap.set('n', '<C-s>', ':w<CR>', { desc = "Save file" })
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>', { desc = "Save file" })

-- Git commands
vim.keymap.set('n', '<leader>gd', ':Gdiffsplit<CR>', { desc = "Git diff split" })
vim.keymap.set('n', '<leader>bd', ':bd<CR>', { desc = "Close delete buffer" })
vim.keymap.set('n', '<leader>q', ':close<CR>', { desc = "Close tab" })

-- List diagnostics in buffer
vim.keymap.set("n", "<leader>tf", ":Telescope diagnostics<CR>", { desc = "List all diagnostics in buffer" })

vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "LSP: Rename symbol" })

-- Tabs commands

vim.keymap.set("n", "[t", ":tabprev<CR>", { desc = "Previous tab", silent = true })
vim.keymap.set("n", "]t", ":tabnext<CR>", { desc = "Next tab", silent = true })
-- Show diagnostic
vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Show diagnostic" })
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code action" })

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})


vim.cmd("syntax enable")
vim.opt.termguicolors = true

-- Diagnostics for error and warning
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", {
  underline = false,
  fg = "#ff5555", -- red text
  bg = "#331111", -- subtle red background
})

vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", {
  underline = false,
  fg = "#ffcc00",
  bg = "#332b00"
})

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.softtabstop = 2

vim.o.shell = "C:\\Program Files\\Git\\bin\\bash.exe"
vim.o.shellcmdflag = "-c"
vim.o.shellquote = '"'
vim.o.shellxquote = ""
