require('vimade').setup {
  fadelevel = function(style, state)
    if style.win.buf_opts.syntax == 'nerdtree' then
      return 0.8
    else
      return 0.4
    end
  end,
}
