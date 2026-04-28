-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   lazy = false,
--   priority = 1000,
--   opts = {
--     show_end_of_buffer = true,
--     flavour = "macchiato",
--   },
--   config = function(_, opts)
--     require("catppuccin").setup(opts)
--     vim.cmd([[colorscheme catppuccin]])
--   end
-- }

return {
	"sainnhe/everforest",
	lazy = false,
	priority = 1000,
	config = function()
		-- Optionally configure and load the colorscheme
		-- directly inside the plugin declaration.
		vim.g.everforest_enable_italic = true
    vim.cmd("set background=dark")
		vim.cmd.colorscheme("everforest")
	end,
}
