"Last updated: 2021-02-17
"============================================================================================================
"~~	|Diff Settings| ~~
"============================================================================================================
	"the encoding must be set at this point, otherwise Airline will break in GVim
	set encoding=utf-8
	"a ctrl-V átmappolása mielőtt az mswin.vim a rendszerszintű paste-t rakja be helyette
	map <leader>v <c-q>
	set nocompatible
	source $VIMRUNTIME/vimrc_example.vim
	source $VIMRUNTIME/mswin.vim
	behave mswin
	function MyDiff()
   	let opt = '-a --binary '
   	if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
   	if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
   	let arg1 = v:fname_in
   	if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
   	let arg2 = v:fname_new
   	if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
   	let arg3 = v:fname_out
   	if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
   	if $VIMRUNTIME =~ ' '
     if &sh =~ '\<cmd'
       if empty(&shellxquote)
         let l:shxq_sav = ''
         set shellxquote&
       endif
       let cmd = '"' . $VIMRUNTIME . '\diff"'
     else
       let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
     endif
    else
     let cmd = $VIMRUNTIME . '\diff'
    endif
    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
    if exists('l:shxq_sav')
     let &shellxquote=l:shxq_sav
    endif
 	endfunction
"============================================================================================================
"~~	|Vundle Plugin Configurations| ~~
"============================================================================================================
	set nocompatible              " be iMproved, required
	filetype off                  " required

	" set the runtime path to include Vundle and initialize
	set rtp+=$HOME/.vim/bundle/Vundle.vim/
	call vundle#begin('$HOME/.vim/bundle/')
	" alternatively, pass a path where Vundle should install plugins
	"call vundle#begin('~/some/path/here')

	" let Vundle manage Vundle, required
	Plugin 'VundleVim/Vundle.vim'

	" Keep Plugin commands between vundle#begin/end.
	Plugin 'tpope/vim-fugitive'
	Plugin 'ctrlpvim/ctrlp.vim'
	Plugin 'scrooloose/nerdtree'
	Plugin 'Xuyuanp/nerdtree-git-plugin'
	"Plugin 'vim-airline/vim-airline'
	"Plugin 'vim-airline/vim-airline-themes'
	Plugin 'easymotion/vim-easymotion'
	Plugin 'powerline/powerline-fonts'
	Plugin 'flazz/vim-colorschemes'
	"Plugin 'airblade/vim-gitgutter'
	Plugin 'mhinz/vim-signify'
	Plugin 'mhinz/vim-startify'
	Plugin 'mbbill/undotree'
	Plugin 'justinmk/vim-sneak'

	" All of your Plugins must be added before the following line
	call vundle#end()            " required
	filetype plugin indent on    " required
