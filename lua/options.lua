-- Options for random options I want to be set.
--

--Setting tab spacing to use 2 spaces.
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

--Set relative line numbers, I prefer this.
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true

--Configure splits to open to the right and/or below
vim.o.splitright = true
vim.o.splitbelow = true

--Minimal number of lines to keep on screen when scrolling with cursor
vim.o.scrolloff = 10
vim.cmd.colorscheme "retrobox"

--Set visual stuff.
vim.g.have_nerd_font = true

--Add custom filetypes for detection
vim.filetype.add({ extension = { p8 = 'p8' } })
