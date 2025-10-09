-- lazy.nvim
return {
  "GustavEikaas/easy-dotnet.nvim",
  dependencies = { "nvim-lua/plenary.nvim", 'nvim-telescope/telescope.nvim', },
  config = function()
    require("easy-dotnet").setup({
      lsp = {
        cmd = {
          "dotnet",
          "exec",
          vim.fn.stdpath("data") .. "/easy-dotnet/roslyn/Microsoft.CodeAnalysis.LanguageServer.dll",
          "--stdio",
        },
      }
    })
  end
}