"============================================================================================================
"~~	|Plugin Specific Settings| ~~
"============================================================================================================
	"|Sneak|
		"Enable easymotion-like labeling
		let g:sneak#streak = 1
		let g:sneak#target_labels = "asdfghjkl;qwertyuiopzxcvbnm/ASDFGHJKL:QWERTYUIOPZXCVBNM?"
		"Press s or S again to go next/previous match until cursor movement. ; and , works as well
		let g:sneak#s_next = 1
		let g:sneak#prompt = 'Sneak>'
		"remap fF and tT to Sneak
		map f <Plug>Sneak_f
		map F <Plug>Sneak_F
		map t <Plug>Sneak_t
		map T <Plug>Sneak_T
	"|Easymotion|
		"Set EasyMotion general trigger key - Space + s, space + w, etc
		nmap <space> <space><Plug>(easymotion-prefix)
		"Set multicharacter search trigger key - Enter
		nmap <CR> <Plug>(easymotion-sn)
		"Use easymotion bi-directional single character find motion
		"nmap <s> <Plug>(easymotion-overwin-f)
	"|Nerdtree|
		"always show the bookmarks 
		let NERDTreeShowBookmarks=1 
	"|Ctrl-p|
		set runtimepath^=~/.vim/bundle/ctrlp.vim
		"to open CtrlP with MRU-Files-Buffers mixed mode
		"map <c-p> :CtrlPMixed<cr>
		map <c-p> :CtrlPMRU<cr>
		let g:ctrlp_cmd = 'CtrlPMRU'
		"http://ctrlpvim.github.io/ctrlp.vim/#installation"
	"|Airline|
		"Use special characters in statusline
		"let g:airline_powerline_fonts = 1
		"if !exists('g:airline_symbols')
		"  let g:airline_symbols = {}
		"endif
		"let g:airline_symbols.space = "\ua0"
		""Tabline settings
		"let g:airline#extensions#tabline#enabled = 1							"enable the tabline on top
		"let g:airline#extensions#tabline#formatter = 'unique_tail_improved' 	"display only the filename for the buffers
  		"let g:airline#extensions#tabline#tab_nr_type = 1 						"display the tab number
		"let g:airline#extensions#tabline#fnamemod = ':p:~' 						"configure the formatting of filenames (see |filename-modifiers|). >
		"let g:airline#extensions#tabline#fnamecollapse=0 						"configure collapsing parent directories in buffer name. >
		"let g:airline#extensions#tabline#fnametruncate=0 						"configure truncating non-active buffer names to specified length.
		""let g:airline#extensions#tabline#buffer_idx_mode = 1 					"display the buffer numbers as well in the top tab row
		""let g:airline#extensions#tabline#buffer_nr_show = 1					"display the actual buffer number
		""Required for better performance for Gvim in Windows
		"set rop=type:directx,gamma:1.0,contrast:0.5,level:1,geom:1,renmode:4,taamode:1
		""Set content of Airline statusline C and Z
		"let g:airline_section_c='%F [%.3n]%m'			" %f=filename only %F=filename with path %.3n=buffer number %m=modified flag
		""let g:airline_section_c='%f [%.3n]%m'			" %f=filename only %F=filename with path %.3n=buffer number %m=modified flag
		"let g:airline_section_z='%l:%c[%P]'				" line:column[position%]
		""Set the airline theme 
"============================================================================================================
"~~	|Mapleader Settings| ~~
"============================================================================================================
	"Sets the leader key to ,
		let mapleader=","
	"Set textwidht=0 because it needs to be set manually every time
		map <leader>t :set textwidth=0<cr>
	"Toggle Nerdtree file manager with ,n 
		map <leader>n :NERDTreeToggle<cr>
	"Open the buffers list with ,b
		map <leader>b :CtrlPBuffer<cr>
	" ,bl buffers-list kombóra is beállítom, meglátjuk idővel
	" melyiket lesz kényelmesebb használni
		nnoremap <Leader>bl :ls!<cr>:b 
	"Opens the jumps list. Ctrl-o and Ctrl-i to jump
		map <leader>j :jumps<cr>
	"jumps backward on the changes list - to the PREVIUS change
		map <leader>c g;
	"jumps forward to the changes list - to the NEXT change
		map <leader>C g,
	"turns on word wrap for every open buffer
		map <leader>ww :windo set wrap<cr>
	"turns off word wrap for every open buffer
		map <leader>wnw :windo set nowrap<cr>
	"Diff update az adott ablakban
		map <leader>du :diffupdate<cr>
	"Diff update in every open window
		map <leader>dwu: :windo diffupdate<cr>
		map <leader>wdu: :windo diffupdate<cr>
	"Diff this window
		map <leader>dt :diffthis<cr>
	"Diff every window
		map <leader>dwt :windo diffthis<cr>
		map <leader>wdt :windo diffthis<cr>
	"Diff off this window
		map <leader>do :diffoff<cr>
	"Diff off every buffer in open window
		map <leader>dwo :windo diffoff<cr>
		map <leader>wdo :windo diffoff<cr>
	"Diff Merge jump to Diff Head or Diff Local
		map <leader>dh /<<<<<<<<cr>
		map <leader>dl /<<<<<<<<cr>
	"Diff Merge jump to Diff Base
		map <leader>db /\|\|\|\|\|\|\|<cr> 
	"Diff Merge jump to Diff Remote
		map <leader>dr />>>>>>><cr>
	"Dokumentum aljára ugrás
		nnoremap <Leader>g G<cr>
	"marks-ra ugrás
		nnoremap <Leader>m '
	"marksok mutatása
		nnoremap <Leader>ma :marks<cr>
	"Timestamp beállítások
		"nmap <leader>ts A<C-R>=strftime(" [%m.%d. %H:%M:%S]")<CR><Esc>
		"nmap <leader>tl A<C-R>=strftime(" [%Y.%m.%d. %A \| %H:%M:%S]")<CR><Esc>
		"nmap <leader>td O<C-R>=strftime("%Y.%m.%d.")<CR><Esc>
	"Az aktuális pozíciótól törli a tartalmat és új timestampot
	"szúr be (timestamp long UPDATE)
		"nmap <leader>tlu C<C-R>=strftime("[%Y.%m.%d. %A \| %H:%M:%S]")<CR><Esc>
	"ToDo listhez 
		" ,d a sor elejét +ra alakítja (DONE)
		" ,dd a sor elejét !-ra alakítja ("Don'tDone")
		"nmap <leader>d :s,\(^\s*\)!,\1+,e<cr>:noh<cr>
		"set magic
		"nmap <leader>dd :s,\(^\s*\)[+\|-],\1!,e<cr>:noh<cr>
