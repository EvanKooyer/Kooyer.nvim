return {
  {
    "mason-org/mason.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
    config = function()
      require("mason").setup()
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "zls", "pyright", "pico8_ls"},
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({})
      lspconfig.zls.setup({})
      lspconfig.pyright.setup({})
      lspconfig.pico8_ls.setup({})

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {desc='LSP Hover'})
      vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {desc='List implementations'})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {desc='Rename all references'})
      vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, {desc='Format by lint/LSP'})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {desc='Code Actions'})
    end,
  },
}
