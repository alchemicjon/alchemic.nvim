require('common.functions')

vim.pack.add({ Gh('oysandvik94/curl.nvim') })

local curl = require("curl")
curl.setup({})

vim.keymap.set("n", "<leader>ut", function()
    curl.open_curl_tab()
end, { desc = "c[u]rl [t]ab" })

vim.keymap.set("n", "<leader>uT", function()
    curl.open_global_tab()
end, { desc = "c[u]rl [T]ab in global scope" })

-- These commands will prompt you for a name for your collection
vim.keymap.set("n", "<leader>uc", function()
      curl.create_scoped_collection()
end, { desc = "c[u]rl [c]reate scoped collection" })

vim.keymap.set("n", "<leader>uC", function()
      curl.create_global_collection()
end, { desc = "c[u]rl [C]reate global collection" })

vim.keymap.set("n", "<leader>us", function()
      curl.pick_scoped_collection()
end, { desc = "c[u]rl [s]earch for scoped collection" })

vim.keymap.set("n", "<leader>uS", function()
      curl.pick_global_collection()
end, { desc = "c[u]rl [S]earch for global collection" })
