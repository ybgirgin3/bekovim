-- local M = {
--     'navarasu/onedark.nvim',
--     lazy = false,
--     priority = 1000,
-- }

local M = {
	"askfiy/visual_studio_code",
	lazy = false,
	priority = 1000,
}

-- local M = {
--     'craftzdog/solarized-osaka.nvim',
--     lazy = false,
--
-- }

function M.config()
	-- DEFAULT ONE
	-- vim.cmd.colorscheme('koehler')

	-- SOLARIZED OSAKA
	-- require('solarized-osaka').setup {
	--     transparent = true
	-- }
	-- require('solarized-osaka').load()
	--
	-- -- ONEDARK
	-- vim.cmd.colorscheme('onedark')
	-- require('onedark').setup {
	--     style = 'deep'
	-- }
	-- require('onedark').load()

	-- VSCODE
	vim.cmd.colorscheme("visual_studio_code")
	require("visual_studio_code").setup({
		-- `dark` or `light`
		mode = "dark",
		-- Whether to load all color schemes
		preset = true,
		-- Whether to enable background transparency
		transparent = false,
		-- Whether to apply the adapted plugin
		expands = {
			hop = true,
			dbui = true,
			lazy = true,
			aerial = true,
			null_ls = true,
			nvim_cmp = true,
			gitsigns = true,
			which_key = true,
			nvim_tree = true,
			lspconfig = true,
			telescope = true,
			bufferline = true,
			nvim_navic = true,
			nvim_notify = true,
			vim_illuminate = true,
			nvim_treesitter = true,
			nvim_ts_rainbow = true,
			nvim_scrollview = true,
			nvim_ts_rainbow2 = true,
			indent_blankline = true,
			vim_visual_multi = true,
		},
		hooks = {
			before = function(conf, colors, utils) end,
			after = function(conf, colors, utils) end,
		},
	})
end

return M
