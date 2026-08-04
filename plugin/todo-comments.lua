-- Highlight todo, notes, etc in comments
require('common.functions')

vim.pack.add { Gh('folke/todo-comments.nvim') }
require('todo-comments').setup()
