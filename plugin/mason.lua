require('common.functions')

vim.pack.add({ Gh('mason-org/mason.nvim') })

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})
