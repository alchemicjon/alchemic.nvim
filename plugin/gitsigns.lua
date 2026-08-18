require('common.functions')

vim.pack.add({ Gh('lewis6991/gitsigns.nvim') })

require('gitsigns').setup {
  word_diff = true,
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end,
    { desc = "next git hunk" }
    )

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end,
    { desc = "previous git hunk" }
    )

    -- Actions
    map('n', '<leader>hs', gitsigns.stage_hunk, { desc = "git [h]unk [s]tage" })
    map('n', '<leader>hr', gitsigns.reset_hunk, { desc = "git [h]unk [r]eset"})

    map('v', '<leader>hs', function()
      gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end,
    { desc = "git [h]unk [s]tage" }
    )

    map('v', '<leader>hr', function()
      gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end,
    { desc = "git [h]unk [r]eset" }
    )

    map('n', '<leader>hS', gitsigns.stage_buffer, { desc = "git [h]unk [S]tage buffer" })
    map('n', '<leader>hR', gitsigns.reset_buffer, { desc = "git [h]unk [R]eset buffer" })
    map('n', '<leader>hp', gitsigns.preview_hunk, { desc = "git [h]unk [p]review hunk" })
    map('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = "git [h]unk preview hunk [i]nline" })

    map('n', '<leader>hb', function() gitsigns.blame_line({ full = true }) end, { desc = "git [h]unk [b]lame line" })
    map('n', '<leader>hB', gitsigns.blame, { desc = 'git [h]unk blame [B]uffer' })

    map('n', '<leader>hd', gitsigns.diffthis)
    map('n', '<leader>hD', function() gitsigns.diffthis('~') end)

    map('n', '<leader>hQ', function() gitsigns.setqflist('all') end)
    map('n', '<leader>hq', gitsigns.setqflist)

    -- Toggles
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
    map('n', '<leader>tw', gitsigns.toggle_word_diff)

    -- Text object
    map({'o', 'x'}, 'ih', gitsigns.select_hunk)
  end
}
