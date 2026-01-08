return {
  {
    "mason-org/mason.nvim",
    opts = {},
    dependencies = { "mason-org/mason-registry" }
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls" }
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- config options in after/lsp
      vim.lsp.enable('ruby-lsp')
    end,
    keys = {
      { 'K', vim.lsp.buf.hover, desc = "Hover" },
      { 'gd', vim.lsp.buf.definition, desc = "GoTo Definition" },
      { '<leader>ca', vim.lsp.buf.code_action, desc = "Code Actions" },
      { '<leader>cf', vim.lsp.buf.format, desc = "Format buffer" }
    }
  },
}
