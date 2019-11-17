# bspwm vim mode indicator
Some bash scripts to facilitate showing what mode VIM is in by changing bspwm's active border color
![Preview](https://i.imgur.com/Mu0SbTf.gif)
## installation

 - Clone this repo inside `~/.vim`
 - Add `$HOME/.vim/bspwm_border_color/listener` to your bspwmrc
 - Add the following to your vimrc:
```
"bspwm color border:
if $DISPLAY != ""
	autocmd FocusGained * :silent execute "!$HOME/.vim/bspwm_border_color/set " . shellescape(mode())
	autocmd InsertEnter * :silent execute "!$HOME/.vim/bspwm_border_color/set i"
	autocmd InsertLeave * :silent execute "!$HOME/.vim/bspwm_border_color/set n"
	autocmd VimLeave * :silent !$HOME/.vim/bspwm_border_color/reset
	set title titlestring=VIM "So the listener script can tell its a VIM window
endif
```
The listener script runs continuously to reset the border color for other programs that aren't VIM.
