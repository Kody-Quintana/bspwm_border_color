"bspwm color border:


"Don"t do anything if display is not defined
if $DISPLAY == ""
	finish
endif


"Don"t do anything if running from firenvim
if exists("g:started_by_firenvim")
	finish
endif


"Only run if bspwm is running
if trim(system("pgrep -x bspwm")) == ""
	finish
endif


"Ensure WINDOWID is defined
if $WINDOWID == ""
	echoerr "\$WINDOWID env variable is not defined"
	finish
endif


"Check that chwb is available
if trim(system("command -v chwb")) == ""
	echoerr "chwb missing, please install wmutils"
	finish
endif


"Get current bspwm active color setting, remove leading # and any trailing newline
let s:current_active_color = substitute(trim(system("bspc config focused_border_color")), "#", "", "")

"Convert WINDOWID env variable from dec to hex (chwb requires hex and $WINDOWID is in dec)
let s:this_window_id = system("printf \" 0x%x\" $WINDOWID")

"Check for user defined colors, if not defined default to these:
let s:insert_color = get(g:, "bspwm_border_insert_color", "e21855")
let s:normal_color = get(g:, "bspwm_border_normal_color", "2cba1f")


function s:SetNormalColor()
	:silent execute "!chwb -c " . s:normal_color . s:this_window_id
endfunction


function s:SetInsertColor()
	:silent execute "!chwb -c " . s:insert_color . s:this_window_id
endfunction


function s:RestoreColor()
	call system("bspc config borderless_monocle true")
	:silent execute "!chwb -c " . s:current_active_color . s:this_window_id
endfunction


function s:CheckModeThenSet()
	"Allow time if gaining focus from an exiting vim that is trying to unset this
	call system("sleep 0.1 && bspc config borderless_monocle false &")

	if trim(shellescape(mode())) == "i"
		call s:SetInsertColor()
	else
		call s:SetNormalColor()
	endif
endfunction


autocmd InsertEnter * call s:SetInsertColor()
autocmd InsertLeave * call s:SetNormalColor()

autocmd FocusGained * call s:CheckModeThenSet()
autocmd VimEnter * call s:CheckModeThenSet()

autocmd FocusLost * call system("bspc config borderless_monocle true")
autocmd VimLeave * call s:RestoreColor()
