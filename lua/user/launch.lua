
LAZY_PLUGIN_SPEC = {
    {
        "yorik1984/lualine-theme.nvim",
        dependencies =  {
            "nvim-lualine/lualine.nvim",
        },
    }
}

function spec(item)
  table.insert(LAZY_PLUGIN_SPEC, { import = item })
end
