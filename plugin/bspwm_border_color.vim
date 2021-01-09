"bspwm color border:
if $DISPLAY != ""
	let bspwm_running = system('pgrep -x bspwm')
	if v:shell_error == 0

		"Save the current bspwm active border color to a variable
		let current_active_color = system("echo \"'\\\\$(bspc config focused_border_color)'\"")

		"Find path of this vimscript
		let s:plugin_path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

		"Don't launch listener if user has set this variable to 0
		let g:bspwm_listener = get(g:, 'bspwm_listener', 1)
		if g:bspwm_listener == 1
			autocmd VimEnter * :silent execute "!" . s:plugin_path . "/../listener_launcher " . current_active_color
			autocmd VimLeave * :silent execute "!" . s:plugin_path . "/../listener_stopper & disown"
		endif

		autocmd FocusGained * :silent execute "!" . s:plugin_path . "/../set " . shellescape(mode())
		autocmd VimEnter * :silent execute "!" . s:plugin_path . "/../set " . shellescape(mode())

		autocmd InsertEnter * :silent execute "!" . s:plugin_path . "/../set i"
		autocmd InsertLeave * :silent execute "!" . s:plugin_path . "/../set n"
		autocmd VimLeave * :silent execute "!" . s:plugin_path . "/../reset " . current_active_color

		"Listener script checks xtitle to see if it's vim, the string is smallcaps unicode to try to avoid false matches
		set title titlestring+=ᴠɪᴍ
	endif
endif
