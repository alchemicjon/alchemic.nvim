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
      { "<leader>qq", "<cmd>qa<cr>", desc = "Quit All", mode = "n" }
    }
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
        vim.fn.setreg(vim.v.register, vim.fn.expand("%") .. ":" .. vim.fn.line("."))
      end,
      desc = "Copy relative filename+line to clipboard",
      mode = "n"
    },
  },
}
