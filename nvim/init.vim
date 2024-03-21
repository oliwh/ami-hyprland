
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'preservim/nerdtree'
Plug 'Townk/vim-autoclose'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'
Plug 'cespare/vim-toml'
Plug 'ap/vim-css-color'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'lewis6991/gitsigns.nvim'
Plug 'dense-analysis/ale'
Plug 'kyazdani42/nvim:h bufferline-configuration-web-devicons'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }


" List ends here. Plugins become visible to Vim after this call.
call plug#end()

syntax enable


" Set colour scheme
colorscheme bios 

" Lualine
lua << END
local colors = {
  black   = '#000000',
  green   = '#008000',
  teal    = '#55FFFF',
  gray    = '#B9B9B9',
  red     = '#A80000',
  yellow  = '#FCFC54',
  blue    = '#0000A8',
  white   = '#ffffff',
}

config = {
  options = {
    theme = {
      normal = {
        a = { fg = colors.white, bg = colors.teal, gui = 'bold' },
        b = { fg = colors.white, bg = colors.gray },
        c = { fg = colors.gray, bg = colors.black },
      },
      insert = { a = { fg = colors.white, bg = colors.green, gui = 'bold' } },
      visual = { a = { fg = colors.white, bg = colors.yellow, gui = 'bold' } },
      replace = { a = { fg = colors.white, bg = colors.red, gui = 'bold' } },
      inactive = {
        a = { fg = colors.gray, bg = colors.gray, gui = 'bold' },
        b = { fg = colors.gray, bg = colors.black },
        c = { fg = colors.gray, bg = colors.black },
      },
    },
    component_separators = ' |',
    section_separators = { left = '', right = '' }
  }
}
require('lualine').setup(config)
END

" Gitsigns
lua require('gitsigns').setup()

" TS Rainbow
lua << END
require("nvim-treesitter.configs").setup {
  highlight = {},
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil, 
  }
}
END
let g:rainbow_active = 1


" Nerdtree
let NERDTreeShowHidden = 1
nnoremap <C-t> :NERDTreeToggle<CR>

" tab settings
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>
" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Bufferline
set termguicolors
lua << EOF
require("bufferline").setup{
    options = {
        show_buffer_icons = false,
        show_buffer_close_icons = false,
        show_buffer_default_icon = false,
        tab_size = 1,
        separator_style = { '' , '' },
        },
    highlights = {
        fill = {
            fg = '#0000AA',
            bg = '#0000AA'
        },
        background = {
            fg = '#AAAAAA',
            bg = '#0000AA',
        }
        
    }
}
EOF
