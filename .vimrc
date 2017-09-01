autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set autoread "Refresh files automatically

syntax enable
set background=dark

"Sending swap files to tmp folder
set directory^=$HOME/.vim/tmp//

"Shortcut for nerdTree
let mapleader = ","
nmap <leader>ne :NERDTree<cr>

autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 "Set tab 2 spaces
set expandtab "When click tab, set 2 spaces

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugins')
Plug 'scrooloose/nerdtree' 

"Git
Plug 'Xuyuanp/nerdtree-git-plugin' "For git files in nerd_tree
Plug 'tpope/vim-fugitive' "For git commands
Plug 'airblade/vim-gitgutter' "For git diff
Plug 'https://github.com/altercation/vim-colors-solarized.git' "Vim solarized colorscheme

"Search tool
Plug 'mileszs/ack.vim'

"Status line
Plug 'vim-airline/vim-airline'

"Syntax
"Plug 'scrooloose/syntastic'

"Search Files
Plug 'kien/ctrlp.vim'

"Ruby on Rails
Plug 'vim-ruby/vim-ruby' "For ruby support
Plug 'ervandew/supertab' "insert completions
Plug 'tpope/vim-endwise' "Add end after
call plug#end()

let g:SuperTabCrMapping = 1 "Not adding empty line after supertab autocomplete

set number

colorscheme solarized

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
