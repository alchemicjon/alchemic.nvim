return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  opts = {
    auto_install = true,
    highlight = { enabled = true },
    indent = { enabled = true }
  },
  config = function(_, opts)
    local parsers = {
      "bash",
      "embedded_template",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "ruby",
      "tsx",
      "typescript",
      "vim",
      "yaml",
      "zsh",
    }
    local config = require("nvim-treesitter.configs")
    config.setup(opts)
    vim.api.nvim_create_autocmd('FileType', {
      pattern = parsers,
      callback = function() vim.treesitter.start() end,
    })
  end
}
