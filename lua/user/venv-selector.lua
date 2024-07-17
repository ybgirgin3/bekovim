local M = {
	"linux-cultist/venv-selector.nvim",
	dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
	lazy = true,
}

function M.config()
	require("venv-selector").setup({
		name = "venv",
		auto_refresh = true,
	})
end

return M
