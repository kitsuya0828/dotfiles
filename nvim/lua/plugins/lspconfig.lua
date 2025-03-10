return {
	"neovim/nvim-lspconfig",
	event = "BufReadPre",
	dependencies = {
		{
			"williamboman/mason.nvim",
			config = function()
				require("mason").setup()
			end,
		},
		{
			"williamboman/mason-lspconfig.nvim",
			config = function()
				local lspconfig = require("lspconfig")
				require("mason-lspconfig").setup({
					ensure_installed = {
						"gopls",
						"pyright",
						"rust_analyzer",
                        "terraformls",
						"ts_ls",
                        "yamlls",
					},
				})
				require("mason-lspconfig").setup_handlers({
					function(server_name)
						lspconfig[server_name].setup({})
					end,
				})
			end,
		},
	},
}
