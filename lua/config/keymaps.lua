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

vim.keymap.set('n', '<leader>l', vim.diagnostic.setloclist, { desc = 'Open diagnostic quickfix [L]ist' })
