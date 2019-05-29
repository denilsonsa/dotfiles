scriptencoding utf8
set encoding=utf8

" Inconsolata is a great font. Source Code Pro is almost as good.
"set guifont=Inconsolata\ Medium\ 8
set guifont=Inconsolata\ Medium\ 9
set linespace=-1
"set guifont=Source\ Code\ Pro\ Medium\ 8
"
" Very similar:
"set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
"set guifont=Droid\ Sans\ Mono\ 9
"set guifont=Liberation\ Mono\ 9
"
" Seems to be the same as Bitstream Vera Sans Mono
"set guifont=Monospace\ 9
"
" Proggy fonts:
" SZ = Slashed Zero
" BP = Bold Punctuation
"set guifont=ProggyTinyTT\ 11
"set guifont=ProggySquareTT\ 11
"set guifont=ProggySmallTT\ 11
"set guifont=ProggyCleanTT\ 11

"set nocompatible ruler laststatus=2 showcmd esckeys
set  nocp         ruler ls=2         sc      ek

"set noexpandtab tabstop=4 shiftwidth=4 textwidth=0 shiftround
set  noet        ts=4      sw=4         tw=0        sr
"This is for global vimrc respect my tw setting.
let g:leave_my_textwidth_alone=1

"set autoindent smartindent cindent
set  ai         nosi        nocin
" Do not reindent the line if the first typed character is #.
" Use-case: visual-block several lines, then I, then #. If the line is
" reindented, it doesn't work as I expect.
set indentkeys-=0#
" These have been moved to AFTER pathogen plugin
filetype indent on
filetype plugin on

"This makes backspace work correctly!
"set backspace=2
set  bs=2

"This uses short messages. To get the whole message, use ":file!"
"set shortmess=at
set  shm=at

"The keys Left, Right, Backspace and Space will wrap to next/previous line.
"set whichwrap=<,>,b,s
set ww=<,>,b,s,[,]

"Syntax highlighting
" This have been moved to AFTER pathogen plugin
syn on

"Highlight search pattern (use :noh to set it off)
"set hlsearch
set  hls
"set incsearch ignorecase smartcase
set  is        ic         scs
"set wrapscan
"set ws

set number

"set formatoptions
set  fo+=orj
set  fo-=w
" Default: tcq
" t = wrap using textwidth
" c = wrap comments
" r = auto-insert comment leader after Enter
" o = auto-insert comment leader after o or O command
" q = allow formatting comments using gq
" w = <not very useful>
" a = automatic formatting of paragraphs
" n = recognize numbered lists
" 2 = use the indent of the second line of a paragraph
" v = <didn't understand>
" b = <didn't understand>
" l = don't break long lines
" m = <only useful for asian languages>
" M = <only useful for asian languages>
" B = <only useful for asian languages>
" 1 = don't break after a one-letter word
" j = Where it makes sense, remove a comment leader when joining lines.

" http://www.lesswatts.org/projects/powertop/known.php#gvim
" The gvim program has a blinking cursor which wakes up things regularly.
" You can fix this by putting
let &guicursor = &guicursor . ",a:blinkon0"

set wildmenu
set wildmode=longest:full

" http://stackoverflow.com/questions/307148/vim-scrolling-slowly
"set cursorline
"set cursorcolumn
"au GUIEnter * set cursorline

au FileType nerdtree,help setl nocursorline nocursorcolumn

" Highlight the column right next to the 'textwidth'.
" See :help colorcolumn for more information about this setting.
"set colorcolumn=+1

" See :help errorbells
"set noerrorbells novisualbell

" Don't redraw the screen while running macros
"set lazyredraw

" Show opening bracket for 2 tenths of a second
set showmatch matchtime=2

" Interesting, but I'm not sure if I would like this
" :help undo-persistence
"set undofile undodir=~/.vim/undodir

" lastline: Show as much as possible of the visible line in a window, even if it doesn't fit.
" uhex:     Show unprintable characters hexadecimal as <xx> instead of using ^C and ~C.
set display=lastline,uhex

" Wrapped lines maintain the same indentation as previous lines
set breakindent

"set listchars=eol:$,tab:>.,trail:@,extends:>,precedes:<,nbsp:~
set listchars=eol:⏎,tab:↹_,trail:•,extends:»,precedes:«,nbsp:␣
" Ideas for showbreak: ↳‖⁞⁝⋮⍿⎸⏐│┆┊╎║❘⦀⦙⦚⫶⫼⸽⸾
"set showbreak=>>\ 
"set showbreak=↳\ 
set showbreak=⸾
set sidescroll=10
set winminheight=0
set noequalalways
set nojoinspaces
set cpoptions+=$
set guioptions-=T
set nrformats=alpha,hex
set isfname=@,48-57,/,.,-,_,+,,,#,$,%,~
set path+=/usr/local/include
set history=1000

" I don't want to search included files.
set complete-=i

set mouse=a
set mousemodel=popup_setpos
if &term =~ '^screen'
	" http://superuser.com/questions/549930/cant-resize-vim-splits-inside-tmux
	set ttymouse=sgr
endif
" Emulating xterm shift+left_click behavior (of doing nothing)
noremap <S-LeftMouse> <Nop>


" sesdir might be useful
set sessionoptions=blank,curdir,resize,tabpages,winsize

