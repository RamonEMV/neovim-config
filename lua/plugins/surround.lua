return {
	"echasnovski/mini.surround",
	version = false,
	event = "VeryLazy",
	config = function()
		require("mini.surround").setup({
			mappings = {
				add = "gS", -- Use this in visual mode
			},
		})
	end,
}
