-- ~/.config/nvim/lua/utils/keep_tabs.lua
local M = {}

M.setup = function()
  local function create_dummy_buffer()
    vim.cmd("enew")
    vim.bo.buftype = "nofile"
    vim.bo.bufhidden = "hide"
    vim.bo.swapfile = false
    vim.api.nvim_buf_set_name(0, "*scratch*")
  end

  vim.api.nvim_create_autocmd("BufDelete", {
    callback = function()
      local tab = vim.api.nvim_get_current_tabpage()
      local wins = vim.api.nvim_tabpage_list_wins(tab)
      if #wins == 0 then
        create_dummy_buffer()
      end
    end,
  })
end

return M
