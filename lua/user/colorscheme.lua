local M = {
    'Lunarvim/primer.nvim',
    lazy = false,
    priority = 1000,
    commit = "b8d7e08eed9a61eb2f49b9196b01f7f2932735ff",
}

function M.config()
    vim.cmd.colorscheme('peachpuff')
end

return M
