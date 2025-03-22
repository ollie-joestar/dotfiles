require('catppuccin').setup {
  flavour = 'mocha',
  transparent_background = true,
  styles = {
    comments = { 'italic' },
    conditionals = { 'italic' },
  },
}

vim.cmd.colorscheme 'catppuccin'
