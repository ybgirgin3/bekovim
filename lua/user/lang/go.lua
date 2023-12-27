local M = {
    "fatih/vim-go",
    event= 'VeryLazy',
    -- dependencies = {
    --     'mattn/vim-goimports'
    -- }
}


function M.config()
    -- local goimports = require("goimports")
    -- local gopls = require("gopls")

    vim.cmd('autocmd FileType go compiler go')
    vim.g.go_fmt_command = 'goimports'
    vim.g.goimports = 1 -- enable autoformat
    vim.g.go_highlight_types = 1
    vim.g.go_highlight_fields = 1
    vim.g.go_highlight_functions = 1
    vim.g.go_highlight_function_calls = 1
    vim.g.go_def_mode = 'gopls'
    vim.g.go_info_mode = 'gopls'
    vim.g.go_auto_type_info = 1
    vim.g.go_auto_sameids = 1

  local lspconfig = require'lspconfig'
  local configs = require'lspconfig/configs'

  if not lspconfig.gopls then
    configs.gopls = {
      default_config = {
        cmd = {'gopls', 'serve'},
        root_dir = lspconfig.util.root_pattern('go.mod', '.git'),
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
          },
        },
      },
    }
  end

  lspconfig.gopls.setup{}
end

return M
