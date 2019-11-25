"bspwm color border:
if $DISPLAY != ""
	let bspwm_running = system('pgrep -x bspwm')
	if v:shell_error == 0

		"Save the current bspwm active border color to a variable
		let current_active_color = system("echo \"'\\\\$(bspc config focused_border_color)'\"")

		autocmd VimEnter * :silent execute "!$HOME/.vim/bundle/bspwm_border_color/listener_launcher " . current_active_color
		autocmd FocusGained * :silent execute "!$HOME/.vim/bundle/bspwm_border_color/set " . shellescape(mode())
		autocmd InsertEnter * :silent execute "!$HOME/.vim/bundle/bspwm_border_color/set i"
		autocmd InsertLeave * :silent execute "!$HOME/.vim/bundle/bspwm_border_color/set n"
		autocmd VimLeave * :silent execute "!$HOME/.vim/bundle/bspwm_border_color/reset " . current_active_color
		autocmd VimLeave * :silent execute "!$HOME/.vim/bundle/bspwm_border_color/listener_stopper & disown"
		set title titlestring=VIM "So the listener script can tell its a VIM window
	endif
endif
