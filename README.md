# bspwm vim mode indicator
Show what mode vim is in by changing bspwm's active border color

![Preview](https://i.imgur.com/Mu0SbTf.gif)

## Installation
Add `Plugin 'Kody-Quintana/bspwm_border_color'` to `~/.vimrc`

and run `:PluginInstall` or appropriate equivalent for your plugin manager.

## Enabling FocusGained event

Regular vim in a terminal doesn't support the FocusGained event by default.
To enable it you will need a plugin.
I personally use [amerlyq/vim-focus-autocmd](https://github.com/amerlyq/vim-focus-autocmd).

## Defining custom colors

Custom colors are defined with environment variables instead of vim variables.
To define a custom color export the appropriate variable in your `.bashrc`
with the hex color you want.

Note that the `#` symbol doesn't need to be escaped here.
```bash
export BSPWM_VIM_INSERT=#ffffff
export BSPWM_VIM_NORMAL=#ffffff
```

## Other Requirements
- xtitle
