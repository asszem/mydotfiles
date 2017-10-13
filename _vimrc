Last updated: 2017-10-14 01:05:20
"============================================================================================================
"~~	MAPLEADER Settings ~~
"============================================================================================================
	let mapleader=","
	"Toggle Nerdtree file manager with ,n 
	map <leader>n :NERDTreeToggle<cr>
	"Open the buffers list with ,b
	map <leader>b :buffers<cr>
	"Opens the jumps list. Ctrl-o and Ctrl-i to jump
	map <leader>j :jumps<cr>
	":diffupdate
	map <leader>du :diffupdate<cr>
"============================================================================================================
"~~	Plugins
"============================================================================================================
	"Pathogen
	execute pathogen#infect()

	"Nerdtree - always show the bookmarks 
	let NERDTreeShowBookmarks=1 
	"Ctrl-p
	set runtimepath^=~/.vim/bundle/ctrlp.vim
	"to open CtrlP with MRU-Files-Buffers mixed mode
	"map <c-p> :CtrlPMixed<cr>
	map <c-p> :CtrlPMRU<cr>
	let g:ctrlp_cmd = 'CtrlPMRU'
	"http://ctrlpvim.github.io/ctrlp.vim/#installation"
"============================================================================================================
"~~	Default settings ~~
"============================================================================================================
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


	"set diffexpr=MyDiff()
	"function MyDiff()
	"  let opt = '-a --binary '
	"  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
	"  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
	"  let arg1 = v:fname_in
	"  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
	"  let arg2 = v:fname_new
	"  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
	"  let arg3 = v:fname_out
	"  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
	"  let eq = ''
	"  if $VIMRUNTIME =~ ' '
	"    if &sh =~ '\<cmd'
	"      let cmd = '""' . $VIMRUNTIME . '\diff"'
	"      let eq = '"'
	"    else
	"      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
	"    endif
	"  else
	"    let cmd = $VIMRUNTIME . '\diff'
	"  endif
	"  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
	"endfunction
"============================================================================================================
"~~	WILDMENU settings ~~
"============================================================================================================
	"Ha van lehetőség, akkor menüben mutatja meg a TAB utáni autocomplete lehetőségeket
		set wildmenu 
	"A wildmode-ban kiírja a lehetőségeket is függőleges menüben
		"A longest azt csinálja, hogy csak az első ambiguitásig egészíti ki
		"Vessző után a full pedig a második tabra már teljesen kiegészíti
		set wildmode=list:longest,full
"============================================================================================================
"~~	FILE, BACKUP, MAPPA settings	 ~~
"============================================================================================================
	"Ide rakja a backupot, .un file-t és swap file-t pedig ne csináljon
		set nobackup
		set noswapfile
		set noundofile
	"Mentés nélkül is lehessen buffert váltani
		set hidden 
	"A mappaváltással a PWD is automatikusan változik
		set autochdir
		noremap <leader>cdoff :set noautochdir<cr>
	"Karakterkódolás beállítása
		set encoding=utf-8
	"Az aktuális fájl mappátját állítja be PWD-nek
	  	nnoremap <Leader>cd :cd %:h<bar>pwd<cr>
	" Reload file if it's modified outside
		set autoread
		set autowrite
"============================================================================================================
"~~	KERESÉSI és SUBSTITUTE settings ~~
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
		noremap <Space> /\v
		noremap <C-Space> ?\v
	" Keep search matches in the middle of the window and pulse the line when moving to them.
		nnoremap n nzzzv
		nnoremap N Nzzzv
	" Ugyanúgy automatikusan középre zoomol előző-következő change-re ugrásnál is
	" Valamint felcseréli az előre-hátra haladást, az előző változtatás lesz a g,
		nnoremap g; g,zz
		nnoremap g, g;zz
