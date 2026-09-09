vim.g.mapleader = ','
vim.g.maplocalleader = ','
vim.g.have_nerd_font = true
vim.opt.mouse = ''
vim.opt.termguicolors = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.list = true
vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = 'yes:1'
vim.opt.scrolloff = 8
vim.opt.showcmd = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmode = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.config/nvim/undodir'
vim.opt.undofile = true

vim.lsp.config['intelephense'] = {
  cmd = { 'intelephense', '--stdio' }, 
  filetypes = { 'php', 'blade' },
  root_markers = { '.git', 'composer.json' }
}

vim.lsp.enable('intelephense')
vim.lsp.inlay_hint.enable(true)

vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)

require("config.lazy")
vim.cmd.packadd('coc.nvim')
