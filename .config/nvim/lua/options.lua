require "nvchad.options"

-- add yours here!

local o = vim.o
local g = vim.g
o.cursorlineopt ='both' -- to enable cursorline!
o.colorcolumn = '+1'
o.textwidth = 80
o.backup = false
o.signcolumn= 'auto'

if g.neovide then
  o.guifont = 'CodeNewRoman Nerd Font:h16'
  o.linespace = 0
end

