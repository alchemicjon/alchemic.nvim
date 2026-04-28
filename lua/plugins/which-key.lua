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
		{
			"<leader>yf",
			function()
				local file = vim.api.nvim_buf_get_name(0)
				if file == "" then
					return
				end

				local root = vim.fn.systemlist({
					"git",
					"-C",
					vim.fn.fnamemodify(file, ":h"),
					"rev-parse",
					"--show-toplevel",
				})[1]
				if not root or root == "" or root:match("fatal:") then
					local rel = vim.fn.expand("%")
					vim.fn.setreg("+", rel)
					print("Copied: " .. rel)
					return
				end

				root = root:gsub("/$", "")
				local rel = file:gsub("^" .. vim.pesc(root .. "/"), "")
				vim.fn.setreg("+", rel)
				print("Copied: " .. rel)
			end,
			desc = "Copy path relative to git root",
			mode = "n",
		},
    {
			"<leader>yl",
			function()
				local file = vim.api.nvim_buf_get_name(0)
				if file == "" then
					return
				end

				local root = vim.fn.systemlist({
					"git",
					"-C",
					vim.fn.fnamemodify(file, ":h"),
					"rev-parse",
					"--show-toplevel",
				})[1]
				if not root or root == "" or root:match("fatal:") then
					local rel = vim.fn.expand("%") .. ":" .. vim.fn.line(".")
					vim.fn.setreg(vim.v.register, rel)
					print("Copied: " .. rel)
					return
				end

				root = root:gsub("/$", "")
				local rel = file:gsub("^" .. vim.pesc(root .. "/"), "") .. ":" .. vim.fn.line(".")
				vim.fn.setreg(vim.v.register, rel)
				print("Copied: " .. rel)
			end,
			desc = "Copy path & line number relative to git root",
			mode = "n",
		},
	},
}
