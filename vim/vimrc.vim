set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'preservim/nerdtree'
Plugin 'ryanoasis/vim-devicons'
Plugin 'vwxyutarooo/nerdtree-devicons-syntax'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'jiangmiao/auto-pairs'
Plugin 'slim-template/vim-slim.git'
Plugin 'dense-analysis/ale'
Plugin 'thoughtbot/vim-rspec'
Plugin 'itmammoth/run-rspec.vim'
Plugin 'joshdick/onedark.vim'
Plugin 'sheerun/vim-polyglot'
" Plugin 'airblade/vim-gitgutter'
Plugin 'vim-signify'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
" Plugin 'benmills/vimux'
Plugin 'slarwise/vim-tmux-send'
Plugin 'mhinz/vim-startify'
Plugin 'dyng/ctrlsf.vim'
Plugin 'ngmy/vim-rubocop'
Plugin 'haya14busa/incsearch.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-eunuch'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'tpope/vim-repeat'
Plugin 'kylef/apiblueprint.vim'
call vundle#end()

filetype plugin on
syntax enable

set number relativenumber
set list
set listchars=tab:>-
set listchars+=space:·

augroup numbertoggle
  autocmd!

  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END

"set t_Co=256
let g:airline_powerline_fonts = 1

set backspace=indent,eol,start

set history=500
set ruler
set showcmd
set wildmenu

set ttimeout
set ttimeoutlen=100

set display=truncate

set scrolloff=5
set tabstop=2
set expandtab
set shiftwidth=2
"set nosmartindent
if has ("autocmd")
  filetype indent on
endif

set nowrap
set colorcolumn=80

"set tags^=./.git/tags;
" let g:fzf_preview_window = 'right:60%'

set cursorline

let g:ale_linters = {
      \   'ruby': ['rubocop']
      \ }
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_linters_explicit = 1
let g:airline#extensions#ale#enabled = 1
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Auto-complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

autocmd BufWritePre * %s/\s\+$//e

map <C-n> :NERDTreeToggle<CR>

" rspec commands
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader><c-a> :call RunAllSpecs()<CR>
let g:rspec_runner = "os_x_iterm"
let g:rspec_command = "!bundle exec rspec"
nnoremap <leader>a :RunSpecAll<CR>
nnoremap <leader>r :RunSpec<CR>
nnoremap <leader>l :RunSpecLine<CR>
nnoremap <leader>e :RunSpecLastRun<CR>
nnoremap <leader>cr :RunSpecCloseResult<CR>
let g:run_rspec_bin = 'bundle exec rspec'
" let g:run_rspec_bin = 'rbenv exec bundle exec rspec'

" let g:run_spec_bin = 'rbenv exec bundle exec rspec'
" let g:run_rspec_command_option = '-v'
nnoremap <leader>f :FZF<CR>

nnoremap <leader>ct :!ctags -R --languages=ruby --exclude=.git --exclude=log --exclude=tmp .<CR>
set encoding=UTF-8

" Git mappings
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>

" Open dotfiles vim
nnoremap <leader>vc :e ~/dotfiles/vim/vimrc.vim<CR>

" Emmet leader key
let g:user_emmet_leader_key=','

" Set esc timeout to zero
set timeoutlen=1000 ttimeoutlen=0


" Vim tmux mappings
nnoremap <LEADER>sm :SendMakeCmd<CR>
nnoremap <LEADER>ss :SendLine<CR>j
nnoremap <LEADER>s :set operatorfunc=SendSelection<CR>g@

"nnoremap <C-h> :wincmd h<CR>
"nnoremap <C-j> :wincmd j<CR>
"nnoremap <C-k> :wincmd k<CR>
"nnoremap <C-l> :wincmd l<CR>
if $TERM_PROGRAM != "Apple_Terminal"
  if has('termguicolors')
    set termguicolors
    let g:onedark_termcolors = 256
  endif
endif

colorscheme onedark

let g:airline_theme='onedark'
let g:airline#extensions#hunks#enabled = 0
set diffopt+=vertical

" Rails vim
" nnoremap <leader>t :A<CR>
nnoremap <leader>c :RuboCop<CR>
hi vertsplit guifg=fg guibg=bg

" Snippets
let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,rails'

" NerdTree
nnoremap ,n :NERDTreeFind<CR>

" Fugitive
nnoremap <leader>gd :Gdiffsplit!<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

nnoremap <S-j> <Nop>
nnoremap <S-h> <Nop>
nnoremap <S-k> <Nop>
nnoremap <S-l> <Nop>

nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprevious<CR>

nnoremap <leader>sr :split<CR>:A<CR>
nnoremap <leader>z :tabnew %<CR><C-o>
