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
