-- plugins/cyberdream.lua or inside your Lazy spec
return {
	"scottmckendry/cyberdream.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		theme = "auto",
		transparent = true,
		disable_autocmd = true, -- 👈 disables auto-colorscheme
	},
}
