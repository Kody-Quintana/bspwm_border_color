"bspwm color border:

"Don't do anything if display is not defined
if $DISPLAY == ""
	finish
endif

"Only run if bspwm is running
if trim(system('pgrep -x bspwm')) == ""
	finish
endif

"get current bspwm active color setting, remove leading # and any trailing newline
let s:current_active_color = substitute(trim(system("bspc config focused_border_color")), "#", "", "")

"Ensure WINDOWID is defined
if $WINDOWID == ""
	echoerr "\$WINDOWID env variable is not defined"
	finish
endif

"Convert WINDOWID env variable from dec to hex (chwb requires hex and $WINDOWID is in dec)
let s:this_window_id = " " . system("printf \"0x%x\" $WINDOWID")

"Check that chwb is available
if trim(system('command -v chwb')) == ""
	echoerr "chwb missing, please install wmutils"
	finish
endif

"Check for user defined colors, if not defined default to these:
let s:insert_color = get(g:, 'bspwm_border_insert_color', "e21855")
let s:normal_color = get(g:, 'bspwm_border_normal_color', "2cba1f")

function s:ModeToColor(current_mode)
	if trim(a:current_mode) == "i"
		return s:insert_color
	else
		return s:normal_color
	endif
endfunction

autocmd InsertEnter * :silent execute "!chwb -c " . s:insert_color . s:this_window_id
autocmd InsertLeave * :silent execute "!chwb -c " . s:normal_color . s:this_window_id
autocmd FocusGained * :silent execute "!chwb -c " . s:ModeToColor(shellescape(mode())) . s:this_window_id
autocmd VimEnter * :silent execute "!chwb -c " . s:ModeToColor(shellescape(mode())) . s:this_window_id
autocmd VimLeave * :silent execute "!chwb -c " . s:current_active_color . s:this_window_id
