--[[
======================================
KEYMAPS
Basic / global keymaps
======================================
--]]

-- Clear search and stop snippet on escape
vim.keymap.set({ "i", "n", "s" }, "<esc>", function()
  vim.cmd("noh")
  return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })

-- copy file path relative to git root
vim.keymap.set("n", "<leader>yf", function()
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
end, { desc = "Copy path relative to git root" })

-- copy file path and line number relative to git root
vim.keymap.set("n", "<leader>yl", function()
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
end, { desc = "Copy path & line number relative to git root" })

-- Diagnostic Config & Keymaps
--  See `:help vim.diagnostic.Opts`
vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = { min = vim.diagnostic.severity.WARN } },

  -- Can switch between these as you prefer
  virtual_text = false, -- Text shows up at the end of the line
  virtual_lines = true, -- Text shows up underneath the line, with virtual lines

  -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
  jump = {
    on_jump = function(_, bufnr)
      vim.diagnostic.open_float {
        bufnr = bufnr,
        scope = 'cursor',
        focus = false,
      }
    end,
  },
}

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})
