return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		ensure_installed = {
			"vue", "typescript", "javascript", "html", "css"
		},
		highlight = { enable = true },
		-- VERY IMPORTANT:
		context_commentstring = {
			enable = true,
			enable_autocmd = false,
		},
	},
}