"============================================================================================================
"~~ |Color and Cursor settings| ~~
"============================================================================================================
	"Set color scheme
		:color molokai_dark
	"Color overrides
		:highlight Comment ctermfg=gray
		:highlight Folded ctermfg=0 ctermbg=white
		:highlight diffChange ctermfg=11
		:highlight Search cterm=NONE ctermfg=white ctermbg=blue
		:highlight Cursor ctermfg=yellow ctermbg=black cterm=bold term=bold
		:highlight CursorLine cterm=bold ctermbg=red ctermfg=white
		autocmd InsertEnter * highlight CursorLine ctermbg=white ctermfg=black
		autocmd InsertLeave * highlight CursorLine ctermbg=red ctermfg=white
		:highlight LineNr ctermbg=green ctermfg=black
		augroup LineNrHighlight
			autocmd!
			autocmd WinEnter * set number
			autocmd WinLeave * set nonumber
		augroup end
	"Cursor Shape Settings
		let &t_SI.="\e[5 q" "SI = INSERT mode
		let &t_SR.="\e[4 q" "SR = REPLACE mode
		let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
		"Cursor settings:
		"  1 -> blinking block
		"  2 -> solid block 
		"  3 -> blinking underscore
		"  4 -> solid underscore
		"  5 -> blinking vertical bar
		"  6 -> solid vertical bar
"============================================================================================================
"~~	|Statusline Settings| ~~
"============================================================================================================
	"Set status line color CTERM
		:highlight statusline ctermbg=black ctermfg=yellow
		:highlight statuslineNC ctermbg=white ctermfg=darkgrey
		:highlight DiffText ctermfg=yellow
		:highlight fileNameColor ctermfg=cyan ctermbg=yellow 
	"Set status line content
        set statusline=  
        set statusline+=[%.3n]\  		              							" buffer number  
        set statusline+=%#fileNameColor#  	          							" filename   
        set statusline+=%F							  							" filename full path
        set statusline+=%*							  							" reset color to statusline
        set statusline+=%h%m%r%w                      							" status flags  
        set statusline+=%=                            							" right align remainder  
        set statusline+=Typ\[%{strlen(&ft)?&ft:'none'}]\   						" file type  
		set statusline+=Enc[%{&fileencoding?&fileencoding:&encoding}]			" encoding
        set statusline+=\ Lin[%l\/%L]\ Col[%c]									" line number,column position
        set statusline+=%<%P                 							        " file position  
