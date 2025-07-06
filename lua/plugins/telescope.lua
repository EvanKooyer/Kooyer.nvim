return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set('n', '<C-p>', builtin.find_files, {}) --Map telescope to ctrl-p
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {}) --Map livegrep to leader-fg
  end
}


