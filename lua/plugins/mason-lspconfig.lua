return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        -- "vue_ls",
        -- "vtsls"
      }
    })
  end
}