"============================================================================================================
"~~	|UI settings| ~~
"============================================================================================================
	"Ha van lehetőség, akkor menüben mutatja meg a TAB utáni autocomplete lehetőségeket
		set wildmenu 
	"A wildmode-ban kiírja a lehetőségeket is függőleges menüben
		"A longest azt csinálja, hogy csak az első ambiguitásig egészíti ki
		"Vessző után a full pedig a második tabra már teljesen kiegészíti
		set wildmode=list:longest,full
	"Turns visual bell and beep off
		set vb t_vb=
	"A tabokban csak a fájlnév, ne a path jelenjen meg
		set guitablabel=%t
	"Automatikusan ne szúrjon be sortörést -- eztet sajnos a source $VIMRUNTIME/vimrc_example.vim felülírja
		set textwidth=0
		set wrapmargin=0
		set formatoptions-=t
	"Sortörést állítja be (jobb oldalon nem megy ki margóig a szöveg)
		set linebreak 
	"Kicsit szellősebb sorokat állít be.
		set linespace=5 
	"Beállítja, hogy mindig max képernyőn nyíljon meg a VIM
		"set lines=999 columns=999 
	"Mindig mutasson státuszsort
		set laststatus=2 
	"Beállítja, a softtabok értékét 8-re
		set shiftwidth=4
		set tabstop=4
	"Beállítja, hogy a tabok is a shiftwidth értéke szerint menjenek
		set smarttab
	"Automatikuisan behúzza a sorokat.
		set autoindent 
	"Mindidg legyen sorszámozás
		set number 
	"Relative line number
		"set rnu 
	" turns cursorline off when leaving windows/buffer
		augroup CursorLine
			au!
			au VimEnter * setlocal cursorline
			au WinEnter * setlocal cursorline
			au BufWinEnter * setlocal cursorline
			au WinLeave * setlocal nocursorline
		augroup END
	"14 space-t szúr be shobreak után
		"let &showbreak=repeat(' ', 14) 
	" New split window on the right
		set splitright
	" New split window on the bottom
		set splitbelow
	" Scrollozásnál ennyi sort mindig mutat képernyő tetejéből-aljából-oldalából
		set scrolloff=5
		set sidescroll=1
		set sidescrolloff=10
	"" Zoom / Restore window.
		function! s:ZoomToggle() abort
			if exists('t:zoomed') && t:zoomed
				execute t:zoom_winrestcmd
				let t:zoomed = 0
			else
				let t:zoom_winrestcmd = winrestcmd()
				resize
				vertical resize
				let t:zoomed = 1
			endif
		endfunction
		command! ZoomToggle call s:ZoomToggle()
		nnoremap <leader>z :ZoomToggle<CR>
"============================================================================================================
"~~	|Cursor Movement and Edit Mappings| ~~
"============================================================================================================
	"ESC gomb átmappolása
		imap jk <Esc>
	"Shift-space: save all
		nnoremap <S-Space> :wa!<cr>
	"Accidental shift-W also saves
		"noremap :W :w<cr>
		:command W w
	"ENTER-re a képernyő közepére igazítja az aktuális sort
		"nnoremap <cr> zvzz
	"Kurzormozgatás átmappolása
		noremap j gj
		noremap k gk
		noremap gj j
		noremap gk k
	"Sor elejére és végére ugrás átmappingolása
		noremap H ^
		noremap L $
	"Lefelé scrollozás CTRL-s gombra, mert Windowsban a CTRL-y foglalt a lefelé scrollozásra,
		noremap <C-s> <C-y>
	"Insert módban autocomplete egyszerűsítés
	"Teljes sor kiegészítés
		inoremap <c-l> <c-x><c-l>
	"Fájlkiegészítés
		inoremap <c-f> <c-x><c-f>
	"Insert módban is lehessen sorok között mozogni
		inoremap <C-j> <up>
		inoremap <C-k> <down>
	"Insert módban így egészíti ki
		set completeopt=longest,menuone,preview
	"UndotreeToggle setup
		nnoremap U :UndotreeToggle<cr>
	"Setup folder for storing persistent undo information
		if has("persistent_undo")
			set undodir=~/.vim/undodir/
			set undofile
		endif	
	"Set the color for UndoTree add and change
		if !exists('g:undotree_HighlightSyntaxAdd')
			let g:undotree_HighlightSyntaxAdd = "DiffAdd"
		endif
		if !exists('g:undotree_HighlightSyntaxChange')
			let g:undotree_HighlightSyntaxChange = "StatusLine"
		endif 
	"Ctrl-A továbbra is növelje az alatta lévő számot. On Windows, your vimrc file may source mswin.vim or another script that maps Ctrl-A to Select All. 
		:nunmap <C-a>
