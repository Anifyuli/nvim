-- Keymaps
-- Keymaps for better default experience
-- Add mapping support with calling vim.keymap.set
local map = vim.keymap.set

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Flutter Tools
map("n", "<leader>F", function()
  require("telescope").extensions.flutter.commands()
end, { desc = "[F]lutter Tools" })

-- Set toggleterm keybind, adapted from AstroNvim config with small addition
map("n", "<leader>Th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", { desc = "ToggleTerm horizontal split" })
map("n", "<leader>Tv", "<cmd>ToggleTerm size=40 direction=vertical<cr>", { desc = "ToggleTerm vertical split" })
map("n", "<leader>Tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "ToggleTerm float" })
map({ "n", "t" }, "<F7>", "<cmd>ToggleTerm<cr>", { desc = "Show/hide ToggleTerm" })

-- Remove Toggleterm buffer
map({ "n", "t" }, "<M-.>", function()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].filetype == "toggleterm" then
      vim.cmd.bdelete({ args = { buf }, bang = true })
    end
  end
end, { desc = "Exit from (all) Toggleterm" })
map({ "n", "t" }, "<M-,>", function()
  local current_buf = vim.api.nvim_get_current_buf()
  local filetype = vim.bo[current_buf].filetype
  if filetype == "toggleterm" then
    vim.cmd("bdelete! " .. current_buf)
  end
end, { noremap = true, desc = "Exit from (active) Toggleterm" })

-- Adjust delete keymaps
map("v", "<Del>", [["_d]], { desc = "Blackhole delete" })

-- Toggle Neotree
map("n", "<leader>e", function()
  require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
end, { desc = "Neotree [E]xplorer" })

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Quit additional keymaps
map("n", "<leader>Q", "<cmd>confirm qall<cr>", { desc = "[Q]uit all" })
map("n", "<leader>n", "<cmd>enew<cr>", { desc = "[N]ew File" })
map("n", "<C-s>", "<cmd>w!<cr>", { desc = "Force write" })
map("n", "<C-q>", "<cmd>qa!<cr>", { desc = "Force quit" })

-- cokeline keymaps
map("n", "<S-Tab>", "<Plug>(cokeline-focus-prev)", { silent = true, desc = "Focus prev buffer" })
map("n", "<Tab>", "<Plug>(cokeline-focus-next)", { silent = true, desc = "Focus next buffer" })
map("n", "<Leader>bp", "<Plug>(cokeline-switch-prev)", { silent = true, desc = "Switch pre buffer" })
map("n", "<Leader>bn", "<Plug>(cokeline-switch-next)", { silent = true, desc = "Switch next buffer" })

for i = 1, 9 do
  map(
    "n",
    ("<leader>b<F%s>"):format(i),
    ("<Plug>(cokeline-focus-%s)"):format(i),
    { silent = true, desc = "Buffer focus " .. i }
  )
  map(
    "n",
    ("<Leader>b%s"):format(i),
    ("<Plug>(cokeline-switch-%s)"):format(i),
    { silent = true, desc = "Buffer switch " .. i }
  )
end

-- Buffer managements
map(
  'n', '<leader>bd',
  function()
    local bd = require('mini.bufremove').delete
    if vim.bo.modified then
      local choice = vim.fn.confirm(('Save changes to %q?'):format(vim.fn.bufname()), '&Yes\n&No\n&Cancel')
      if choice == 1 then -- Yes
        vim.cmd.write()
        bd(0)
      elseif choice == 2 then -- No
        bd(0, true)
      end
    else
      bd(0)
    end
  end, { desc = 'Delete Buffer' })
map('n', '<leader>bD',
  function()
    require('mini.bufremove').delete(0, true)
  end,
  { desc = 'Delete Buffer (Force)' })

-- vim: ts=2 sts=2 sw=2 et
