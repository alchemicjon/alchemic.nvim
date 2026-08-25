require('common.functions')

vim.pack.add { Gh('folke/which-key.nvim') }
require('which-key').setup {
  -- Delay between pressing a key and opening which-key (milliseconds)
  delay = 0,
  icons = { mappings = vim.g.have_nerd_font },
  -- Document existing key chains
  spec = {
    { '<leader>b', group = '[b]uffers', mode = { 'n' } },
    { '<leader>c', group = '[c]ode actions' },
    { '<leader>h', group = 'git [h]unk', mode = { 'n', 'v' } }, -- Enable gitsigns recommended keymaps first
    { '<leader>o', group = '[o]pen', mode = { 'n' } },
    { '<leader>p', group = 'vim [p]ack', mode = { 'n' } },
    { '<leader>s', group = '[s]earch', mode = { 'n', 'v' } },
    { '<leader>t', group = '[t]oggle' },
    { '<leader>u', group = 'c[u]rl', mode = { 'n' } },
    { '<leader>y', group = '[y]ank' },
  },
}
