
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "netrw",
    "Jaq",
    "qf",
    "git",
    "help",
    "man",
    "lspinfo",
    "spectre_panel",
    "lir",
    "DressingSelect",
    "tsplayground",
    "",
  },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]]
  end,
})

vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
  callback = function()
    vim.cmd "quit"
  end,
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd "checktime"
  end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 40 }
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown", "NeogitCommitMessage" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- undercurl
vim.cmd([[let &t_Cs = "\e[4:3m]"]])
vim.cmd([[let &t_Ce = "\e[4:0m]"]])


-- -- update tmux tab name
-- vim.api.nvim_create_autocmd({'BufReadPost', 'FileReadPost', 'BufNewFile', 'BufEnter'}, {
--     pattern = { "*" },
--     callback = function ()
--         vim.cmd(':silent !tmux rename-window bekovim_' .. vim.fn.expand('%:t'))
--         -- vim.cmd(string.format(':silent !tmux rename-window (%s)'), vim.fn.expand('%:t'))
--     end
-- })
--
-- -- rename to default after leave vim
-- vim.api.nvim_create_autocmd({'VimLeave'}, {
--     pattern = { "*" },
--     callback = function ()
--         vim.cmd(":!tmux set-window-option automatic-rename on")
--     end
-- })
--
-- colorscheme mods
vim.api.nvim_create_autocmd({'BufReadPost', 'FileReadPost', 'BufNewFile', 'BufEnter', 'Colorscheme'}, {
    pattern = { "*" },
    callback = function ()
        vim.api.nvim_set_hl(0, "Normal", { fg = "#ffffff", underline = false })
        vim.api.nvim_set_hl(0, "Comment", { fg = "#4caf50", underline = false, bold = true })
    end

})

-- gitsigns
vim.api.nvim_create_autocmd({'VimEnter'}, {
    pattern = {"*"},
    callback = function ()
        vim.cmd(":Gitsigns toggle_current_line_blame")
    end
})

-- symbols-outline
vim.api.nvim_create_autocmd({'VimEnter'}, {
    pattern = {"*"},
    callback = function ()
        vim.cmd(":SymbolsOutline")
    end
})
