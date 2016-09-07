" local scripts.vim gets called when
" all autocommands have failed to identify file type,
" but before global scripts.vim


"filetype already set, don't do these checks
if did_filetype()
	finish
endif

if expand("%:p") =~? '.*fluxbox.*'
	if expand("%:p:t") =~ '.*menu.*'
		setfiletype fluxboxmenu
	elseif expand("%:p:t") =~ '.*keys.*'
		setfiletype fluxkeys
	endif
endif
