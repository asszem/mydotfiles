" Minimal but comfortable Vim config for WSL (terminal Vim)
" Based on old _vimrc, pruned for this environment.

" -------------------------------------------------------------------
" Core settings
" -------------------------------------------------------------------
set nocompatible
set encoding=utf-8

" Basic UI
set number              " show line numbers
set cursorline          " highlight current line
set scrolloff=5         " keep context when scrolling
set wildmenu
set wildmode=list:longest,full
set showmatch           " briefly jump to matching bracket
set hlsearch            " highlight search matches
set ignorecase
set smartcase           " case-sensitive if pattern has capitals
set incsearch           " incremental search
set splitright
set splitbelow

" Indent / tabs
set shiftwidth=4
set tabstop=4
set smarttab
set autoindent
set linebreak
set textwidth=0
set wrapmargin=0
set formatoptions-=t

" Files / undo / backups
set hidden              " switch buffers without saving
set nobackup
set noswapfile
set autoread
set autowrite

" Mouse support (scroll + click) in all modes
set mouse=a

if has("persistent_undo")
  set undodir=~/.vim/undodir/
  set undofile
endif

" -------------------------------------------------------------------
" Vundle plugin manager
" -------------------------------------------------------------------
set shellslash
filetype off

" Vundle in standard *nix location
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle')

" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Core plugins kept from old config
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'preservim/nerdtree'
Plugin 'mhinz/vim-signify'
Plugin 'mhinz/vim-startify'
Plugin 'mbbill/undotree'
Plugin 'easymotion/vim-easymotion'
Plugin 'justinmk/vim-sneak'

call vundle#end()
filetype plugin indent on

" -------------------------------------------------------------------
" Plugin-specific settings (trimmed)
" -------------------------------------------------------------------
" Sneak
let g:sneak#streak = 1
let g:sneak#target_labels = "asdfghjkl;qwertyuiopzxcvbnm/ASDFGHJKL:QWERTYUIOPZXCVBNM?"
let g:sneak#s_next = 1
let g:sneak#prompt = 'Sneak>'

nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T

" EasyMotion
nmap <space><space> <Plug>(easymotion-prefix)
nmap <CR> <Plug>(easymotion-sn)

" NERDTree
let NERDTreeShowBookmarks=1

" CtrlP
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_switch_buffer = 0
map <c-p> :CtrlPMRU<cr>
map <c-b> :CtrlPBuffer<cr>
map <c-l> :CtrlPLine<cr>

" Undotree
nnoremap U :UndotreeToggle<cr>
if !exists('g:undotree_HighlightSyntaxAdd')
  let g:undotree_HighlightSyntaxAdd = 'DiffAdd'
endif
if !exists('g:undotree_HighlightSyntaxChange')
  let g:undotree_HighlightSyntaxChange = 'StatusLine'
endif

" -------------------------------------------------------------------
" Leader mappings (trimmed)
" -------------------------------------------------------------------
let mapleader=","        " keep old leader

nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>j :jumps<cr>

" Toggle wrap in all windows
nnoremap <leader>ww :windo set wrap<cr>
nnoremap <leader>wnw :windo set nowrap<cr>

" Quick diff helpers
nnoremap <leader>du :diffupdate<cr>

" Add DONE at line start (for todo lists)
nnoremap <leader>d IDONE <esc>

" Search: clear highlights
nnoremap <leader><space> :noh<cr>:call clearmatches()<cr>

" -------------------------------------------------------------------
" Cursor movement and edit mappings
" -------------------------------------------------------------------
" ESC remaps (keep jk → ESC)
imap ii <Esc>
imap jk <Esc>

" Shift-Space: save all
nnoremap <S-Space> :wa!<cr>

" Keep Ctrl-A as number increment (unmap any SelectAll mapping if it exists)
silent! nunmap <C-a>

" Softer movement: j/k move by screen lines
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Line start/end
nnoremap H ^
nnoremap L $

" Scroll down on Ctrl-s (as in old config)
nnoremap <C-s> <C-y>

