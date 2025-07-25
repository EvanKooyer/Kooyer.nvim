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
      
      require('render-markdown').setup({
        preset = 'obsidian',
        enabled = true,

      })

    end
  },
}
