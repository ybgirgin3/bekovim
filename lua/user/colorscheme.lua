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
    vim.cmd.colorscheme('koehler')
    -- require('solarized-osaka').setup {
    --     -- transparent = true
    -- }
    -- require('solarized-osaka').load()
    -- vim.cmd.colorscheme('onedark')
    -- require('onedark').setup {
    --     style = 'deep'
    -- }
    -- require('onedark').load()
end

return M
