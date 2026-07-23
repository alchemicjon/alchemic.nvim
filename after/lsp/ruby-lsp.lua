-- on Linux and macOS the default location is ~/.config/nvim/lsp/ruby-lsp.lua
return {
  cmd = { vim.fn.expand("~/.asdf/shims/ruby-lsp") },
  root_markers = { ".git", "Gemfile" },
  filetypes = { "ruby", "eruby" },
  init_options = {
    formatter = 'rubocop',
    linters = { 'rubocop' },
    addonSettings = {
      ["Ruby LSP Rails"] = {
        enablePendingMigrationsPrompt = false,
      },
    },
  },
}

