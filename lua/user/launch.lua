local function prefer_bin_from_venv(executable_name)
  -- Return the path to the executable if $VIRTUAL_ENV is set and the binary exists somewhere beneath the $VIRTUAL_ENV path, otherwise get it from Mason
  if vim.env.VIRTUAL_ENV then
    local paths = vim.fn.glob(vim.env.VIRTUAL_ENV .. "/**/bin/" .. executable_name, true, true)
    local executable_path = table.concat(paths, ", ")
    if executable_path ~= "" then
      -- vim.api.nvim_echo(
      -- 	{ { "Using path for " .. executable_name .. ": " .. executable_path, "None" } },
      -- 	false,
      -- 	{}
      -- )
      return executable_path
    end
  end

  local mason_registry = require("mason-registry")
  local mason_path = mason_registry.get_package(executable_name):get_install_path() .. "/venv/bin/" .. executable_name
  -- vim.api.nvim_echo({ { "Using path for " .. executable_name .. ": " .. mason_path, "None" } }, false, {})
  return mason_path
end


LAZY_PLUGIN_SPEC = {
    -- add LazyVim and import its plugins
    -- {
    --     "LazyVim/LazyVim",
        -- import = "lazyvim.plugins",
    --     opts = {
    --         colorscheme = "solarized-osaka",
    --         news = {
    --             lazyvim = true,
    --             neovim = true,
    --         },
    --     },
    -- },
    -- import any extras modules here
    -- { import = "plugins" },

  --   {
  --   "nvimtools/none-ls.nvim",
  --   enabled = false,
  --   dependencies = { "mason.nvim" },
  --   event = { "BufReadPre", "BufNewFile" },
  --   opts = function(_, opts)
  --     local null_ls = require("null-ls")
  --     local formatting = null_ls.builtins.formatting
  --     local diagnostics = null_ls.builtins.diagnostics
  --     local code_actions = null_ls.builtins.code_actions
  --
  --     local sources = {
  --       -- list of supported sources:
  --       -- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
  --
  --       -- python
  --       formatting.black.with({
  --         filetypes = { "python" },
  --         command = prefer_bin_from_venv("black"),
  --       }),
  --       diagnostics.mypy.with({
  --         filetypes = { "python" },
  --         command = prefer_bin_from_venv("mypy"),
  --       }),
  --
  --       -- lua
  --       formatting.stylua.with({
  --         extra_args = { "--indent-type", "Spaces", "--indent-width", "2" },
  --       }),
  --
  --       -- shell
  --       formatting.shfmt,
  --       diagnostics.shellcheck,
  --       code_actions.shellcheck,
  --
  --     }
  --
  --     -- extend opts.sources
  --     for _, source in ipairs(sources) do
  --       table.insert(opts.sources, source)
  --     end
  --
  --     -- always remove from opts.sources (e.g. added by lazy.lua extras)
  --     local remove_sources = { "goimports_reviser" }
  --     opts.sources = vim.tbl_filter(function(source)
  --       return not vim.tbl_contains(remove_sources, source.name)
  --     end, opts.sources)
  --   end,
  -- }
}

function spec(item)
  table.insert(LAZY_PLUGIN_SPEC, { import = item })
end
