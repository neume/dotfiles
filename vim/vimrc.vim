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
Plugin 'junegunn/fzf.vim'
" Plugin 'jiangmiao/auto-pairs'
" Plugin 'slim-template/vim-slim.git'
Plugin 'dense-analysis/ale'
" Plugin 'thoughtbot/vim-rspec'
Plugin 'itmammoth/run-rspec.vim'
" Plugin 'joshdick/onedark.vim'
Plugin 'morhetz/gruvbox'
" Plugin 'airblade/vim-gitgutter'
Plugin 'vim-signify'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'kremso/vim-spectator'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/AutoComplPop' " Causes ruby error
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'christoomey/vim-tmux-navigator'

" Snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" Plugin 'benmills/vimux'
" Plugin 'slarwise/vim-tmux-send'
Plugin 'mhinz/vim-startify'
Plugin 'dyng/ctrlsf.vim'
Plugin 'ngmy/vim-rubocop'
" Plugin 'haya14busa/incsearch.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-eunuch'
Plugin 'dhruvasagar/vim-table-mode'
" Plugin 'tpope/vim-repeat'
" Plugin 'kylef/apiblueprint.vim'
" Plugin 'preservim/vimux'
" Plugin 'itchyny/calendar.vim'
" Plugin 'MaxMEllon/vim-jsx-pretty'
Plugin 'sheerun/vim-polyglot'
Plugin 'pangloss/vim-javascript'
" Plugin 'othree/yajs.vim'
" Plugin 'elzr/vim-json'
" Plugin 'jelera/vim-javascript-syntax'
" Plugin 'yuezk/vim-js'

" Plugin 'Valloric/MatchTagAlways'
" Plugin 'jaxbot/semantic-highlight.vim'
Plugin 'gregsexton/matchtag'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'mrdotb/vim-tailwindcss'
Plugin 'jpalardy/vim-slime'
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
" if has ("autocmd")
"   filetype indent on
" endif

set wrap
set colorcolumn=120

"Enable mouse
set mouse=a

"set tags^=./.git/tags;
" let g:fzf_preview_window = 'right:60%'

set cursorline
set cursorcolumn

let g:ale_linters = {
      \   'ruby': ['rubocop'],
      \   'javascript': ['eslint'],
      \ }
let g:ale_fixers= {
      \   'javascript': ['prettier', 'eslint'],
      \ }

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_linters_explicit = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_ruby_brakeman_executable = 'bundle'
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
" let g:rspec_runner = "os_x_iterm"
" let g:rspec_command = "!bundle exec rspec"
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
nnoremap <leader>gs :Git<CR>
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

colorscheme gruvbox
set background=dark

let g:airline_theme='gruvbox'
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
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>nt :NERDTree<CR>

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

nnoremap <Leader>vl :call VimuxRunCommand("clear; bundle exec rspec " . bufname("%"))<CR>
map <leader>vi :VimuxInspectRunner<cr></cr></leader>
if $PATH !~ "\.rbenv"
  let $PATH="/home/username/.rbenv/shims:/home/username/.rbenv/bin:" . $PATH
endif
let g:vimrubocop_rubocop_cmd = 'rbenv exec bundle exec rubocop'

" Nerdtree tmux config
" This allows tmux navigation on nerd tree window
let g:NERDTreeMapJumpPrevSibling=""
let g:NERDTreeMapJumpNextSibling=""

" WSL yank support for Ubuntu on WSL
if $WSL_DISTRO_NAME == 'Ubuntu-20.04'
  let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
  if executable(s:clip)
      augroup WSLYank
          autocmd!
          autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
      augroup END
  endif
endif


set clipboard=unnamed
nnoremap <leader>gv :!git view<CR>
" let g:ale_ruby_rubocop_executable = 'bundle'
" let g:ale_ruby_brakeman_executable = 'bundle'
nmap <leader>cr :RuboCop<cr>
nmap <silent> <leader>cn :ALENext<cr>
nmap <silent> <leader>cp :ALEPrevious<cr>
nnoremap <leader>wf :CtrlSF
nnoremap <leader>d :ALEFix<cr>
" nnoremap <leader>cm :exe "!tmux send -t 2 'echo " . line(".") . "' Enter"<cr>

" Close html tag
imap ,/ </<C-X><C-O>

let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git -name tmp \) -prune -o -print'

let g:snipMate = { 'snippet_version' : 1 }

let g:rails_projections = {
      \ "app/controllers/*_controller.rb": {
      \   "test": [
      \     "spec/controllers/{}_controller_spec.rb",
      \     "spec/requests/{}_spec.rb"
      \   ],
      \ },
      \ "spec/requests/*_spec.rb": {
      \   "alternate": [
      \     "app/controllers/{}_controller.rb",
      \   ],
      \ }}

" FuzzyFinder
" -----------------------------------------------------------------------------
function! FufSetIgnore()

    let ignorefiles = [ $HOME . "/.gitignore", ".gitignore" ]
    let exclude_vcs = '\.(hg|git|bzr|svn|cvs)'
    let ignore = '\v\~$'

    for ignorefile in ignorefiles

        if filereadable(ignorefile)
            for line in readfile(ignorefile)
                if match(line, '^\s*$') == -1 && match(line, '^#') == -1
                    let line = substitute(line, '^/', '', '')
                    let line = substitute(line, '\.', '\\.', 'g')
                    let line = substitute(line, '\*', '.*', 'g')
                    let ignore .= '|^' . line
                endif
            endfor
        endif

        let ignore .= '|^' . exclude_vcs
        let g:fuf_coveragefile_exclude = ignore
        let g:fuf_file_exclude = ignore
        let g:fuf_dir_exclude = ignore

    endfor
endfunction

" Bonus: My custom key mappings for FuzzyFinder
" Calls the function to set the exclude variables, then runs FuzzyFinder
" nn <Tab>   :call FufSetIgnore() <BAR> :FufFile<CR>
" nn <S-Tab> :call FufSetIgnore() <BAR> :FufFile **/<CR>
" nn <F3>    :call FufSetIgnore() <BAR> :FufFile **/<CR>

let g:slime_target = "tmux"
