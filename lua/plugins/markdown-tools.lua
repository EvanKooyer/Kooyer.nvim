return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
    ft = "markdown",
    config = function()
      vim.o.textwidth = 80

      require("render-markdown").setup({
        completions = {
          blink = { enabled = true },
        },

        checkbox = {
          enabled = true,
          render_modes = false,
          bullet = false,
          right_pad = 1,
          unchecked = {
            icon = "󰄱 ",
            highlight = "RenderMarkdownUnchecked",
            scope_highlight = nil,
          },
          checked = {
            icon = "󰱒 ",
            highlight = "RenderMarkdownChecked",
            scope_highlight = nil,
          },
          custom = {
            todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo", scope_highlight = nil },
          },
        },

        link = {
          enabled = true,
          render_modes = false,
          footnote = {
            enabled = true,
            superscript = true,
            prefix = "",
            suffix = "",
          },
          image = "󰥶 ",
          email = "󰀓 ",
          hyperlink = "󰌹 ",
          highlight = "RenderMarkdownLink",
          wiki = {
            icon = "󱗖 ",
            body = function()
              return nil
            end,
            highlight = "RenderMarkdownWikiLink",
          },
          custom = {
            web = { pattern = "^http", icon = "󰖟 " },
            discord = { pattern = "discord%.com", icon = "󰙯 " },
            github = { pattern = "github%.com", icon = "󰊤 " },
            gitlab = { pattern = "gitlab%.com", icon = "󰮠 " },
            google = { pattern = "google%.com", icon = "󰊭 " },
            neovim = { pattern = "neovim%.io", icon = " " },
            reddit = { pattern = "reddit%.com", icon = "󰑍 " },
            stackoverflow = { pattern = "stackoverflow%.com", icon = "󰓌 " },
            wikipedia = { pattern = "wikipedia%.org", icon = "󰖬 " },
            youtube = { pattern = "youtube%.com", icon = "󰗃 " },
          },
        },
      })
    end
  },
}
