
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'preservim/nerdtree'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'jiangmiao/auto-pairs'
Plugin 'slim-template/vim-slim.git'
Plugin 'dense-analysis/ale'
Plugin 'thoughtbot/vim-rspec'
Plugin 'itmammoth/run-rspec.vim'
Plugin 'joshdick/onedark.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'sainnhe/sonokai'
Plugin 'airblade/vim-gitgutter'
Plugin 'ryanoasis/vim-devicons'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'tpope/vim-surround'
"Plugin 'killphi/vim-legend'
"Plugin 'nyarly/cadre'
call vundle#end()

filetype plugin on
syntax enable
"colorscheme dracula

let g:onedark_termcolors = 256
let g:airline_theme='onedark'
colorscheme onedark

"set background=dark
set number relativenumber
set list
set listchars=tab:>-
set listchars+=space:·

augroup numbertoggle
  autocmd!

  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END

set t_Co=256
"let &t_Co=256
let g:airline_powerline_fonts = 1
"syntax enable

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
"
set tags^=./.git/tags;
" let g:fzf_preview_window = 'right:60%'

set cursorline

let g:ale_linters = {
      \   'ruby': ['rubocop']
      \}
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Auto-complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

autocmd BufWritePre * %s/\s\+$//e

map <C-n> :NERDTreeToggle<CR>

" rspec commands
"map <Leader>t :call RunCurrentSpecFile()<CR>
"map <Leader>s :call RunNearestSpec()<CR>
"map <Leader>l :call RunLastSpec()<CR>
map <Leader><c-a> :call RunAllSpecs()<CR>
let g:rspec_command = "!bundle exec rspec {spec}"
let g:rspec_runner = "os_x_iterm"
nnoremap <leader>a :RunSpecAll<CR>
nnoremap <leader>r :RunSpec<CR>
nnoremap <leader>l :RunSpecLine<CR>
nnoremap <leader>e :RunSpecLastRun<CR>
nnoremap <leader>cr :RunSpecCloseResult<CR>
let g:run_rspec_bin = 'bundle exec rspec'

nnoremap <leader>f :FZF<CR>

nnoremap <leader>ct :!ctags -R --languages=ruby --exclude=.git --exclude=log --exclude=tmp .<CR>
"let g:onedark_termcolors=256

"highlight Normal ctermbg=NONE
"highlight nonText ctermbg=NONE

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  "if (has("termguicolors"))
    "set termguicolors
  "endif
else
  set termguicolors
endif
set encoding=UTF-8

" Git mappings
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>


" Pane mappings
nnoremap <leader>ws :split<CR>
nnoremap <leader>wv :split<CR>

