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
--   "eldritch-theme/eldritch.nvim",
--   lazy = false,
--   priority = 1000,
-- }

-- local M = {
--     'craftzdog/solarized-osaka.nvim',
--     priority = 1000,
--     lazy = false,
-- }

-- local M = {
-- 	"Mofiqul/dracula.nvim",
-- 	priority = 1000,
-- 	lazy = false,
-- }

function M.config()
	-- DEFAULT ONE
	-- vim.cmd.colorscheme('koehler')

	-- dracula
	-- require("dracula").load()
	-- require("dracula").setup({
	-- 	-- customize dracula color palette
	-- 	colors = {
	-- 		bg = "#282A36",
	-- 		fg = "#F8F8F2",
	-- 		selection = "#44475A",
	-- 		comment = "#6272A4",
	-- 		red = "#FF5555",
	-- 		orange = "#FFB86C",
	-- 		yellow = "#F1FA8C",
	-- 		green = "#50fa7b",
	-- 		purple = "#BD93F9",
	-- 		cyan = "#8BE9FD",
	-- 		pink = "#FF79C6",
	-- 		bright_red = "#FF6E6E",
	-- 		bright_green = "#69FF94",
	-- 		bright_yellow = "#FFFFA5",
	-- 		bright_blue = "#D6ACFF",
	-- 		bright_magenta = "#FF92DF",
	-- 		bright_cyan = "#A4FFFF",
	-- 		bright_white = "#FFFFFF",
	-- 		menu = "#21222C",
	-- 		visual = "#3E4452",
	-- 		gutter_fg = "#4B5263",
	-- 		nontext = "#3B4048",
	-- 		white = "#ABB2BF",
	-- 		black = "#191A21",
	-- 	},
	-- 	-- show the '~' characters after the end of buffers
	-- 	show_end_of_buffer = true, -- default false
	-- 	-- use transparent background
	-- 	transparent_bg = true, -- default false
	-- 	-- set custom lualine background color
	-- 	lualine_bg_color = "#44475a", -- default nil
	-- 	-- set italic comment
	-- 	italic_comment = true, -- default false
	-- 	-- overrides the default highlights with table see `:h synIDattr`
	-- 	overrides = {},
	-- 	-- You can use overrides as table like this
	-- 	-- overrides = {
	-- 	--   NonText = { fg = "white" }, -- set NonText fg to white
	-- 	--   NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
	-- 	--   Nothing = {} -- clear highlight of Nothing
	-- 	-- },
	-- 	-- Or you can also use it like a function to get color from theme
	-- 	-- overrides = function (colors)
	-- 	--   return {
	-- 	--     NonText = { fg = colors.white }, -- set NonText fg to white of theme
	-- 	--   }
	-- 	-- end,
	-- })

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

	-- vim.cmd.colorscheme('eldritch')
	-- require("eldritch").setup({
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- transparent = false, -- Enable this to disable setting the background color
	-- terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
	-- styles = {
	-- Style to be applied to different syntax groups
	-- Value is any valid attr-list value for `:help nvim_set_hl`
	-- comments = { italic = true },
	-- keywords = { italic = true },
	-- functions = {},
	-- variables = {},
	-- Background styles. Can be "dark", "transparent" or "normal"
	-- sidebars = "dark", -- style for sidebars, see below
	-- floats = "dark", -- style for floating windows
	-- },
	-- sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
	-- hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
	-- dim_inactive = false, -- dims inactive windows, transparent must be false for this to work
	-- lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

	--- You can override specific color groups to use other groups or a hex color
	--- function will be called with a ColorScheme table
	---@param colors ColorScheme
	-- on_colors = function(colors) end,

	--- You can override specific highlights to use other groups or a hex color
	--- function will be called with a Highlights and ColorScheme table
	---@param highlights Highlights
	---@param colors ColorScheme
	-- on_highlights = function(highlights, colors) end,
	-- })
end

return M
