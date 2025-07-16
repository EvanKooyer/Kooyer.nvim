return {
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.black,
          null_ls.builtins.code_actions.refactoring,
          null_ls.builtins.code_actions.textlint,
          null_ls.builtins.diagnostics.markdownlint,
          null_ls.builtins.diagnostics.proselint,
          null_ls.builtins.diagnostics.pylint,
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
      local DEFAULT_SETTINGS = {
        -- A list of sources to install if they're not already installed.
        -- This setting has no relation with the `automatic_installation` setting.
        ensure_installed = {
          "stylua",
          "black",
          "refactoring",
          "textlint",
          "Markdownlint",
          "proselint",
          "pylint",
        },
        -- Enable or disable null-ls methods to get set up
        -- This setting is useful if some functionality is handled by other plugins such as `conform` and `nvim-lint`
        methods = {
            diagnostics = true,
            formatting = true,
            code_actions = true,
            completion = true,
            hover = true,
        },
        -- Run `require("null-ls").setup`.
        -- Will automatically install masons tools based on selected sources in `null-ls`.
        -- Can also be an exclusion list.
        -- Example: `automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }`
        automatic_installation = true,
        -- See [#handlers-usage](#handlers-usage) section
        handlers = {},
      }

      require("mason-null-ls").setup(DEFAULT_SETTINGS)
    end,
  }
}
