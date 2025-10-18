return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require("toggleterm").setup {
        size = 20,
        shell = "C:\\Progra~1\\Git\\bin\\bash.exe",
        open_mapping = [[<c-\>]], -- default toggle
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "horizontal",
        close_on_exit = true,
        float_opts = {
          border = "curved",
          winblend = 0,
        },
      }

      local Terminal = require('toggleterm.terminal').Terminal
      local terminals = {}
      local current = 0

      -- Create a new terminal
      function _CREATE_TERM()
        local term = Terminal:new({ hidden = true })
        table.insert(terminals, term)
        current = #terminals
        _SHOW_TERM(current)
      end

      -- Show only one terminal at index
      function _SHOW_TERM(idx)
        for i, term in ipairs(terminals) do
          if i == idx then
            if not term:is_open() then
              term:toggle()
            end
          else
            if term:is_open() then
              term:toggle()
            end
          end
        end
      end

      -- Next terminal
      function _NEXT_TERM()
        if #terminals == 0 then return end
        current = current + 1
        if current > #terminals then current = 1 end
        _SHOW_TERM(current)
      end

      -- Previous terminal
      function _PREV_TERM()
        if #terminals == 0 then return end
        current = current - 1
        if current < 1 then current = #terminals end
        _SHOW_TERM(current)
      end

      -- Toggle current terminal
      function _TOGGLE_TERM()
        if #terminals == 0 then
          _CREATE_TERM()
        else
          terminals[current]:toggle()
        end
      end

      -- Delete current terminal
      function _DELETE_TERM()
        if #terminals == 0 then return end

        -- Close and remove current terminal
        local term = terminals[current]
        if term:is_open() then
          term:toggle()
        end

        table.remove(terminals, current)

        -- Adjust current index
        if current > #terminals then
          current = #terminals
        end

        -- If there are still terminals, show the next one
        if #terminals > 0 then
          _SHOW_TERM(current)
        else
          current = 0
        end
      end

      -- Keybindings
      vim.keymap.set("n", "<leader>tc", _CREATE_TERM, { silent = true, desc = "Create terminal" })
      vim.keymap.set("n", "<leader>tn", _NEXT_TERM, { silent = true, desc = "Next terminal" })
      vim.keymap.set("n", "<leader>tp", _PREV_TERM, { silent = true, desc = "Previous terminal" })
      vim.keymap.set("n", "<leader>tt", _TOGGLE_TERM, { silent = true, desc = "Toggle terminal" })
      vim.keymap.set("n", "<leader>td", _DELETE_TERM, { silent = true, desc = "Delete terminal" })
    end
  }
}