"============================================================================================================
"~~	|Search and Substitute Settings| ~~
"============================================================================================================
	"Substitute kezdése egyszerűbben, automatikusan kieszképelve minden regexet
		nnoremap <leader>s :%s,\v
	"Keresés ne legyen betűérzékeny
		set ignorecase 
	"Ha csak kisbetűvel keresek, nem érzékeny, ha van benne nagybetű is, akkor igen.
		set smartcase 
	"Ha zárójelet nyitok, akkor egy pillanatra átugrik (a végére is), amikor bezártam
		set showmatch 
	"A keresési eredményeket már a keresés közben is mutatja a háttér kiemelésével
		set hlsearch 
	"Kiszedi a keresés kiemelését
		noremap <leader><space> :noh<cr>:call clearmatches()<cr>
	"Space-re keres előre, C-Space-re visszafelé, regexek very magicre állítva
		"noremap <Space> /\v
		"noremap <C-Space> ?\v
	" Keep search matches in the middle of the window and pulse the line when moving to them.
		nnoremap n nzzzv
		nnoremap N Nzzzv
	" Ugyanúgy automatikusan középre zoomol előző-következő change-re ugrásnál is
	" Valamint felcseréli az előre-hátra haladást, az előző változtatás lesz a g,
		"nnoremap g; g,zz
		"nnoremap g, g;zz
	"map to search the visually selected text
		vnoremap // y/<C-R>"<CR>
"============================================================================================================
"~~	|Tab and Window Settings| ~~
"============================================================================================================
	"Tabkezeléshez tabváltás balra-jobbra CTRL H és L gombokkal, illetve "CTRL balra és jobbra nyilakkal
		noremap <C-l> gt
		noremap <C-h> gT
		nnoremap <C-left> gT
		nnoremap <C-right> gt
	"Windowskezelés, normál módban kurzor billentyűk az ablakok között váltogatnak
		nnoremap <left> <C-w>h 
		nnoremap <right> <C-w>l
		nnoremap <down> <C-w>j
		nnoremap <up> <C-w>k
		noremap <C-j> <C-w>j
		noremap <C-k> <C-w>k
	"A TAB gomb normál módban az ablakok között váltogat
	"Ha a <tab>-ot átmappolom, akkor a <c-i> sem fog működni, ami a jumplisten ugráláshoz kell, mert ez a kettő valamiért össze van kötve!
		"nnoremap <tab> <c-w>w
		"nnoremap <s-tab> <c-w>W
	" ALT-HJKL is ablakok között váltogat
		nnoremap <m-h> <c-w>h
		nnoremap <m-l> <C-w>l
		nnoremap <m-j> <C-w>j
		nnoremap <m-k> <C-w>k
	" Window resizing
		nnoremap <S-C-right> 5<c-w>>
		nnoremap <S-C-left> 5<c-w><
		nnoremap <S-C-up> 5<c-w>+
		nnoremap <S-C-down> 5<c-w>-
	"Minden ablakváltáskor ment egyet.
		"au FocusLost * :wa 
	"Mindig mentse az aktuális view-t a fájlhoz -> kikapcsoltam, mert sok hibát dobott.
		"au BufWinLeave * mkview
		"au BufWinEnter * silent loadview
	"Az új split mindig jobbra és lent nyíljon.
		set splitright
		set splitbelow
"============================================================================================================
"~~	|Function Key Mappings| ~~
"============================================================================================================
	"Buffer kilistázás és belépés választás módba
		nnoremap <f1> :ls<cr>:b 
	"Alternatív (előzőleg megnyitott) buferre vált
		nnoremap <F2> :b#<cr>
	"Bufferek között vált F4-F3-ra
		nnoremap <F4> :bnext <CR>
		nnoremap <F3> :bprevious<CR>
	"Minden nyitott buffert elment 
		"map <F5> :wa! <bar> mkview <cr>
		map <F5> :wa!<cr>
	"Azoknak a soroknak kiírása global-al, amelyekben benne van a dupla ~ jel
		"map <F10> :g/\~\~<cr>
	"Minden tabot elment egy "sessionsave" nevű file-ba.
		map <F6> :mksession! $HOME/.vim/sessions/sessionmanualsave.vim<cr>
		map <F9> :so $HOME/.vim/sessions/sessionmanualsave.vim<cr>
	"Opens a new tab
		map <F10> :tabnew<cr>
