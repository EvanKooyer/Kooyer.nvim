return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.black,
          null_ls.builtins.code_actions.refactoring,
          null_ls.builtins.code_actions.textlint,
          null_ls.builtins.diagnostics.markdownlint,
          null_ls.builtins.diagnostics.proselint,
          null_ls.builtins.diagnostics.pylint,
          require("none-ls.diagnostics.eslint_d"),
        },
      })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      ensure_installed = {
        "stylua",
        "prettier",
        "black",
        "refactoring",
        "texlint",
        "Markdownlint",
        "proselint",
        "pylint",
        "eslint_d",
      }
    end,
  }
}
