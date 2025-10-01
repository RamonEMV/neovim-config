return {
  {
    "onsails/lspkind.nvim",
    lazy = true,        -- Optional: load lazily
    event = "VeryLazy", -- or remove to load immediately
    config = function()
      require("lspkind").init({
        -- optional configuration
        mode = "symbol_text", -- show symbol + text
        preset = "codicons",
        symbol_map = {
          Text = "",
          Method = "ƒ",
          Function = "",
          Constructor = "",
          Variable = "",
          Class = "",
          Interface = "󱘖",
          Module = "󰕳",
          Property = "",
          Unit = "",
          Value = "",
          Enum = "了",
          Keyword = "",
          Snippet = "",
          Color = "",
          File = "",
          Reference = "",
          Folder = "",
          EnumMember = "",
          Constant = "",
          Struct = "",
        },
      })
    end,
  },
}
