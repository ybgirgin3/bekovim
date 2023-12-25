-- local M = {
--     'navarasu/onedark.nvim',
--     lazy = false,
--     priority = 1000,
-- }

local M = {
    'craftzdog/solarized-osaka.nvim',
    lazy = false,

}

function M.config()
    -- DEFAULT ONE
    -- vim.cmd.colorscheme('koehler')

    -- SOLARIZED OSAKA
    require('solarized-osaka').setup {
        transparent = true
    }
    require('solarized-osaka').load()

    -- ONEDARK
    -- vim.cmd.colorscheme('onedark')
    -- require('onedark').setup {
    --     style = 'deep'
    -- }
    -- require('onedark').load()
end

return M
