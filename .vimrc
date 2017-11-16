autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufWritePre * %s/\s\+$//e
set autoread "Refresh files automatically

syntax enable
set background=dark

"Sending swap files to tmp folder
set directory^=$HOME/.vim/tmp//

"Shortcut for nerdTree
let mapleader = ","
nmap <leader>ne :NERDTree<cr>
let NERDTreeShowHidden=1

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
Plug 'skwp/greplace.vim'

"Ruby on Rails
Plug 'vim-ruby/vim-ruby' "For ruby support
Plug 'tpope/vim-rails'
Plug 'ervandew/supertab' "insert completions
Plug 'tpope/vim-endwise' "Add end after
Plug 'thoughtbot/vim-rspec'

Plug 'tpope/vim-surround'


call plug#end()

let g:SuperTabCrMapping = 1 "Not adding empty line after supertab autocomplete

set hlsearch
set number

colorscheme solarized

set tags=./tags;

" Use sck instead of grep
set grepprg=ack
let g:grep_cmd_opts = '--noheading'
let g:ackprg = 'ag --nogroup --nocolor --column'

set splitright

let g:rspec_command = "!clear && bundle exec rspec {spec}"

"Rubocop
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['rubocop']

" Highlight words under cursor
autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

nnoremap <leader>. :CtrlPTag<cr>
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
nmap <Leader>bi :source ~/.vimrc<cr>:PlugInstall<cr>
map <Leader>rd :!bundle exec rspec % --format documentation<CR>
nmap <Leader>n :NERDTreeFind<CR>
nmap <Leader>m :NERDTreeToggle<CR>
nmap <Leader>r :RuboCop<CR>
