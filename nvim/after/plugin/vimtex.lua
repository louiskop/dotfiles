
-- " This is necessary for VimTeX to load properly. The "indent" is optional.
-- " Note that most plugin managers will do this automatically.
vim.api.nvim_exec([[
    filetype plugin indent on
    ]], false)

-- " This enables Vim's and neovim's syntax-related features. Without this, some
-- " VimTeX features will not work (see ":help vimtex-requirements" for more
-- " info).
vim.cmd("syntax enable")

-- " Viewer options: One may configure the viewer either by specifying a built-in
-- " viewer method:
vim.g.vimtex_view_method = 'zathura'

-- use pdflatex
vim.g.vimtex_compiler_method = 'pdflatex'

-- silence errors
-- brief.tex|4073 warning| Package hyperref Warning: Unexpected value `black' of option `colorlinks' instead of `true' or 'false'
vim["g"]["vimtex_quickfix_ignore_filters"] = {
  "Underfull",
  "Overfull",
  "Package hyperref Warning",
  "Empty bibliography"
}
