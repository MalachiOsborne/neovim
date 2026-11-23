vim.g.mapleader = " "
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex, { desc = "Opens Explorer" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format buffer" })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

--this is for folding (collapsing code), all ai slop

-- Group your view-related autocommands
local view_group = vim.api.nvim_create_augroup("AutoSaveFolds", { clear = true })

-- Automatically save views (including folds) when closing a buffer/window
vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
	pattern = "*",
	callback = function()
		-- Only save view if the buffer has a name and is a normal file
		if vim.fn.empty(vim.fn.expand("%:p")) == 0 and vim.bo.buftype == "" then
			pcall(vim.cmd, "mkview")
		end
	end,
})

-- Automatically load views when entering a buffer/window
vim.api.nvim_create_autocmd("BufWinEnter", {
	group = view_group,
	pattern = "*",
	command = "silent! loadview",
})
