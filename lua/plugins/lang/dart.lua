return {
  -- Dart formatting support
  {
    'dart-lang/dart-vim-plugin',
    enabled = true,
  },
  -- Flutter tools
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    enabled = true,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = true,
    opts = {
      decorations = {
        statusline = {
          device = true,
        },
      },
      dev_log = {
        enabled = true,
        notify_errors = false,
        open_cmd = 'tabedit',
      },
      dev_tools = {
        autostart = false,
        auto_open_browser = false,
      },
      outline = {
        open_cmd = '30vnew',
        auto_open = false,
      },
      settings = {
        showTodos = true,
        completeFunctionCalls = true,
        renameFilesWithClasses = 'prompt', -- 'always'
        enableSnippets = true,
        updateImportsOnRename = true,
      },
    },
  }
}
