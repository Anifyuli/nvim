-- Options

local g = vim.g
local opt = vim.opt

-- Leader key support
g.mapleader = ' '
g.maplocalleader = ' '
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Set highlight on search
opt.hlsearch = false

-- Make line numbers default
opt.number = true

-- Enable mouse mode
opt.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
opt.clipboard = 'unnamedplus'

-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
opt.ignorecase = true
opt.smartcase = true

-- Keep signcolumn on by default
opt.signcolumn = 'yes'

-- Decrease update time
opt.updatetime = 250
opt.timeoutlen = 300

-- Set completeopt to have a better completion experience
opt.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
opt.termguicolors = true

-- Import from LazyVim.options
opt.confirm = true     -- Confirm to save changes before exiting modified buffer
opt.cursorline = true  -- Enable highlighting of the current line
opt.expandtab = true   -- Use spaces instead of tabs
opt.shiftwidth = 2     -- Size of an indent
opt.signcolumn = 'yes' -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true   -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.tabstop = 2        -- Number of spaces tabs count for
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.wrap = true

-- Hide ~ in left side
opt.fillchars:append({
  eob = ' ',
})

-- Hide cmdline
opt.cmdheight = 0

-- Add auto adjust window size
opt.equalalways = true

-- Configure dart-vim-plugin
g.dart_style_guide = 2
g.dart_format_on_save = false

-- vim: ts=2 sts=2 sw=2 et
