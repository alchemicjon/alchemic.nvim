require('common.functions')

vim.pack.add { Gh('folke/which-key.nvim') }
require('which-key').setup {
  -- Delay between pressing a key and opening which-key (milliseconds)
  delay = 0,
  icons = { mappings = vim.g.have_nerd_font },
  -- Document existing key chains
  spec = {
    { '<leader>b', group = '[B]uffers', mode = { 'n' } },
    { '<leader>c', group = '[C]ode Actions' },
    { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } }, -- Enable gitsigns recommended keymaps first
    { '<leader>p', group = 'Vim [P]ack', mode = { 'n' } },
    { '<leader>s', group = '[S]earch', mode = { 'n', 'v' } },
    { '<leader>t', group = '[T]oggle' },
    { '<leader>y', group = '[Y]ank' },
    { 'gr', group = 'LSP Actions', mode = { 'n' } },
  },
}
