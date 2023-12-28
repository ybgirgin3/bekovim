return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
                -- others
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,

				-- python
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,

                -- go
                null_ls.builtins.formatting.goimports,
                null_ls.builtins.formatting.gofumpt,
                null_ls.builtins.formatting.gofmt
			},
		})
		vim.keymap.set("n", "<leader>bf", vim.lsp.buf.format, {})
	end,
}

-- local M = {
--   "jose-elias-alvarez/null-ls.nvim",
-- }
--
-- function M.config()
--   local null_ls = require "null-ls"
--
--   local formatting = null_ls.builtins.formatting
--
--   null_ls.setup {
--     sources = {
--       formatting.stylua,
--       formatting.prettier,
--       formatting.prettier.with {
--         extra_filetypes = { "toml" },
--         -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
--       },
--       -- null_ls.builtins.diagnostics.eslint,
--       null_ls.builtins.completion.spell,
--     },
--   }
-- end
--
-- return M