" Insert-mode helpers
inoremap <C-l> <C-x><C-l>
inoremap <C-f> <C-x><C-f>
inoremap <C-j> <Up>
inoremap <C-k> <Down>
set completeopt=longest,menuone,preview

" Window navigation and resize
nnoremap <C-left>  gT
nnoremap <C-right> gt
nnoremap <left>  <C-w>h
nnoremap <right> <C-w>l
nnoremap <down>  <C-w>j
nnoremap <up>    <C-w>k
nnoremap <C-j>   <C-w>j
nnoremap <C-k>   <C-w>k
nnoremap <S-C-right> 5<C-w>>
nnoremap <S-C-left>  5<C-w><
nnoremap <S-C-up>    5<C-w>+
nnoremap <S-C-down>  5<C-w>-

" Search behavior
nnoremap n nzzzv
nnoremap N Nzzzv
vnoremap // y/<C-R>"<CR>

" Buffer helpers
nnoremap <F2> :bprevious<CR>
nnoremap <F3> :bnext<CR>
nnoremap <F4> :b#<CR>
nnoremap <F5> :wa!<CR>

" Open buffer list quickly
nnoremap <Space> :ls<CR>:b 

" Make current file's directory the working directory
nnoremap <Leader>cd :cd %:h<bar>pwd<cr>

" Better cursorline behavior (highlight, not just underline)
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" Cursorline highlight style for terminal (normal mode)
highlight CursorLine   cterm=NONE ctermbg=237
highlight CursorColumn cterm=NONE ctermbg=237

" NETRW tweaks
let g:netrw_liststyle = 4
let g:netrw_browse_split = 0
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_sort_by="time"
let g:netrw_sort_direction="reverse"

" -------------------------------------------------------------------
" Spectacular statusline (terminal-friendly)
" -------------------------------------------------------------------
" Colors for statusline segments (cterm), using a gruvbox-like palette
" Normal mode: darker bar for statusline than for cursorline
highlight User1 cterm=bold ctermfg=223 ctermbg=234  " left segment: [ft - enc]
highlight User2 cterm=bold ctermfg=223 ctermbg=235  " middle: filename
highlight User3 cterm=NONE ctermfg=223 ctermbg=236  " right: ln/col/%

" Statusline layout (no explicit mode indicator)
" Example: [text - utf-8] ln: 17/120 col: 11  19%
set statusline=
set statusline+=%#User1#
set statusline+=\ [%{&filetype==''?'none':&filetype}\ -\ %{&fileencoding==''?&encoding:&fileencoding}]\ 
set statusline+=%#User2#
set statusline+=%<%F          " full path, truncated on the left
set statusline+=%m             " [+] if modified
set statusline+=%r             " [RO] if readonly
set statusline+=%h             " help buffer flag
set statusline+=%w             " preview window flag
set statusline+=%=
set statusline+=%#User3#
set statusline+=\ ln:\ %l/%L\ col:\ %c\ 
set statusline+=%3p%%        " percentage through file

set laststatus=2

" Make current line number match cursorline highlight
highlight CursorLineNr cterm=bold ctermfg=223 ctermbg=236

" Change cursorline + statusline colors in Insert mode
augroup InsertColorSwap
  au!
  " In insert mode: lighter cursorline than statusline, and greenish statusline header
  au InsertEnter * highlight CursorLine   cterm=NONE ctermbg=239
  au InsertEnter * highlight CursorLineNr cterm=bold ctermfg=229 ctermbg=239
  au InsertEnter * highlight User1        cterm=bold ctermfg=223 ctermbg=64
  " Back to normal when leaving insert mode
  au InsertLeave * highlight CursorLine   cterm=NONE ctermbg=237
  au InsertLeave * highlight CursorLineNr cterm=bold ctermfg=223 ctermbg=237
  au InsertLeave * highlight User1        cterm=bold ctermfg=223 ctermbg=234
augroup END

" Log of origin
" Minimal WSL vimrc based on old _vimrc (Vundle, jk→ESC, Ctrl-s mapping, core navigation)
