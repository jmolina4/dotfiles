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

set tabstop=2
set shiftwidth=2

autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 "Set tab 2 spaces
set expandtab "When click tab, set 2 spaces

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugins')
Plug 'scrooloose/nerdtree'

"Git
Plug 'Xuyuanp/nerdtree-git-plugin' "For git files in nerd_tree
Plug 'airblade/vim-gitgutter' "For git diff
Plug 'https://github.com/altercation/vim-colors-solarized.git' "Vim solarized colorscheme

"Search tool
Plug 'mileszs/ack.vim'

"Status line
Plug 'vim-airline/vim-airline'

"Syntax
" Plug 'vim-syntastic/syntastic'
Plug 'junegunn/vim-easy-align'

"Javascript
"Plug 'pangloss/vim-javascript'
"Plug 'leafgarland/typescript-vim'

" HTML
Plug 'alvan/vim-closetag'

"Search Files
Plug 'kien/ctrlp.vim'
Plug 'skwp/greplace.vim'
Plug 'tacahiroy/ctrlp-funky'

"Ruby on Rails
Plug 'vim-ruby/vim-ruby' "For ruby support
Plug 'tpope/vim-rails'
Plug 'ervandew/supertab' "insert completions
Plug 'tpope/vim-endwise' "Add end after

" Testing
Plug 'thoughtbot/vim-rspec'
Plug 'janko-m/vim-test'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-dispatch'

"Refactoring
Plug 'https://github.com/adelarsq/vim-matchit'
Plug 'ecomba/vim-ruby-refactoring'

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

let g:rspec_command = "Dispatch bundle exec rspec {spec}"
let g:rspec_runner = "os_x_iterm2"

"Rubocop
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_ruby_checkers = ['rubocop']

" Highlight words under cursor
" autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

nnoremap <leader>. :CtrlPTag<cr>
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" Testing Maps
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

nmap <silent> t<C-n> :TestNearest<CR> " t Ctrl+n
nmap <silent> t<C-f> :TestFile<CR>    " t Ctrl+f
nmap <silent> t<C-s> :TestSuite<CR>   " t Ctrl+s
nmap <silent> t<C-l> :TestLast<CR>    " t Ctrl+l
nmap <silent> t<C-g> :TestVisit<CR>   " t Ctrl+g

" make test commands execute using dispatch.vim
let test#strategy = "dispatch"

nmap <Leader>bi :source ~/.vimrc<cr>:PlugInstall<cr>
map <Leader>rd :!bundle exec rspec % --format documentation<CR>
nmap <Leader>n :NERDTreeFind<CR>
nmap <Leader>m :NERDTreeToggle<CR>
nmap <Leader>r :RuboCop<CR>
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" Copy from vim to mac clipboard
map <C-c> y:e ~/clipsongzboard<CR>P:w !pbcopy<CR><CR>:bdelete!<CR>
