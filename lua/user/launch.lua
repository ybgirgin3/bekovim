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
}

function spec(item)
  table.insert(LAZY_PLUGIN_SPEC, { import = item })
end
