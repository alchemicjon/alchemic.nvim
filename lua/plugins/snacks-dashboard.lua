return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = [[
    ▄▄     ▄▄▄▄                ▄▄                               ██               ▄▄    ▄▄     ██              
   ████    ▀▀██                ██                               ▀▀               ▀██  ██▀     ▀▀              
   ████      ██       ▄█████▄  ██▄████▄   ▄████▄   ████▄██▄   ████      ▄█████▄   ██  ██    ████     ████▄██▄ 
  ██  ██     ██      ██▀    ▀  ██▀   ██  ██▄▄▄▄██  ██ ██ ██     ██     ██▀    ▀   ██  ██      ██     ██ ██ ██ 
  ██████     ██      ██        ██    ██  ██▀▀▀▀▀▀  ██ ██ ██     ██     ██          ████       ██     ██ ██ ██ 
 ▄██  ██▄    ██▄▄▄   ▀██▄▄▄▄█  ██    ██  ▀██▄▄▄▄█  ██ ██ ██  ▄▄▄██▄▄▄  ▀██▄▄▄▄█    ████    ▄▄▄██▄▄▄  ██ ██ ██ 
 ▀▀    ▀▀     ▀▀▀▀     ▀▀▀▀▀   ▀▀    ▀▀    ▀▀▀▀▀   ▀▀ ▀▀ ▀▀  ▀▀▀▀▀▀▀▀    ▀▀▀▀▀     ▀▀▀▀    ▀▀▀▀▀▀▀▀  ▀▀ ▀▀ ▀▀ 
 ]],
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          function()
            local in_git = Snacks.git.get_root() ~= nil
            local review_count = os.execute('gh pr list --search "is:open is:pr review-requested:@me" --json number | jq length')
            local cmds = {
              {
                desc = "Github: Review Requests (" .. review_count .. ")",
                cmd = 'gh pr list -L 3 --search "is:open is:pr review-requested:@me"',
                action = function()
                  vim.fn.jobstart('gh pr list --search "is:open is:pr review-requested:@me" --web', { detach = true })
                end,
                key = "h",
                icon = " ",
              },
              {
                desc = "Github: My Pull Requests",
                cmd = 'gh pr list --assignee "@me"',
                key = "p",
                action = function()
                  vim.fn.jobstart('gh pr list --assignee "@me" --web', { detach = true })
                end,
                icon = " ",
              },
            }
            return vim.tbl_map(function(cmd)
              return vim.tbl_extend("force", {
                enabled = in_git,
              }, cmd)
            end, cmds)
          end,
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
    },
  },
}
