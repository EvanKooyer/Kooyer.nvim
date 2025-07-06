--This is my first attempt to have my own nvim config that I
--make from scratch, because I want to understand how to make
--a clean neovim config with the least amount of fluff for 
--what i use it for.

--Bring in lazy package manager and other dependencies.
require("config.lazy")

--Setting tab spacing to use 2 spaces.
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

--Set relative line numbers, I prefer this.
vim.cmd("set number")
vim.cmd("set relativenumber")

--Set visual stuff.

--Keybindings
vim.g.mapleader = " "

