return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		spec = {
			{ "<leader>y", group = "Copy/Paste" },
			{ "<leader>q", group = "Session / Quit" },
			{ "<leader>d", group = "DAP" },
			{ "<leader>qq", "<cmd>qa<cr>", desc = "Quit All", mode = "n" },
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
