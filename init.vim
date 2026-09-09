packadd coc.nvim
packadd nvim-tree.lua
packadd nvim-web-devicons
packadd plenary.nvim
packadd telescope.nvim
packadd telescope-fzf-native.nvim
packadd nvim-treesitter
packadd tokyonight.nvim
packadd kanagawa.nvim

let mapleader = ','
let maplocalleader = ','
set termguicolors
set mouse=
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
set smarttab
set expandtab
set list
set nowrap
set number
set relativenumber
set cursorline
set signcolumn=yes:1
set scrolloff=8
set showcmd
set hlsearch
set incsearch
set ignorecase
set smartcase
set noshowmode
set noswapfile
set nobackup
let &undodir = expand('~/.config/nvim/undodir')
set undofile


let g:loaded_ntrw = 1
let g:loaded_ntrwPlugin = 1

lua << EOF

require('nvim-tree').setup{
  sort_by = "case_sensitive",
  view = { width = 30 },
  renderer = {
    group_empty = true,
    icons = {
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = true
      },
    },
  },
  filters = {
    dotfiles = false,
    custom = { "^.git" }, 
  },
}

EOF

nnoremap <leader>t <cmd>NvimTreeToggle<cr>
nnoremap <leader>o <cmd>NvimTreeFocus<cr>


" Add to ~/.vimrc or ~/.config/nvim/init.vim
let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-pyright', 'coc-rust-analyzer', 'coc-go', 'coc-clangd']

set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes
set laststatus=2

" Show coc.nvim status, including extension installation progress
set statusline^=%{coc#status()}

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Trigger completion with Tab and navigate the completion menu
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Diagnostics and code navigation
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

lua << EOF

require('telescope').setup{
  defaults = {
      mappings = {
        i = {
          ["<C-j>"] = require('telescope.actions').move_selection_next,
          ["<C-k>"] = require('telescope.actions').move_selection_previous,
        },
      },
  },
}

pcall(require('telescope').load_extension, 'fzf')

EOF

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua << EOF

require('nvim-treesitter.configs').setup{
  ensure_installed = { "php", "lua", "vim", "vimdoc", "javascript", "typescript", "vue", "json", "yaml", "html", "css", "bash", "sql", "markdown" },
  auto_install = true,
  hightlight = {
    enable = true
  },
  indent = {
    enable = true
  },
}

EOF


lua << EOF

require('tokyonight').setup{
  style = "storm", --"storm" | "night" | "moon" | "light"
  transparent = true
}

require('kanagawa').setup{
  theme = "wave", -- "wave" | "dragon" | "lotus"
  transparent = true
}

EOF

colorscheme kanagawa
