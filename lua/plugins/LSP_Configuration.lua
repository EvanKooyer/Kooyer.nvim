return {
  {
    "mason-org/mason.nvim",
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
    ft = { "lua", "python", "zig", "pico8" },
    config = function()
      local lspconfig = require("lspconfig")
      local on_attach = function(_, bufnr)
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end
        map("n", "K", vim.lsp.buf.hover, "LSP Hover")
        map("n", "<leader>gD", vim.lsp.buf.declaration, "Go to declaration")
        map("n", "<leader>gd", vim.lsp.buf.definition, "Go to definition")
        map("n", "<leader>gi", vim.lsp.buf.implementation, "List implementations")
        map("n", "<leader>gr", vim.lsp.buf.references, "List References")
        map("n", "<leader>rn", vim.lsp.buf.rename, "Rename all references")
        map("n", "<leader>gf", function() vim.lsp.buf.format { async = true } end, "Format by LSP")
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Actions")
      end

      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      })
      lspconfig.zls.setup({ on_attach = on_attach })
      lspconfig.pyright.setup({ on_attach = on_attach })
      lspconfig.pico8_ls.setup({ on_attach = on_attach })
    end,
  },
}