"============================================================================================================
"~~	|Session Settings| ~~
"============================================================================================================
	"Function to save a session file to the specified folder
	function! MakeSession()
	  let b:sessiondir = $HOME . "/.vim/sessions" 
	  ". getcwd()
	  if (filewritable(b:sessiondir) != 2)
		exe 'silent !mkdir -p ' b:sessiondir
		redraw!
	  endif
	  let b:filename = b:sessiondir . '/session.vim'
	  exe "mksession! " . b:filename
	endfunction

	"Function to load a session file from the specified folder
	function! LoadSession()
	  let b:sessiondir = $HOME . "/.vim/sessions"
	  ". getcwd()
	  let b:sessionfile = b:sessiondir . "/session.vim"
	  if (filereadable(b:sessionfile))
		exe 'source ' b:sessionfile
	  else
		echo "No session loaded."
	  endif
	endfunction

	" Adding automatons for when entering or leaving Vim
	"au VimEnter * nested :call LoadSession()
	"au VimLeave * :call MakeSession()
"============================================================================================================
"~~	|FOLD Settings| ~~
"============================================================================================================
	" Sets foldmethod to indent
		nnoremap <leader>fi :set foldmethod=indent<cr>
	" Sets foldmethod to manualj
		nnoremap <leader>fm :set foldmethod=manual<cr>
	" always show folds
		set foldcolumn=1
	" Display folds with one rows 
		set foldminlines=0
"============================================================================================================
"~~	|File, Backup, WorkDir, Shell, Encoding Settings| ~~
"============================================================================================================
	"Ide rakja a backupot, .un file-t és swap file-t pedig ne csináljon
		set nobackup
		set noswapfile
		"set noundofile
	"Mentés nélkül is lehessen buffert váltani
		set hidden 
	"A mappaváltással a PWD is automatikusan változik
		set autochdir
		noremap <leader>cdoff :set noautochdir<cr>
	"To display proper special characters in Airline status
		set guifont=Consolas
	"Az aktuális fájl mappátját állítja be PWD-nek
	  	nnoremap <Leader>cd :cd %:h<bar>pwd<cr>
	" Reload file if it's modified outside
		set autoread
		set autowrite
"============================================================================================================
"~~	|Other Settings| ~~
"============================================================================================================
	"Opens the buffers list and calls :b ot get ready for buffer switching
	nnoremap <Space> :ls<CR>:b
	set textwidth=0

	" Set the cursor shape and color for vim (not gvim)
	" http://vim.wikia.com/wiki/Configuring_the_cursor
"	if &term =~ "xterm\\|rxvt"
"	  " use an orange cursor in insert mode
"	  let &t_SI = "\<Esc>[3 q\<Esc>]12;orange\x7"
"	  " use a red cursor otherwise
"	  let &t_EI = "\<Esc>[0 q\<Esc>]12;red\x7"
"	  silent !echo -ne "\033]12;red\007"
"	  " reset cursor when vim exits
"	   autocmd VimLeave * silent !echo -ne "\033]112\007"
"	endif

"============================================================================================================
"~~ |Changelog| ~~
"============================================================================================================
	"2021-02-17 - Added ZoomToggle function and mapped to leader z
	"2021-02-14 - Consolidate sneak and easymotion keys with Windows version
	"2017-07-15 - Add cursor color and shape settings for xterm mode (not for gvim)
	"2018-07-01 - Update Airline tabline (display tab number, hide buffer number) and status line (display full file path), add Sneak plugin
	"2018-03-02	- Add ,wdt ,wdu, wdo mappings as well as an alternative so it will be easier to remember
	"2018-02-27 - Collect all <leader> settings under one section, set Diff leaders
	"2018-02-26 - Add <leader>dh DiffHead, <leader>dl DiffLocal <leader>db DiffBase <leader>dr DiffRemote
	"2018-02-11 - Restructure & Rename sections
	"2018-02-10 - Replaced Pathogen with Vundle and added multiple plugins (see under Vundle)
	"2017-10-22 - This vimrc is updated for Linux. The .vimrc file in ~ is a symbolic link to the original file in the mydotfiles github folder
