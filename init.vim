call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jparise/vim-graphql'
Plug 'nvim-telescope/telescope.nvim'
Plug 'tomlion/vim-solidity'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()
filetype off
set nocompatible
set number
set nowrap
set smartcase
set nohlsearch
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set splitbelow
set splitright
set guicursor=
set relativenumber
set nu
set hidden
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set signcolumn=yes
set noshowmode
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of ‚Äö√Ñ√∫all‚Äö√Ñ√π, ‚Äö√Ñ√∫maintained‚Äö√Ñ√π (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
  },
}
EOF
nmap <C-n> :NERDTreeFocus<CR>
inoremap jj <ESC>
set t_Co=256
syntax enable
set background=dark
let NERDTreeMinimalUI=1
let g:gruvbox_contrast_dark='hard'
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]
map <Space> <Leader>
colorscheme gruvbox
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap =j :%!python -m json.tool<CR>
map gc :call Comment()<CR>
map gC :call Uncomment()<CR>
nnoremap ,v <C-w>v
nnoremap ,h <C-w>s
nnoremap <SPACE> <Nop>
fun! TrimWhiteSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
augroup TDT
    autocmd!
    autocmd BufWritePre * :call TrimWhiteSpace()
augroup END
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
augroup AUTOSAVE
  au!
  autocmd InsertLeave,TextChanged,FocusLost * silent! write
augroup END
