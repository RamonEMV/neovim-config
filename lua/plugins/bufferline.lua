return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers", -- or "tabs"
        diagnostics = "nvim_lsp",
        separator_style = "padded_sloped",
        show_buffer_close_icons = false,
        show_close_icon = false,
        view = "tabs",
        enforce_regular_tabs = true,
        -- tab_size = 20,
        color_icons = true,
      },
      highlights = {
        -- Active tab
        buffer_selected = {
          bold = true,
          italic = false,
          underline = true,
        },
        -- Inactive tabs
        background = {
          italic = true,
          fg = { attribute = "fg", highlight = "Comment" },
          bg = { attribute = "bg", highlight = "NormalNC" },
        },
        -- Active tab background (stronger)
        fill = {
          bg = { attribute = "bg", highlight = "StatusLine" },
        },
        separator_selected = {
          fg = { attribute = "fg", highlight = "Directory" },
        },
      }
    })

    -- optional keymaps
    vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
    vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
  end,
}