set viminfo=!,<500,s10,'50,/50,:500,@500,h
"viminfo help:"{{{
" ! - Save and restore global variables that start with uppercase and does not have lower case characters.
" < - Maximum number of lines saved for each register.
" " - Old name of '<', requiring a backslash to escape.
" s - Maximum size of an item (a saved register), in Kbyte.
" % - Save and restore buffer list.
" ' - Maximum number of edited files for which the marks are remembered.
" / - Maximum number of items in search pattern history.
" : - Maximum number of items in command-line history.
" @ - Maximum number of items in input-line history.
" c - Convert viminfo text from/to 'encoding'.
" f - Whether file marks need to be stored.
" h - Disable the effect of 'hlsearch' when loading viminfo file.
" n - Name of the viminfo file.
" r - Removable media. List of pathes for which no marks will be saved.
"}}}

"Autodetect UTF-16 files (Opera saves some html files as UTF-16le)
" Not needed, as the default is already "ucs-bom,utf-8,default,latin1" if
" 'encoding' is set to a Unicode value.
if has("multi_byte")
	"set fileencodings=ucs-bom,utf-16,utf-16le,latin1
	"set fileencodings=ucs-bom,utf-16,utf-16le
	"I don't know if the next line will hurt, so, I will stick to the previous one.
	"set fileencodings=ucs-bom,utf-16,utf-16le,utf-8,latin1
endif


" From http://fishshell.org/wiki/moin.cgi/Recipes at 2008-01-06
" And also https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim
" Why does VIM give error messages when started from fish?
" (Thanks to James Vega for this solution)
"
" When run from the fish shell, VIM gives error messages like: "E484: Can't open file /tmp/v916556/0"
"
" The problem occurs because VIM expects to be run from a POSIX shell, although this is not mentioned anywhere in the documentation. A workaround is to add the following lines to the your local ~/.vimrc or global /etc/vimrc file:
"if $SHELL =~ 'bin/fish'
if &shell =~# 'fish$'
    set shell=/bin/sh
endif
" Assuming /bin/sh is a link to a POSIX compliant shell - even minimal shells like 'ash' or 'dash' will do.

function RestoreMyColorScheme()
	"colorscheme default

	"Some colors and background
	"set background=dark
	set  bg=dark
	highlight Normal guibg=Black guifg=White
	"highlight Normal ctermbg=Black ctermfg=Grey
	highlight Visual gui=reverse guifg=Gray guibg=Black

	highlight Folded     term=standout cterm=none ctermfg=7 ctermbg=4 guifg=DarkGrey guibg=#000050
	highlight FoldColumn term=standout cterm=none ctermfg=8 ctermbg=4 guifg=White    guibg=#000070

	" This is the default CursorLine setting:
	" highlight CursorLine term=underline cterm=underline guibg=Grey40
	" I chose to reset it in order to remove those term/cterm settings.
	" I could probably have set term=NONE cterm=NONE instead.
	highlight CursorLine NONE
	highlight CursorLine guibg=#151515
endfunction

call RestoreMyColorScheme()

"Folding settings"{{{
"set foldmethod=marker
"set foldtext=MyFoldText()
set fillchars=vert:\ ,fold:\ 

"Set folding options for CSS files
au FileType css,*.css setlocal foldmethod=marker foldmarker={,} foldcolumn=3

"Set folding for HTMLTemplate files
au FileType tmpl,*.tmpl setlocal foldmethod=marker foldmarker=<TMPL_BLOCK,</TMPL_BLOCK> foldtext=v:folddashes.getline(v:foldstart)

" Perl folding in Vim doesn't work well. In fact, it is pretty bad.
" :help perl.vim
"let perl_fold=1
"let perl_fold_anonymous_subs=1
"let perl_fold_blocks=1

"zS shows folds. zS stands for Show
nnoremap <silent> zS :let &foldcolumn=&foldcolumn==0?4:0<CR>


"This adds leading chars to thestr up to number chars
function AddLeading(chars, thestr, number)
	let a = a:thestr
	while strlen(a) < a:number
		let a = a:chars . a
	endwhile
	return a
endfunction

"This removes C and C++ comments from line.
function MyFoldText()
	let line = getline(v:foldstart)
	let sub = substitute(line, '/\*\s*{{'.'{\d\?\s*\*/\|\(//\)\?\s*{'.'{{\d\?\|^\s\+\|\s\+$', '', 'g')
	return v:folddashes . '[' . AddLeading(' ', (v:foldend - v:foldstart + 1), 3) . ']  ' . sub
"	return substitute(foldtext(),'//\|^+-','','g')
endfunction

"}}}

"(Not) Configuring print"{{{
function PrintFile(fname)
  call system("evince " . a:fname)
"  call system("gv " . a:fname)
"  call system("lpr -Paps1 -C draft:mono:a4:4pps " . a:fname)
" My Opera settings: -C hi:4pps:duplex:longbind
  call delete(a:fname)
  return v:shell_error
endfunc

function ConfigurePrinting()
	"h is the font height
	set printfont=courier:h8
	set printexpr=PrintFile(v:fname_in)
"	set printheader="%t%=Page %N"
"	set printheader="%<%f%h%m%=Page %N"
	set printoptions=paper:A4,left:10mm,right:10mm,top:10mm,bottom:15mm
" left:10mm,right:10mm,top:10mm,bottom:15mm
"     Set margins. Units: in, pt (defined as 1/72 of an inch), mm, pc
"     (percentage of media size)
"
" header:{nr} <default:2>
"     Number of lines to reserve for the header. Only the first line is
"     actually. Set 0 to disable header. See also 'printheader' option.
"
" syntax:{y|n|a} <default:a>
"     y/n = Enable/disable syntax highlighting (disabled is faster).
"     a   = Auto (enable it if the printer appears to be able to print color
"           or grey)
"
" number:{y|n} <default:n>
"     Include line numbers in the printed output.
"
" wrap:{y|n} <default:y>
"     Wrap long lines.
"
" duplex:{off|long|short} <default:long>
"     off   = Print on one side.
"     long  = Print on both sides (when possible), bind on long side.
"     short = Print on both sides (when possible), bind on short side.
"
" collate:{y|n} <default:y>
"     y = 1 2 3, 1 2 3, 1 2 3
"     n = 1 1 1, 2 2 2, 3 3 3
"
" jobsplit:{y|n} <default:n>
"     y = Do each copy as a separate print job.
"     n = Do all copies in one print job
"
" portrait:{y|n} <default:y>
"     Sets orientation to portrait or landscape.
"
" paper:{10x14|A3|A4|A5|B4|B5|executive|folio|ledger|legal|letter|quarto|
"        statement|tabloid} <default:A4>
"
" formfeed:{y|n} <default:n>
"     If yes, form feed character (0x0c) will force next characters being
"     printed on next page.

endfunc
"}}}


" Some settings copied from Gentoo's vimrc {{{
" http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/app-editors/vim-core/files/

" Minimum width to 3 instead of the default 4.
set numberwidth=3


"" {{{ Terminal fixes
"if &term ==? "xterm"
"  set t_Sb=^[4%dm
"  set t_Sf=^[3%dm
"  set ttymouse=xterm2
"endif
"
"if &term ==? "gnome" && has("eval")
"  " Set useful keys that vim doesn't discover via termcap but are in the
"  " builtin xterm termcap. See bug #122562. We use exec to avoid having to
"  " include raw escapes in the file.
"  exec "set <C-Left>=\eO5D"
"  exec "set <C-Right>=\eO5C"
"endif
"" }}}

" {{{ Fix &shell, see bug #101665.
if "" == &shell
  if executable("/bin/bash")
    set shell=/bin/bash
  elseif executable("/bin/sh")
    set shell=/bin/sh
  endif
endif
"}}}

"" When editing a file, always jump to the last cursor position
"autocmd BufReadPost *
"	\ if ! exists("g:leave_my_cursor_position_alone") |
"	\     if line("'\"") > 0 && line ("'\"") <= line("$") |
"	\         exe "normal g'\"" |
"	\     endif |
"	\ endif

autocmd BufReadPost *
	\ if line("'\"") > 0 && line ("'\"") <= line("$") && &filetype != "gitcommit" && &filetype != "hgcommit" |
	\     exe "normal g'\"" |
	\ endif

"}}}


"Set <Leader> key
"Default is \
"let mapleader = ']'

" Normally, ~ works on a single character.
" If 'tildeop'|'top' is on, then ~ is an operator, just like gu.
" Either way, g~ always behaves as an operator.
"set tildeop

"This cleans the "highlight search" (only works on GUI)
nnoremap <M-/> :nohlsearch<CR>

"<C-L> will clear the search highlighting and will update the diff.
"Copied from https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

"This makes "Y" to work from the cursor to the end of line (which is more logical, but not Vi-compatible). See :help Y
nnoremap Y y$

"Keep the cursor at the same location after a visual-yank.
"https://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

"Allows undoing i_CTRL-W (delete word) and i_CTRL-U (delete line).
"http://vim.wikia.com/wiki/Recover_from_accidental_Ctrl-U
"https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>

"Shift + Up/Down is annoying, and I always press by accident. Let me remap them to something harmless.
"nnoremap <S-Up> <Up>
"vnoremap <S-Up> <Up>
"inoremap <S-Up> <Up>
"nnoremap <S-Down> <Down>
"vnoremap <S-Down> <Down>
"inoremap <S-Down> <Down>
set keymodel=startsel

"Do not run a program to lookup the keyword. I always press K by mistake when
"trying to press J.
"nnoremap K <Nop>
vnoremap K <Nop>

"Do not switch to Ex mode.
nnoremap Q <Nop>

"Disabling u and U in visual mode, as I always press them by mistake.
"Note that gu and gU still work in visual mode.
vnoremap u <Nop>
vnoremap U <Nop>

"Using <space> to open/close a folding.
" http://stackoverflow.com/questions/357785/what-is-the-recommended-way-to-use-vim-folding-for-python-coding/360634#360634
nnoremap <space> za
"vnoremap <space> zf

"Using Ctrl+Tab to switch windows.
nnoremap <C-Tab> <C-W>w
nnoremap <C-S-Tab> <C-W>W

"Using Alt+arrows to switch windows.
nnoremap <M-Left> <C-W>h
nnoremap <M-Down> <C-W>j
nnoremap <M-Up> <C-W>k
nnoremap <M-Right> <C-W>l

"ABNT-2 keyboard has ç in the place of ;/:
nnoremap ç ;
vnoremap ç ;
nnoremap Ç :
vnoremap Ç :

"Changing to the directory of the current file.
nnoremap cd :cd %:h<CR>

"Disabling the <F1> shortcut to open help. Instead, let's remap it to Escape.
"inoremap <F1> <Esc>
" F1 is remapped to tagbar.
"nnoremap <F1> <Esc>

"Some useful mappings to next/previous error"{{{
"nnoremap <silent> <Leader><PageUp>      :cprev<CR>
"vnoremap <silent> <Leader><PageUp> <C-C>:cprev<CR>
"inoremap <silent> <Leader><PageUp> <C-O>:cprev<CR>
"nnoremap <silent> <Leader><PageDown>      :cnext<CR>
"vnoremap <silent> <Leader><PageDown> <C-C>:cnext<CR>
"inoremap <silent> <Leader><PageDown> <C-O>:cnext<CR>
"nnoremap <silent> <Leader><Home>      :cfirst<CR>
"vnoremap <silent> <Leader><Home> <C-C>:cfirst<CR>
"inoremap <silent> <Leader><Home> <C-O>:cfirst<CR>
"nnoremap <silent> <Leader><End>      :clast<CR>
"vnoremap <silent> <Leader><End> <C-C>:clast<CR>
"inoremap <silent> <Leader><End> <C-O>:clast<CR>
"}}}

"Some useful mappings to next/previous buffer"{{{
nnoremap <silent> <F4>      :bnext<CR>
"vnoremap <silent> <F4> <C-C>:bnext<CR>
inoremap <silent> <F4> <C-O>:bnext<CR>
nnoremap <silent> <S-F4>      :bprev<CR>
"vnoremap <silent> <S-F4> <C-C>:bprev<CR>
inoremap <silent> <S-F4> <C-O>:bprev<CR>
"nnoremap <silent> <C-F4>      :bdelete<CR>
vnoremap <silent> <C-F4> <C-C>:bdelete<CR>
inoremap <silent> <C-F4> <C-O>:bdelete<CR>
"}}}

"Some useful digraphs (in addition to default ones)"{{{
" ?? -> ¿  (also ?I)
dig ?? 191
"This is already mapped to |
"dig !! 204
" !! -> ¡  (also !I)
"dig !! 161
"}}}

"Configuring netrw Plugin "{{{

" By default, netrw chooses 'links' if it is available.
" However, for some reason, this breaks HTTP loading.
" I'm hardcoding wget here. If for some reason I don't have wget, I can
" also hardcode curl here.

let g:netrw_http_cmd = "wget"
let g:netrw_http_xcmd = "-q -O"
"let g:netrw_http_cmd = "curl"
"let g:netrw_http_xcmd = "-o"

"}}}

"Not configuring TList Plugin (taglist.vim)"{{{
" I've disabled taglist plugin, I'm now using tagbar
" https://github.com/majutsushi/tagbar
" 
" let Tlist_Winwidth=20
" let Tlist_Inc_Winwidth=0
" let Tlist_Compact_Format = 1
" "let Tlist_Display_Prototype = 1
" let Tlist_Enable_Fold_Column = 0
" "let Tlist_Exit_OnlyWindow = 1
" let Tlist_GainFocus_On_ToggleOpen = 1
" let Tlist_Show_Menu = 1
" let Tlist_Use_SingleClick = 1
" 
" "      F1 -> open/update Tlist window
" "Shift-F1 -> Close Tlist window
" nnoremap <silent> <F1>      :if bufwinnr(g:TagList_title) != -1\|TlistUpdate<CR>endif\|TlistOpen<CR>endif<CR>
" vnoremap <silent> <F1> <C-C>:if bufwinnr(g:TagList_title) != -1\|TlistUpdate<CR>endif\|TlistOpen<CR>endif<CR>
" inoremap <silent> <F1> <C-O>:if bufwinnr(g:TagList_title) != -1\|TlistUpdate<CR>endif\|TlistOpen<CR>endif<CR>
" nnoremap <silent> <S-F1>      :TlistClose<CR>
" vnoremap <silent> <S-F1> <C-C>:TlistClose<CR>
" inoremap <silent> <S-F1> <C-O>:TlistClose<CR>
" " Old mappings:
" "nnoremap <silent> <F1>      :if bufwinnr(g:TagList_title) == -1\|Tlist<CR>else\|TlistUpdate<CR>endif<CR>
" "vnoremap <silent> <F1> <C-C>:if bufwinnr(g:TagList_title) == -1\|Tlist<CR>else\|TlistUpdate<CR>endif<CR>
" "inoremap <silent> <F1> <C-O>:if bufwinnr(g:TagList_title) == -1\|Tlist<CR>else\|TlistUpdate<CR>endif<CR>

"}}}

"Configuring Tagbar Plugin (tagbar.vim)"{{{
" https://github.com/majutsushi/tagbar

let g:tagbar_width = 25
"let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
let g:tagbar_expand = 0
let g:tagbar_indent = 1
let g:tagbar_show_visibility = 0

" Removing variables from PHP list.
" See also:
" https://gist.github.com/ecoleman/1525027
" :help :TagbarGetTypeConfig
let g:tagbar_type_php = {
    \ 'kinds' : [
        \ 'i:interfaces',
        \ 'c:classes',
        \ 'd:constant definitions:0:0',
        \ 'f:functions',
        \ 'j:javascript functions',
    \ ],
\ }

" Removing variables from Python list.
" See also:
let g:tagbar_type_python = {
    \ 'kinds' : [
        \ 'i:imports:1:0',
        \ 'c:classes',
        \ 'f:functions',
        \ 'm:members',
    \ ],
\ }

"Open/focus tagbar
nnoremap <silent> <F2>   :TagbarOpen<CR>
"Close it
"(also possible by pressing "q" while tagbar is focused)
nnoremap <silent> <S-F2> :TagbarClose<CR>

"}}}

"Configuring EnhancedCommentify Plugin (EnhancedCommentify.vim)"{{{

"let g:EnhCommentifyRespectIndent = 'yes'
let g:EnhCommentifyPretty = 'yes'

let g:EnhCommentifyFirstLineMode = 'yes'
let g:EnhCommentifyTraditionalMode = 'no'
let g:EnhCommentifyUserBindings = 'no'

" See :help EnhComm-Keybindings

" <M-x> to comment, <M-c> to comment + one line down
" But <M-c> maps to ã character.
let g:EnhCommentifyUseAltKeys = 'no'

"}}}

"Configuring LargeFile Plugin (LargeFile.vim)"{{{

" Minimum size (in megabytes) in order to be considered a Large File
let g:LargeFile = 50

"}}}

"Configuring pep8 Plugin (pep8.vim)"{{{

let g:pep8_map = "<Leader>8"

"}}}

"Configuring perldoc-vim"{{{

" Disabling K key.
let g:perldoc_no_default_key_mappings = 1

"}}}

"Configuring DirDiff plugin (DirDiff.vim)"{{{

let g:DirDiffExcludes = "CVS,.hg,.git,*.class,*.exe,*.o,*.pyc,*.pyo,.*.swp"

"}}}

"Configuring NERD tree plugin (NERD_tree.vim)"{{{

" Default: 31
let NERDTreeWinSize=25

" If I ever want to change the sort order...
"let NERDTreeSortOrder=

let NERDTreeIgnore=['\.py[co]$', '^__pycache__$', '\.class$', '\.o$', '\.sw[op]$', '\.gif', '\.png', '\.jpg', 'favicon\.ico']

" Default: 0
"let NERDTreeShowHidden=1

" Default: 0
"let NERDTreeCaseSensitiveSort=1

" Default: $HOME/.NERDTreeBookmarks
let NERDTreeBookmarksFile=expand("~/.vim/NERDTreeBookmarksFile")
" Default: 0
let NERDTreeShowBookmarks=1

" Default: 1
"let NERDTreeMouseMode=2

" Unicode arrows? Nah...
"let NERDTreeDirArrows=1

" Default: 1
let NERDTreeHighlightCursorline=0

"}}}

"Configuring vim-indent-guides plugin"{{{
"http://www.vim.org/scripts/script.php?script_id=3361

let g:indent_guides_auto_colors = 0 
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#050505 ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#101010 ctermbg=darkgrey

"let g:indent_guides_guide_size = 1
" They slow down Vim too much.
let g:indent_guides_enable_on_vim_startup = 0

let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar']

" https://github.com/nathanaelkane/vim-indent-guides/issues/26
"au FileType *  IndentGuidesDisable
"au FileType c,cpp,cs,objc,objcpp  IndentGuidesEnable
"au FileType python,pyrex,perl,perl6,pascal  IndentGuidesEnable
"au FileType sh,awk,go,lua,tcl,vim  IndentGuidesEnable
"au FileType basic,vb  IndentGuidesEnable
"au FileType tex  IndentGuidesEnable
"au FileType yaml  IndentGuidesEnable
"au FileType lisp,scheme  IndentGuidesEnable
"au FileType java,jsp,javascript,php  IndentGuidesEnable
"au FileType html,htmlcheetah,htmldjango,svg,vrml,xhtml,xml  IndentGuidesEnable

"}}}

"Configuring securemodelines plugin (securemodelines.vim)"{{{

set nomodeline
let g:secure_modelines_verbose = 1
"let g:secure_modelines_modelines=5

let g:secure_modelines_allowed_items = [
			\ "textwidth",   "tw",
			\ "softtabstop", "sts",
			\ "tabstop",     "ts",
			\ "shiftwidth",  "sw",
			\ "expandtab",   "et",   "noexpandtab", "noet",
			\ "filetype",    "ft",
			\ "foldenable",  "fen",  "nofoldenable",  "nofen",
			\ "foldlevel",   "fdl",
			\ "foldmarker",  "fmr",
			\ "foldmethod",  "fdm",
			\ "foldnestmax", "fdn",
			\ "readonly",    "ro",   "noreadonly", "noro",
			\ "rightleft",   "rl",   "norightleft", "norl",
			\ "spell",               "nospell",
			\ "spelllang",
			\ "wrap",                "nowrap",
			\ "number",      "nu",   "nonumber", "nonu"
			\ ]

"}}}

"NOT Configuring Latex-Suite plugin (vim-latex)"{{{

" " WARNING!
" " There are severe bugs with vim-latex plugin. Look here for details:
" " https://bbs.archlinux.org/viewtopic.php?pid=713256
" " But that workaround didn't work for me.
" " See also:
" " http://comments.gmane.org/gmane.comp.editors.vim.latex.devel/151
" 
" set grepprg=grep\ -nH\ $*\ /dev/null
" let g:tex_flavor='latex'
" 
" au FileType tex,*.tex setlocal iskeyword+=:
" 
" " This is the default value:
" "let g:Tex_FoldedEnvironments = "verbatim,comment,eq,gather,align,figure,table,thebibliography,keywords,abstract,titlepage"
" " Adding abntex and latex-beamer environments:
" "let g:Tex_FoldedEnvironments = ",resumo,folhadeaprovacao,frame"
" let g:Tex_FoldedEnvironments = ",resumo,folhadeaprovacao"
" "let g:Tex_FoldedSections = "part,chapter,section,%%fakesection,subsection,subsubsection,frame,paragraph"
" " Removing "frame" because of this:
" " http://sourceforge.net/mailarchive/forum.php?thread_name=op.v3zpcjevdsdv5o%40localhost&forum_name=vim-latex-devel
" 
" "let g:Tex_EnvironmentMaps   = 0
" "let g:Tex_EnvironmentMenus  = 0
" "let g:Tex_FontMaps          = 0
" "let g:Tex_FontMenus         = 0
" "let g:Tex_SectionMaps       = 0
" "let g:Tex_SectionMenus      = 0
" 
" "let g:Tex_SmartKeyBS    = 0
" "let g:Tex_SmartKeyQuote = 0
" 
" let g:Tex_DefaultTargetFormat = "pdf"
" let g:Tex_ViewRule_ps = "evince"
" let g:Tex_ViewRule_pdf = "evince"
" 
" " https://bbs.archlinux.org/viewtopic.php?pid=713256
" " http://thisblog.runsfreesoftware.com/files/vimrc
" ""To solve the problem with vim-latexsuite has with ã and â
" "imap <buffer> <silent> <M-C> <Plug>Tex_MathCal
" "imap <buffer> <silent> <M-B> <Plug>Tex_MathBF
" "imap <buffer> <leader>it <Plug>Tex_InsertItemOnThisLine
" "imap <buffer> <silent> <M-A>  <Plug>Tex_InsertItem
" ""imap <buffer> <silent> <M-E>  <Plug>Tex_InsertItem
" ""imap <buffer> <silent> <M-e>  <Plug>Tex_InsertItemOnThisLine
" "imap <buffer> <silent> \c <Plug>Traditional
" "map <buffer> <silent> é é
" "map <buffer> <silent> á á
" "map <buffer> <silent> ã ã
" ""imap ã <Plug>Tex_MathCal
" ""imap é <Plug>Traditional

"}}}

"Configuring open-pdf"{{{

let g:pdf_convert_on_edit = 1
let g:pdf_convert_on_read = 1

"}}}

"Configuring vmath plugin (vim-vmath/vmath.vim)"{{{

vmap <expr>  ++  VMATH_YankAndAnalyse()
"nmap         ++  vip++

"}}}

"Configuring emmet-vim"{{{

let g:user_emmet_mode='i'

" Default is <C-Y>
"let g:user_emmet_leader_key='<C-Z>'
"let g:user_emmet_leader_key='<C-L>'

"}}}

"Configuring vim-easymotion"{{{

map s <Plug>(easymotion-prefix)

map sa <Plug>(easymotion-jumptoanywhere)
map sl <Plug>(easymotion-bd-jk)
map sn <Plug>(easymotion-bd-n)
map sN <Plug>(easymotion-bd-n)
map s. <Plug>(easymotion-repeat)
map s, <Plug>(easymotion-next)
map s; <Plug>(easymotion-prev)

" keep cursor colum JK motion
let g:EasyMotion_startofline = 0

let g:EasyMotion_smartcase = 1
"let g:EasyMotion_use_smartsign_us = 1

" See also easyoperator_line.txt, which adds the following line-wise motion:
" {operator}<Plug>(easymotion-prefix)l
"
" Which means the following commands are now available:
" vsl csl ysl dsl <sl >sl =sl gqsl

"}}}

"Configuring viewdoc"{{{

let g:viewdoc_pydoc_cmd ="pydoc3"

"}}}

"Configuring unicode.vim"{{{

" I need to map this to something else in order to disable the built-in
" mapping. Thus, I'm mapping to this key that I don't have on any keyboard.
nmap <F19> <Plug>(MakeDigraph)
vmap <F19> <Plug>(MakeDigraph)

"}}}

"Configuring vim-markdown-folding"{{{

"let g:markdown_fold_style = 'nested'
let g:markdown_fold_style = 'stacked'

"}}}

"Configuring vim-emoji"{{{

" It only auto-completes the :smile: texts.
" I wanted a plugin to quickly completing and replacing those with Unicode chars.
" vim-emoji way of replacing those is:
" %s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g

"set completefunc=emoji#complete

"}}}

"Disabling vim-better-whitespace highlighting for now"{{{

let g:better_whitespace_enabled = 0

"}}}

"Loading Pathogen (that auto-loads plugins from ~/.vim/bundle)"{{{
"Remember to run :Helptags after installing new plugins

" Disabled. I'm now using vim-plug

" runtime bundle/vim-pathogen/autoload/pathogen.vim
" 
" " So Pathogen is not working correctly under Gentoo or Ubuntu
" " https://github.com/tpope/vim-pathogen/issues/38
" "call pathogen#infect()
" 
" " This is a workaround:
" " https://github.com/tpope/vim-pathogen/issues/40#issuecomment-1942995
" "call pathogen#runtime_append_all_bundles()
" "call pathogen#incubate()
" call pathogen#interpose('bundle/{}')
" 
" call pathogen#helptags()
" 
" " Directly from the plugin source:
" " For management of individually installed plugins in ~/.vim/bundle (or
" " ~\vimfiles\bundle), adding `call pathogen#infect()` to your .vimrc
" " prior to `filetype plugin indent on` is the only other setup necessary.
" filetype indent on
" filetype plugin on
" syn on

"}}}

"Fuzzy Finder (FZF)"{{{

"let g:fzf_launcher = 'xterm -e bash -ic %s'

"}}}

"luochen1990/rainbow "{{{
" Use :RainbowToggle
let g:rainbow_active = 0
" Configuration example: https://github.com/luochen1990/rainbow
" It might be worth changing the colors.
"}}}

"vim-plug "{{{

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin()

" Goodbye, Pathogen!
"Plug 'tpope/vim-pathogen'

Plug 'nixon/vim-vmath'
Plug 'tpope/vim-repeat'

Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
"Plug 'tpope/vim-unimpaired'

Plug 'Shougo/vimproc.vim'
Plug 'Shougo/unite.vim'

Plug 'tpope/vim-characterize'
Plug 'chrisbra/unicode.vim'
Plug 'junegunn/vim-emoji'
Plug 'mattn/emoji-vim'
Plug 'rhysd/unite-emoji.vim'
" Note: I have my own fork of vim-emoji-complete.
Plug 'kyuhi/vim-emoji-complete'

" Might be worth: https://github.com/Shougo/denite.nvim
"Plug 'tsukkee/unite-help'  " Older
Plug 'Shougo/unite-help'
"Plug 'h1mesuke/unite-outline'  " Older, unmaintained
Plug 'Shougo/unite-outline'
Plug 'ujihisa/unite-font'
Plug 'ujihisa/unite-locate'
Plug 'tacroe/unite-mark'
Plug 'thinca/vim-unite-history'
Plug 'm2mdas/unite-file-vcs'
" Buggy:
"Plug 'sanford1/unite-unicode'

Plug 'ujihisa/unite-colorscheme'
" Why? I don't need so many colorschemes…
Plug 'flazz/vim-colorschemes'

Plug 'ctrlpvim/ctrlp.vim'

"Plug 'junegunn/fzf', {'dir': '~/stuff/fzf'}
"Plug 'junegunn/fzf.vim'

Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'Lokaltog/vim-easymotion'
Plug 'haya14busa/vim-easyoperator-line'
Plug 'ciaranm/securemodelines'
Plug 'danro/rename.vim'
Plug 'godlygeek/tabular'
Plug 'hotchpotch/perldoc-vim'
Plug 'hynek/vim-python-pep8-indent'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'nathanaelkane/vim-indent-guides'
"Plug 'msprev/vim-markdown-folding'
"Plug 'nelstrom/vim-markdown-folding'
Plug 'ntpeters/vim-better-whitespace'
"Plug 'powerman/vim-plugin-viewdoc'
Plug 'powerman/AnsiEsc.vim'
Plug 'rhysd/open-pdf.vim'
Plug 'tmhedberg/simpylfold'
Plug 'vim-scripts/Align'
Plug 'vim-scripts/CRefVim'
Plug 'vim-scripts/DirDiff.vim'
Plug 'vim-scripts/DrawIt'
Plug 'vim-scripts/HJKL'
Plug 'vim-scripts/LaTeX-Help'
Plug 'vim-scripts/LargeFile'
Plug 'vim-scripts/TaskList.vim'
Plug 'vim-scripts/ZoomWin'
Plug 'vim-scripts/icalendar.vim'
Plug 'vim-scripts/loremipsum'
Plug 'vim-scripts/pep8'

" Coloring matching parentheses:
Plug 'luochen1990/rainbow'
"Plug 'chrismetcalf/vim-rainbow'

" Undo viewers:
Plug 'sjl/gundo.vim'
"Plug 'mbbill/undotree'
"Plug 'simnalamburt/vim-mundo'

" Useful, however very slow.
" https://github.com/reinderien/mimic/wiki/Related-Software
" https://github.com/vim-utils/vim-troll-stopper/issues/7
"Plug 'vim-utils/vim-troll-stopper'

" Signs besides modified lines. First one works only for git, the second one
" works for several VCS.
Plug 'airblade/vim-gitgutter'
"Plug 'mhinz/vim-signify'

Plug 'tpope/vim-fugitive'

"Plug 'scrooloose/syntastic'

Plug 'scrooloose/nerdtree'
"Plug 'scrooloose/nerdtree', {'on': ['NERDTree', 'NERDTreeToggle'] }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Concealing characters… Why?
"Plug 'calebsmith/vim-lambdify'
"Plug 'Twinside/vim-haskellConceal'
"Plug 'ehamberg/vim-cute-python'
"Plug 'ehamberg/vim-cute-python' { 'branch': 'moresymbols' }
"Plug 'tyok/js-mask'
"Plug 'elzr/vim-json'

" Haven't used these yet:
"Plug 'lervag/vimtex'
"Plug 'alexandream/vim-todo'
"Plug 'tpope/vim-unimpaired'

" Haven't used either:
"https://github.com/powerline/powerline
"Plug 'Lokaltog/vim-powerline'
"Plug 'vim-airline/vim-airline'

" Old, disabled bundles:
"Plug 'rayburgemeestre/phpfolding.vim'
"Plug 'vim-scripts/pythonhelper'
"Plug 'vim-scripts/ShowMarks'
"Plug 'vim-scripts/sokoban.vim'
"Plug 'vim-scripts/TeTrIs.vim'
"Plug 'haya14busa/vim-easyoperator-phrase'
"Plug 'tpope/vim-surround'
"Plug 'vim-scripts/pdftotext'
"Plug 'vim-scripts/AnsiEsc.vim'
"Plug 'koron/minimap-vim'
"Plug 'severin-lemaignan/vim-minimap'

"One of these, not sure if they work:
"Plug 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
"Plug 'vim-latex/vim-latex'

" FuzzyFinder
" Not needed, if we use Unite.
" https://bitbucket.org/ns9tks/vim-fuzzyfinder/
" http://www.vim.org/scripts/script.php?script_id=1984
"Plug 'vim-scripts/FuzzyFinder'
"
" Requires l9 library
" https://bitbucket.org/ns9tks/vim-l9/
" http://www.vim.org/scripts/script.php?script_id=3252
"Plug 'vim-scripts/L9'

call plug#end()

"}}}

"Configuring unite.vim "{{{

" I'm not sure if I should enable these:
"call unite#custom#profile('files', 'filters', 'sorter_rank')
"call unite#custom#source('file,file/new,buffer,file_rec', 'matchers', 'matcher_fuzzy')

nnoremap U  :<C-u>Unite -start-insert<CR>
nnoremap UU :<C-u>Unite -start-insert<CR>
nnoremap Uf :<C-u>Unite -start-insert -buffer-name=files buffer file_rec/async<CR>
nnoremap UF :<C-u>Unite -start-insert -buffer-name=files buffer file_rec/async<CR>

" Directly copied from :help unite-source-grep
	if executable('hw')
	  " Use hw (highway)
	  " https://github.com/tkengo/highway
	  let g:unite_source_grep_command = 'hw'
	  let g:unite_source_grep_default_opts = '--no-group --no-color'
	  let g:unite_source_grep_recursive_opt = ''
	elseif executable('ag')
	  " Use ag (the silver searcher)
	  " https://github.com/ggreer/the_silver_searcher
	  let g:unite_source_grep_command = 'ag'
	  let g:unite_source_grep_default_opts =
	  \ '-i --vimgrep --hidden --ignore ' .
	  \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
	  let g:unite_source_grep_recursive_opt = ''
	elseif executable('pt')
	  " Use pt (the platinum searcher)
	  " https://github.com/monochromegane/the_platinum_searcher
	  let g:unite_source_grep_command = 'pt'
	  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
	  let g:unite_source_grep_recursive_opt = ''
	elseif executable('ack-grep')
	  " Use ack
	  " http://beyondgrep.com/
	  let g:unite_source_grep_command = 'ack-grep'
	  let g:unite_source_grep_default_opts =
	  \ '-i --no-heading --no-color -k -H'
	  let g:unite_source_grep_recursive_opt = ''
	elseif executable('jvgrep')
	  " Use jvgrep
	  " https://github.com/mattn/jvgrep
	  let g:unite_source_grep_command = 'jvgrep'
	  let g:unite_source_grep_default_opts =
	  \ '-i --exclude ''\.(git|svn|hg|bzr)'''
	  let g:unite_source_grep_recursive_opt = '-R'
	endif


let g:unite_locate_command = 'locate -l {count} -r {query}'

"}}}

"FileType autocommands"{{{
" They must be AFTER pathogen and AFTER "filetype indent on" and "filetype plugin on"
"Set textwidth for mail
au FileType mail setlocal tw=70 nosi nocin

"Disable C Indent for Pascal files
au FileType pascal,*.pas,*.dpr setlocal si nocin
"Disable most indent for HTML files
au FileType html,*.html,*.htm,*.shtml,*.shtm,*.xhtml setlocal ai nocin nosi indentkeys=
"Disable most indent for XML files
au FileType xml,*.xml,*.xhtml,dtd,*.dtd setlocal ai nocin nosi indentkeys=
"Disable some indents for CSS
au FileType css,*.css setlocal ai si nocin
"Disable C Indent for LaTeX files
au FileType tex,plaintex,*.tex setlocal nocin
"For Python files
au FileType python,*.py setlocal sw=4 et
"For Markdown files
au FileType markdown,*.md setlocal et
" For commit messages
au FileType gitcommit,hgcommit setlocal spell spelllang=en

"Comments for PHP files
" See also :help php-indent
" These vars are modified by ftplugin/html.vim and indent/php.vim
let g:PHP_autoformatcomment = 0
au FileType php,*.php setlocal comments=sl:/**,mb:\ *,elx:\ */,b:#,b:// fo-=w

"Set default commentstring on C++ files
au FileType cpp,*.cpp setlocal commentstring="//%s"

"Set dictionary file for C files
au FileType c,*.c     setlocal complete+=k~/.vim/c.dic
au FileType cpp,*.cpp setlocal complete+=k~/.vim/c.dic
au FileType *   exec('setlocal dictionary+=~/.vim/dict/' . &filetype)

"An autocmd to make vim not break when used for crontab -e
"See :help 'backupcopy' and scroll down a bit
autocmd FileType crontab set backupcopy=yes

"Temporary files from http://www.nongnu.org/renameutils/
au BufRead /tmp/qmv* setlocal ts=8 nosol

" aceitaFacil
" See also :help autocmd-patterns
au BufNewFile,BufRead ~/aceitafacil/*.php setlocal et sw=2

"Group for detecting filetype
augroup filetypedetect
	" Wiki type (wikipedia)
	au BufNewFile,BufRead *.wiki     setf wikipedia

	"au BufNewFile,BufRead *.xhtml    setf html
	au BufNewFile,BufRead *.xhtml    setf xml

	"au BufRead /tmp/OperaCache/opr*  setf html
	"au BufRead ~/.opera/cache4/opr*  setf html

	" SecondLife scripts
	au BufNewFile,BufRead *.lsl      setf lsl

	" Old DOS QBasic files
	au BufNewFile,BufRead *.BAS      setf basic

	" vCalendar, iCalendar
	au BufNewFile,BufRead *.ics,*.vcs  setf icalendar
augroup END

" See also filetype.vim and ~/.vim/scripts.vim,
" both described in :help usr_43.txt

"}}}

":help hex-editing"{{{
"if 0
function AutocmdsForBinary()
augroup Binary
	au!
	au BufReadPre   *.bin let &bin=1
	au BufReadPost  *.bin if &bin | %!xxd
	au BufReadPost  *.bin set ft=xxd | endif
	au BufWritePre  *.bin if &bin | %!xxd -r
	au BufWritePre  *.bin endif
	au BufWritePost *.bin if &bin | %!xxd
	au BufWritePost *.bin set nomod | endif
augroup END
endfunction
"endif
"}}}


"                       Start of Vim Scripting!
"                     Don't cross the line below!
"--------------------------------------------------------------------


" --- VimTips ---
" {{{
" http://vim.sourceforge.net/tip_view.php?tip_id=

"Use the | character to combine more than one command into only one line, like this:
":if has("gui") | echo "oi" | endif

" VimTip #37: The basic operation about vim-boolean optionals
" {{{
" :set number     -> switch the number on
" :set nonumber   -> switch it off
" :set invnumber  -> switch it inverse against the current setting
" :set number!    -> switch it inverse against the current setting
" :set number&    -> get the default value vim assums
" }}}

" VimTip #38: Cursor one line at a time when :set wrap
" {{{
" If your tierd of the cursor jumping past 5 lines when :set wrap then add these mappings to you vimrc file.
" 
" nnoremap j gj
" nnoremap k gk
" vnoremap j gj
" vnoremap k gk
" nnoremap <Down> gj
" nnoremap <Up> gk
" vnoremap <Down> gj
" vnoremap <Up> gk
" inoremap <Down> <C-o>gj
" inoremap <Up> <C-o>gk
" 
" What they do is remap the cursor keys to use there `g' equvilant. See :help gj
" }}}

" VimTip #40: Insert a file
" {{{
" To insert the contents of a file (or the output of a system command) 
" into the current buffer, use the r[ead] command:
" 
" Examples:
" 
" :r foo.txt        inserts the file foo.txt below the cursor
" 
" :0r foo.txt       inserts the file foo.txt above the first line
" 
" :r !ls            inserts a listing of your directory below the cursor
" 
" :$r !pwd          inserts the current working directory below the last line 
" 
" 
" For more information about the r[ead] command refer to:
" 
" :help read
" 
" See also:
" 
" :help cmdline-ranges
" :help !cmd
" }}}

" VimTip #82: letting variable values be overwritten in a script
"{{{
"this is a simple function i wrote to get the value of a variable from three different places (in that order):  the current buffer, the global setting or from the script itself.
"
"this allows me to set a default value for a configuration variable inside my script and the user to change it on a global level by setting the same variable with a g: prepended.  then, they can further set it on a per-buffer level by the the b: mechanism.  one of the examples for this might be my comments script (not uploaded).  i have a variable in there that determines whether comment characters (// for java, for example) are placed the beginning of the line or just before the first-non-blanks in the text.  i set up a default in my script:
"
"let s:comments_hug_start_of_line=0   " comments should hug the text
"
"that's fine as a default, but if i want to overwrite it for vim scripts, i just put the following in my ftplugin/vim.vim:
"
"let b:comments_hug_start_of_line=1   " vim comments should hug the first column, always
"
"" tries  to return  the buffer-specific  value of  a variable;  if not
"" found,  tries to  return the  global value  -- if  that's not  found
"" either, returns the value set in the script itself
"function! GetVar(varName)
"  if (exists ("b:" . a:varName))
"    exe "let retVal=b:" . a:varName
"  elseif (exists ("g:" . a:varName))
"    exe "let retVal=g:" . a:varName
"  elseif (exists ("s:" . a:varName))
"    exe "let retVal=s:" . a:varName
"  else
"    retVal=-1
"  endif
"  return retVal
"endfunction
"
"personally, i never let it get to the -1 state by always having an s: set with SOME default value.
"}}}

" }}} end vim tips


"***********************************************************"
" Ctrl+S to Save (only for GUI version)                     "
"***********************************************************"
"{{{
function Salvar_setKeys()
	"Use Ctrl+S to save
	nnoremap <silent> <C-S>      :update<CR>
	vnoremap <silent> <C-S> <C-C>:update<CR>
	inoremap <silent> <C-S> <C-O>:update<CR>
	"Ctrl+Alt+S to save all does not work
	nnoremap <silent> <C-M-S>      :wall<CR>
	vnoremap <silent> <C-M-S> <C-C>:wall<CR>
	inoremap <silent> <C-M-S> <C-O>:wall<CR>
endfunc

au GUIEnter * call Salvar_setKeys()
"}}}


"***********************************************************"
" Compiling kit - detect file type and compile it with F9   "
"***********************************************************"
"{{{
"Currently disabled for testing of a better version
"TODO: make this works for LaTeX files. How? Exactly the
"      same way as described in function CompilarLaTeX
" {{{
if 0

function CompilarLaTeX()
	update
	let caminho = getcwd()
	cd %:p:h
	!latex %:t
	exe 'cd "' caminho '"'
	unlet caminho
endfunc

function CompilarC()
	update
	let caminho = getcwd()
	cd %:p:h
	!gcc -o %:t:r %:t -Wall
	exe 'cd "' caminho '"'
	unlet caminho
endfunc

function CompilarCpp()
	update
	let caminho = getcwd()
	cd %:p:h
	!gpp -o %:t:r %:t -Wall
	exe 'cd "' caminho '"'
	unlet caminho
endfunc

function Executar()
	let caminho = getcwd()
	cd %:p:h
	!./%:t:r
	exe 'cd ' caminho
	unlet caminho
endfunc

" ==# significa Match Case
" ==? significa Ignore Case
" ==  depende do valor de 'ignorecase'

function CompilarEsteArquivo()
	let extensao = expand('%:e')

	if     extensao ==# 'tex'
		echo 'Compilando LaTeX'
		call CompilarLaTeX()

	elseif extensao ==# 'c'
		echo 'Compilando programa C'
		call CompilarC()

	elseif extensao ==# 'cpp'
		echo 'Compilando programa C++'
		call CompilarCpp()

	else
		echo 'Unrecognized extension'
	endif
endfunc

endif
" }}}

function CompilarEsteArquivo()
	if &makeprg."a" !=# "a"
		make
	else
		echoerr "Make program is not defined. Use ':set makeprg' to define one."
	endif
endfunc

function SetMakeprgIfExistsMakefile()
	if filereadable(expand("%:p:h")."/makefile") || filereadable(expand("%:p:h")."/Makefile")
		setl makeprg=make
	endif
endfunc

au FileType c,*.c     setl makeprg=~/bin/ccomp\ %:p:r
au FileType cpp,*.cpp setl makeprg=~/bin/cppcomp\ %:p:r
au FileType c,*.c,cpp,*.cpp call SetMakeprgIfExistsMakefile()

"F9 compiles the current file
nnoremap <silent> <F9>      :call CompilarEsteArquivo()<CR>
vnoremap <silent> <F9> <C-C>:call CompilarEsteArquivo()<CR>
inoremap <silent> <F9> <C-O>:call CompilarEsteArquivo()<CR>
"}}}


"***********************************************************"
" 'list' toggle with z<TAB>                                 "
"***********************************************************"
"{{{
function ToggleList()
	set list!
	echo &list ? 'list' : 'nolist'
endfunc

nnoremap <silent> z<TAB>      :call ToggleList()<CR>
"}}}


"***********************************************************"
" Wrap toggle with F12 key                                  "
"***********************************************************"
"{{{
function ToggleWrap()
	set wrap!
	echo &wrap ? 'wrap' : 'nowrap'
endfunc

"F12 toggles wrap (Thanks to Alexandre Moreira)
nnoremap <silent> <F12>      :call ToggleWrap()<CR>
vnoremap <silent> <F12> <C-C>:call ToggleWrap()<CR>
inoremap <silent> <F12> <C-O>:call ToggleWrap()<CR>
"}}}


"***********************************************************"
" Horizontal scrollbar toggle with Shift+F12 key            "
"***********************************************************"
"{{{
function ToggleHorizontalScrollbar()
	"set guioptions+=b
	if &go =~# "b"
		set go-=b
	else
		set go+=b
	endif
endfunc

function ToggleHorizontalScrollbar_setKeys()
	"Shift+F12 toggles the horizontal scrollbar
	nnoremap <silent> <S-F12>      :call ToggleHorizontalScrollbar()<CR>
	vnoremap <silent> <S-F12> <C-C>:call ToggleHorizontalScrollbar()<CR>
	inoremap <silent> <S-F12> <C-O>:call ToggleHorizontalScrollbar()<CR>
endfunc

au GUIEnter * call ToggleHorizontalScrollbar_setKeys()
"}}}


"***********************************************************"
" Make current window half of available size with ^We or ^WE"
"***********************************************************"
"{{{
function MakeWindowHalfWidth()
	exec 'vertical resize' . &columns/2
endfunc
function MakeWindowHalfHeight()
	exec 'resize' . &lines/2
endfunc

"Think E graphically, like two windows split one on top of another.
"You may think also 'e' and 'E' as 'equal size'

nnoremap <silent> <C-W>e :call MakeWindowHalfWidth()<CR>
nnoremap <silent> <C-W>E :call MakeWindowHalfHeight()<CR>
"}}}


"***********************************************************"
" VimTip #2: easy edit of files in the same directory       "
"***********************************************************"
"{{{
" if has("unix")
"     map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
" else
"     map ,e :e <C-R>=expand("%:p:h") . "\" <CR>
" endif
"}}}

"***********************************************************"
" Transpose the current buffer
"***********************************************************"
"{{{
" http://stackoverflow.com/questions/704130/can-i-transpose-a-file-in-vim/704797#704797
function! s:transposebuffer()
    let maxcol = 0
    let lines = getline(1, line('$'))

    for line in lines
        let len = len(line)
        if len > maxcol 
            let maxcol = len
        endif
    endfor

    let newlines = []
    for col in range(0, maxcol - 1)
        let newline = ''
        for line in lines
            let line_with_extra_spaces = printf('%-'.maxcol.'s', line)
            let newline .= line_with_extra_spaces[col]
        endfor
        call add(newlines, newline)
    endfor

    1,$"_d
    call setline(1, newlines)
endfunction

command! TransposeBuffer call s:transposebuffer()
"}}}


"***********************************************************"
" Abbreviations, by filetype                                "
"***********************************************************"
"{{{
" FOREVER IN BETA TESTING!!!
"TODO: Make a script to map Ctrl+Space and to work like RHIDE:
"      Ctrl+Space will look for last word (or last two chars)
"      and expand it.

function AbbrForCandCpp()
	ab #d  #define
	ab /***  /************************************************************/
	ab print_   printf("\n");
	ab fori for(i=0; i<; i++)<CR>{<CR>}<up>
	ab forj for(j=0; j<; j++)<CR>{<CR>}<up>
	"ab fork for(k=0; k<; k++)<CR>{<CR>}<up>
	ab struct_ typedef struct Name {<CR>} Name;<up>
	ab re_  return 
	ab main( int main(int argc, char *argv[])<CR>{<CR>return 0;<CR>}<up><up>
endfunc

function AbbrForC()
	call AbbrForCandCpp()
	ab #i #include <.h><left><left><left>
	"ab {{{ /* {{{ */
	"ab }}} /* }}} */
endfunc

function AbbrForCpp()
	call AbbrForCandCpp()
	ab #i #include <><left>
	"ab {{{ // {{{
	"ab }}} // }}}
endfunc

function AbbrForJava()
	ab fori for(int i=0; i<.length; i++)<CR>{<CR>}<up>
	ab forj for(int j=0; j<.length; j++)<CR>{<CR>}<up>
	ab fork for(int k=0; k<.length; k++)<CR>{<CR>}<up>
	ab /***  /************************************************************/
	ab #i import
	"ab {{{ // {{{
	"ab }}} // }}}
endfunc

"These don't work because of '/'
function AbbrForLaTeX()
	ab /sec  \section{}
	ab /sub  \subsection{}
	ab /cha  \chapter{}
	ab /eqnarray \begin{eqnarray}<CR><CR>\end{eqnarray}
	ab /array    \begin{array}<CR><CR>\end{array}
	ab /enum     \begin{enumerate}<CR><CR>\end{enumerate}
	ab /itemize  \begin{itemize}<CR><CR>\end{itemize}
endfunc 

"au FileType tex,*.tex call AbbrForLaTeX()
au FileType c,*.c       call AbbrForC()
au FileType cpp,*.cpp   call AbbrForCpp()
au FileType java,*.java call AbbrForJava()
"}}}


"***********************************************************"
" Execute macro over visual range                           "
"***********************************************************"
"{{{
" https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db#4af3
" https://github.com/stoeffel/.dotfiles/blob/master/vim/visual-at.vim
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
"}}}
