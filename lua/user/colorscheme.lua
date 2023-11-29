local M = {
    'navarasu/onedark.nvim',
    lazy = false,
    priority = 1000,
}

function M.config()
    -- vim.cmd.colorscheme('onedark')
    require('onedark').setup {
        style = 'deep'
    }
    require('onedark').load()
end

return M
