return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	config = function()
		local notify = require("notify")
		notify.setup({
			background_colour = "#1e1e2e", -- Change this to your preferred background color
			timeout = 3000,
			stages = "fade", -- Other options: "slide", "fade_in_slide_out", etc.
		})
		vim.notify = notify
	end,
}
