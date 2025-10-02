local luasnip = require "luasnip"
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

luasnip.add_snippets("typescriptreact", {
  s("hello", {
    t('print("hello world")')
  })
})
