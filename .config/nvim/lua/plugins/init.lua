local lazy = require "lazy"
return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css", "json",
        "jsonc", "html", "python"
  		},
  	},
  },
  {
    "yianwillis/vimcdoc",
     lazy = true
  },
  {
    "gentoo/gentoo-syntax",
	lazy = false
  },

  {
    "voldikss/vim-translator",
    lazy = false
  },

  {
  'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    ft = { 'org' },
    config = function()
    -- Setup orgmode
      require('orgmode').setup({
        org_agenda_files = '~/orgfiles/**/*',
        org_default_notes_file = '~/orgfiles/refile.org',
      })

    -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
    -- add ~org~ to ignore_install
    -- require('nvim-treesitter.configs').setup({
    --   ensure_installed = 'all',
    --   ignore_install = { 'org' },
    -- })
    end,
  },
  {
    "nvim-orgmode/org-bullets.nvim",
    event = 'VeryLazy',
    ft = { 'org' },
    config = function ()
        require("org-bullets").setup ({
          concealcursor = false, -- If false then when the cursor is on a line underlying characters are visible
          symbols = {
          -- list symbol
            list = "+",
            -- headlines can be a list
            headlines = { "◉", "○", "✸", "✿" },
            -- or a function that receives the defaults and returns a list
            -- headlines = function(default_list)
            --   table.insert(default_list, "♥")
            --   return default_list
            -- end,
            -- -- or false to disable the symbol. Works for all symbols
            -- headlines = false,
            -- or a table of tables that provide a name
            -- and (optional) highlight group for each headline level
            -- headlines = {
            --   { "◉", "MyBulletL1" },
            --   { "○", "MyBulletL2" },
            --   { "✸", "MyBulletL3" },
            --   { "✿", "MyBulletL4" },
            -- },
            checkboxes = {
              half = { "", "@org.checkbox.halfchecked" },
              done = { "✓", "@org.keyword.done" },
              todo = { "˟", "@org.keyword.todo" },
            },
          }
        })
    end
  },
  {
  "epwalsh/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
    dependencies = {
    -- Required.
      "nvim-lua/plenary.nvim",
    -- see below for full list of optional dependencies 👇
    },
    opts = {

      workspaces = {
        {
          name = "work",
          path = "~/Documents/Obsidian Vault/",
        },
      },
    -- see below for full list of options 👇
    },
  }
}
