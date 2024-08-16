return {
  'danymat/neogen',
  config = true,
  version = '2.19.3',
  vim.api.nvim_set_keymap('n', '<leader>ng', ':Neogen<CR>', {noremap = true, silent = true})
}
