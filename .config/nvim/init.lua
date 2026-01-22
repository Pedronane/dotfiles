vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.wrap = false
vim.o.cursorcolumn = false
vim.o.shiftwidth = 2
vim.opt.scrolloff = 8
vim.o.smartindent = true
vim.o.ignorecase = true
vim.o.tabstop = 2
vim.o.swapfile = false
vim.o.winborder = "rounded"
vim.opt.guicursor = "n-v-c-i:block"
vim.g.mapleader = " "

vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>')
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>d', '"+d<CR>')
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>s', ':e #<CR>')
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>S', ':sf #<CR>')

vim.pack.add({
	{ src = 'https://github.com/kdheepak/monochrome.nvim' },
	{ src = 'https://github.com/stevearc/oil.nvim' },
	{ src = 'https://github.com/echasnovski/mini.pick' },
	{ src = 'https://github.com/mason-org/mason.nvim' },
	{ src = 'https://github.com/folke/zen-mode.nvim' },
})

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client then
			if client:supports_method('textDocument/completion') then
				vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
			end
		end
	end,
})

vim.cmd("set completeopt+=noselect")

require "mini.pick".setup()
require "oil".setup()
require "mason".setup()
require "zen-mode".setup()

vim.keymap.set('n', '<leader>f', ":Pick files<CR>")
vim.keymap.set('n', '<leader>h', ":Pick help<CR>")
vim.keymap.set('n', '<leader>e', ":Oil<CR>")
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

vim.keymap.set({ 'n', 'v' }, "<leader>zz", function()
	require("zen-mode").setup {
		window = {
			width = 90,
			options = {}
		},
	}
	require("zen-mode").toggle()
	vim.wo.wrap = false
	vim.wo.number = true
	vim.wo.rnu = true
end)

vim.lsp.enable("lua_ls")
vim.lsp.enable("intelephense")

vim.cmd('colorscheme monochrome')
vim.cmd(":hi statusline guibg=NONE")
