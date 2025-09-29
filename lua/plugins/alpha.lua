return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  opts = function()
    local dashboard = require("alpha.themes.dashboard")

    -- Header (your ASCII art)
    local logo = [[
    ⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⠋⣠⠞⠁⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀
    ⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⠛⡟⠧⣿⡁⣴⠃⣠⡾⠛⢁⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀
    ⠀⠀⠀⠀⣴⣿⣿⣿⡿⡷⣱⡚⢆⣿⡝⣿⣿⣿⣥⣶⣿⣿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢻⣿⠀⠀⠀
⠀⠀    ⠀⣼⣿⣿⣿⣿⣿⣎⣽⡃⣼⣸⣷⣿⣿⣿⣿⣿⣿⣇⣼⣿⣿⡿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⣿⠀⠀⠀
⠀⠀    ⠀⣿⣿⣿⣿⣿⠸⢏⣸⣻⠟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠃⠀⠀⠀
⠀   ⠀⣀⢼⣟⣫⣭⣴⡟⢒⣷⠋⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣿⣿⣻⣿⣿⣿⣿⡇⠀⠀⠀⠀
    ⠚⠛⢻⣿⣿⣿⠿⣫⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢫⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀
    ⠀⠀⢈⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢟⣿⡿⣟⣉⣉⣾⢿⣿⣿⣿⣿⡿⣿⣿⠟⣹⣿⣿⡏⣸⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀
    ⠠⠲⣛⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠽⠊⠉⠽⣿⣻⣿⣿⣿⣿⠿⣿⣿⣭⠉⠛⠉⠀⢸⣿⣿⠶⠂⡏⢩⣿⣿⡏⠀⠀⠀⠀⠀⠀
    ⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⡅⠀⠀⠀⠈⠉⠛⠻⠷⠦⠤⠄⠉⠀⠀⠀⠀⠀⢸⡇⠀⠀⡸⢀⣾⣿⣿⣧⣴⣶⣶⠦⠐⠒
    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢙⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡸⡀⢰⢃⣾⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀
    ⣿⣿⣿⣿⣿⣿⡿⠟⠉⠉⣻⢿⣿⣿⣿⣻⣿⡿⢦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⠷⢳⢃⣾⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀
    ⣿⣿⣿⣿⡿⠋⠀⠀⠀⣴⡷⢛⠟⣿⣿⣿⣿⣿⣦⡱⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⡰⣡⠋⢿⣿⣿⣿⣿⣿⣿⣇⠀⣠⠄⠀
    ⠟⠫⠑⠉⠀⠀⠀⠀⠀⠉⠀⣨⠞⣿⣿⣿⣌⠻⣿⣿⣮⣑⣤⠴⠶⣤⡀⠀⠠⠤⠤⠶⠞⢁⣾⠟⣱⠃⠘⣿⣿⣿⣿⣿⣿⠟⠋⠀⠀⠀
    ⠈⠀⠀⠀⠀⠀⠀⠀⠀⣠⠞⢡⠤⣿⣷⣽⣿⣦⣌⣹⣿⡿⠁⡼⠀⡈⠛⠳⣦⣤⣀⣠⣴⠟⠁⠀⡏⢀⣾⣿⣿⠿⠛⠉⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⢀⠞⠁⠀⠘⢦⣄⣉⣛⡿⣿⣿⠿⠋⠀⡼⠁⢰⠁⠀⠀⠈⠛⢿⣿⣷⣶⣶⣶⣷⣾⡟⠉⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀
    ⠀⠀⠀⠀⠀⢀⡴⠋⠀⠀⠀⠀⠀⠀⠉⠉⢹⠟⠛⣆⠀⡜⠁⠀⡼⠀⠀⡇⠀⠀⢦⣘⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⣀⣠⣴⣾⣯⣷⡖⢏
    ⠀⠀⠀⠀⡴⠋⠀⠀⠀⠀⣠⡇⠀⠀⠀⠀⠘⠖⠒⢾⣷⣆⠀⠀⡇⠀⠀⡇⠀⢀⣾⣯⣽⣛⡿⠿⢿⣿⣿⡷⠶⠛⠋⠉⢻⣿⣿⣿⣿⣄
    ⠀⠀⢠⡞⠁⠀⠀⠀⠀⢠⢿⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⡏⠉⢑⣒⡤⠤⣶⣿⠟⠻⣿⣿⣿⣿⣶⠶⣬⣍⡙⠒⠲⠤⣄⣯⡛⣿⣿⣿
    ⠀⢀⠏⠀⠀⠀⠀⠀⠀⠘⢆⡣⣄⡀⠀⠀⠀⢀⣀⡤⢿⣿⣿⠉⠉⠀⠈⠉⠓⠁⢀⣤⣾⣿⣿⣿⣹⡀⠀⠀⠉⠉⠛⠒⠦⢤⣍⣉⡛⠛
    ⠀⡌⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠲⣝⠓⠒⠉⠉⠀⠀⢸⣿⣿⡇⠀⠀⠀⢀⣠⣶⣿⣿⣿⠿⢻⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⣼⠀⠀⠉⠙
    ⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⡄⠀⠀⠀⠀⠀⣿⣿⣿⡄⣠⣴⣿⣿⣿⡿⠟⠁⠀⠀⠹⣿⣿⣷⣄⡀⠀⠀⠀⢀⡏⠀⠀⠀⠀
    ⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣦⡀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⠟⠉⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⣷⣦⣤⣏⣀⠀⠀⠀⠀
    ⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣟⣆⣤⣾⣿⣿⣿⣿⡟⠋⠀⠀⢰⠀⠀⠀⠀⠀⢀⣞⣿⣿⣿⠉⣻⠿⠿⠿⠿⣿⣿⣿⣿
    ⣿⣿⣿⣷⣶⣦⣤⣄⣠⣄⣀⣤⣤⣤⣤⣶⣾⣿⣿⣿⣿⡿⠛⣿⣿⣿⡀⠀⠀⠈⢧⠀⠀⠀⣠⠾⠛⣿⣿⣿⣏⣁⣀⣤⣴⣿⣿⣿⣿⣿
]]
    dashboard.section.header.val = vim.split(logo, "\n", { trimempty = true })

    -- Buttons
    dashboard.section.buttons.val = {
      dashboard.button("n", "  New file", ":ene <BAR> startinsert<CR>"),
      dashboard.button("f", "󰈞  Find file", ":Telescope find_files<CR>"),
      dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
      dashboard.button("g", "󰊄  Live grep", ":Telescope live_grep<CR>"),
      dashboard.button("c", "  Config", ":e $MYVIMRC<CR>"),
      dashboard.button("q", "󰅚  Quit", ":qa<CR>"),
    }

    -- Footer
    dashboard.section.footer.val = "⚡ Neovim loaded with alpha.nvim ⚡"

    -- Layout padding
    dashboard.config.layout = {
      { type = "padding", val = 2 },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 1 },
      dashboard.section.footer,
    }

    return dashboard.config
  end,
}