"============================================================================================================
"~~	GUI settings ~~
"============================================================================================================
	"Kikapcsolja az idegesítő csipogást és villogást
		set vb t_vb=
	"Beállítja a morning színsémát, az általam testreszabott státuszsorral
		:color peachpuff 
		:highlight statusline gui=NONE guibg=Orange guifg=Black
	"Státusz line variációk
		"set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ %P
		"set statusline=%<%F%h%m%r%h%w%y\ [FORMAT=%{&ff}]\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ %P
		"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%y.%m.%d\ -\ %H:%M:%S\")}
		"saját barkácsolás
		"set statusline=[%-n]\ %<%t%m%r%w%y\ %=\ Lin[%l\/%L]\ Col[%c%V]\ File[%F]\ Date[%{strftime(\"%Y.%m.%d.\|%H:%M\",getftime(expand(\"%:p\")))}]\ %P
		"set statusline=%f\ %=\ [%{strftime(\"%Y-%m-%d\ %H:%M\",getftime(expand(\"%:p\")))}]\ [%{&fileencoding?&fileencoding:&encoding}]\ [%-n]\ %m\ [%F]\ %=\ Lin[%l\/%L]\ Col[%c%V]\ %P
		set statusline=%f\ [%{strftime(\"%Y-%m-%d\ %H:%M\",getftime(expand(\"%:p\")))}]\ [%{&fileencoding?&fileencoding:&encoding}]\ [%-n]\ %m\ %=\ [%F]\ Lin[%l\/%L]\ Col[%c%V]\ %P
	"A menük eltüntetése, csak a tab marad meg
		set guioptions=ae
		"set go-=T 
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
	"Mutatja hol a kurzor
		set cursorline 
	"14 space-t szúr be shobreak után
		let &showbreak=repeat(' ', 14) 
	" New split window on the right
		set splitright
	" New split window on the bottom
		set splitbelow
	" Scrollozásnál ennyi sort mindig mutat képernyő tetejéből-aljából-oldalából
		set scrolloff=5
		set sidescroll=1
		set sidescrolloff=10
"============================================================================================================
"~~	KURZORMOZGATÁS, SZERKESZTLÉS MAPPINGEK ~~
"============================================================================================================
	"ESC gomb átmappolása
		imap ii <Esc>
		imap jk <Esc>
	"Shift-space: save all
		nnoremap <S-Space> :wa!<cr>
	"Accidental shift-W also saves
		"noremap :W :w<cr>
		:command W w
	"ENTER-re a képernyő közepére igazítja az aktuális sort
		nnoremap <cr> zvzz
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
	"Gundo toggle átmappolása
		nnoremap U :GundoToggle<cr>
	"Dokumentum aljára ugrás
		nnoremap <Leader>g G<cr>
	"marks-ra ugrás
		nnoremap <Leader>m '
	"marksok mutatása
		nnoremap <Leader>ma :marks<cr>
	"Ctrl-A továbbra is növelje az alatta lévő számot. On Windows, your vimrc file may source mswin.vim or another script that maps Ctrl-A to Select All. 
		:nunmap <C-a>
"============================================================================================================
"~~	TAB és WINDOWS ABLAK KEZELÉS ~~
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
	"Ablakkezelés mapleaderekkel
	"	nnoremap <Leader>h <C-w>h
	"	nnoremap <Leader>l <C-w>l
	"	nnoremap <Leader>j <C-w>j
	"	nnoremap <Leader>k <C-w>k
	" ALT-HJKL is ablakok között váltogat
		nnoremap <m-h> <c-w>h
		nnoremap <m-l> <C-w>l
		nnoremap <m-j> <C-w>j
		nnoremap <m-k> <C-w>k
	" Window resizing
		nnoremap <S-C-left> 5<c-w>>
		nnoremap <S-C-right> 5<c-w><
		nnoremap <S-C-up> 5<c-w>+
		nnoremap <S-C-down> 5<c-w>-
	"Minden ablakváltáskor ment egyet.
		au FocusLost * :wa 
	"Mindig mentse az aktuális view-t a fájlhoz -> kikapcsoltam, mert sok hibát dobott.
		"au BufWinLeave * mkview
		"au BufWinEnter * silent loadview
	"Az új split mindig jobbra és lent nyíljon.
		set splitright
		set splitbelow
"============================================================================================================
"~~	FUNKCIÓ BILLENTYŰ MAPPINGEK ~~
"============================================================================================================
	"Buffer kilistázás és belépés választás módba
		nnoremap <f1> :ls<cr>:b 
		" ,bl buffers-list kombóra is beállítom, meglátjuk idővel
		" melyiket lesz kényelmesebb használni
		nnoremap <Leader>bl :ls!<cr>:b 
	"Alternatív (előzőleg megnyitott) buferre vált
		nnoremap <F2> :b#<cr>
	"Bufferek között vált F4-F3-ra
		nnoremap <F4> :bnext <CR>
		nnoremap <F3> :bprevious<CR>
	"Minden nyitott buffert elment 
		"map <F5> :wa! <bar> mkview <cr>
		map <F5> :wa!<cr>
	"Azoknak a soroknak kiírása global-al, amelyekben benne van a dupla ~ jel
		map <F10> :g/\~\~<cr>
	"Minden tabot elment egy "sessionsave" nevű file-ba.
		map <F6> :mksession! $HOME\vimfiles\sessions\session.vim<cr>
		map <F9> :so $HOME\vimfiles\sessions\session.vim<cr>
	"Opens a new tab
		map <F10> :tabnew<cr>

"============================================================================================================
"~~	SESSION Settings ~~
"============================================================================================================
	"Function to save a session file to the specified folder
	function! MakeSession()
	  let b:sessiondir = $HOME . "\\vimfiles\\sessions" 
	  ". getcwd()
	  if (filewritable(b:sessiondir) != 2)
		exe 'silent !mkdir -p ' b:sessiondir
		redraw!
	  endif
	  let b:filename = b:sessiondir . '\\session.vim'
	  exe "mksession! " . b:filename
	endfunction

	"Function to load a session file from the specified folder
	function! LoadSession()
	  let b:sessiondir = $HOME . "\\vimfiles\\sessions"
	  ". getcwd()
	  let b:sessionfile = b:sessiondir . "\\session.vim"
	  if (filereadable(b:sessionfile))
		exe 'source ' b:sessionfile
	  else
		echo "No session loaded."
	  endif
	endfunction

	" Adding automatons for when entering or leaving Vim
	"au VimEnter * nested :call LoadSession()
	au VimLeave * :call MakeSession()
"============================================================================================================
"~~	EGYÉB BEÁLLÍTÁSOK ~~
"============================================================================================================
	"Start Gvim maximized
	au GUIEnter * simalt ~m
	" to start commands with ; --- not sure if I will like this
	"nnoremap ; :
	"Ez a helpben fontos, eredetilega  CTRL-G az az aktulis fájl infoit mutatja.
		noremap <C-g> <C-]>
	"Timestamp beállítások
		nmap <leader>ts A<C-R>=strftime(" [%m.%d. %H:%M:%S]")<CR><Esc>
		nmap <leader>tl A<C-R>=strftime(" [%Y.%m.%d. %A \| %H:%M:%S]")<CR><Esc>
		nmap <leader>td O<C-R>=strftime("%Y.%m.%d.")<CR><Esc>
		"Az aktuális pozíciótól törli a tartalmat és új timestampot
		"szúr be (timestamp long UPDATE)
		nmap <leader>tlu C<C-R>=strftime("[%Y.%m.%d. %A \| %H:%M:%S]")<CR><Esc>
	"ToDo listhez 
		" ,d a sor elejét +ra alakítja (DONE)
		" ,dd a sor elejét !-ra alakítja ("Don'tDone")
		nmap <leader>d :s,\(^\s*\)!,\1+,e<cr>:noh<cr>
		set magic
		nmap <leader>dd :s,\(^\s*\)[+\|-],\1!,e<cr>:noh<cr>
"============================================================================================================
"~~	FOLD beállítások
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
"~~	SHELL Settings	 ~~
"============================================================================================================
	"Set Powrshell as default shell
	"Removed this option, because vimdiff did not work well in powershell
		"set shell=powershell
		"set shell=%SystemRoot%\syswow64\WindowsPowerShell\v1.0\powershell.exe
		"set shellcmdflag=-Command
	"Source
		"http://juliankay.com/development/setting-up-vim-to-work-with-powershell/
"============================================================================================================
"~~	Computer specific settings ~~
"============================================================================================================
	"set viewdir=d:\Dropbox\VIMDropbox\viewdir\
