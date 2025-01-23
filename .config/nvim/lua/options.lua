require "nvchad.options"

-- add yours here!

local o = vim.o
local g = vim.g
o.cursorlineopt ='both' -- to enable cursorline!
o.colorcolumn = '+1'
o.textwidth = 79
o.backup = false
o.signcolumn= 'auto'

if g.neovide then
  o.guifont = 'Firacode Nerd Font:h15'
  o.linespace = 2
end

