December 2023: consider using https://github.com/Kody-Quintana/x11-border-color.nvim instead

# bspwm vim mode indicator
Vim plugin to show what mode vim is in by changing bspwm's active border color.

![Preview](https://i.imgur.com/Mu0SbTf.gif)

## Installation
Add `Plugin 'Kody-Quintana/bspwm_border_color'` to `~/.vimrc`

and run `:PluginInstall` or appropriate equivalent for your plugin manager.

## Enabling FocusGained event

Regular vim in a terminal doesn't support the FocusGained event by default.
To enable it you will need a plugin.
I personally use [amerlyq/vim-focus-autocmd](https://github.com/amerlyq/vim-focus-autocmd).

## Defining custom colors

Custom colors can be used by defining
`g:bspwm_border_insert_color` and `g:bspwm_border_normal_color` to a hex color (with no leading #)
```vimscript
let g:bspwm_border_normal_color = "00FF00"
let g:bspwm_border_insert_color = "FF0000"
```
## Requirements
- chwb (from [wmutils](https://github.com/wmutils/core)) - used to set color of window border
- A terminal that sets the `$WINDOWID` environment variable
