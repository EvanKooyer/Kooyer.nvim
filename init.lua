--This is my first attempt to have my own nvim config that I
--make from scratch, because I want to understand how to make
--a clean neovim config with the least amount of fluff for
--what i use it for.

--Set Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Bring in lazy package manager and other dependencies.
require("config.lazy")

--load options
require('options')

--General Keymaps
require("keymaps")
