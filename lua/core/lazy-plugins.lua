require('lazy').setup({
    {
      -- Gruvbox colorscheme
      'ellisonleao/gruvbox.nvim',
      lazy = false,
      priority = 1000,
      config = function()
        vim.cmd([[colorscheme gruvbox]])
      end,
      opts = {
        italic = {
          strings = true,
          comments = true,
          folds = true,
          operations = false,
        },
        contrast = 'soft',
      },
    },
    -- Import plugins configurations
    { import = '../plugins' },
    -- Import specific programming languages configurations
    { import = '../plugins/lang' },
  },
  {
    install = {
      colorscheme = { "gruvbox" },
    },
    ui = {
      -- If you have a Nerd Font, set icons to an empty table which will use the
      -- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
      icons = vim.g.have_nerd_font and {} or {
        cmd = ' ',
        config = ' ',
        event = '󰃮 ',
        ft = ' ',
        init = ' ',
        keys = '󰌋 ',
        plugin = ' ',
        runtime = ' ',
        require = ' ',
        source = '󰈙 ',
        start = '󱓞 ',
        task = '󰐃 ',
        lazy = '󰒲 ',
      },
    },
  })

-- vim: ts=2 sts=2 sw=2 et
