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

Custom colors are defined with environment variables instead of vim variables.
To define a custom color export the appropriate variable in your `.bashrc`
with the hex color you want.
By default red is used for insert, and green for normal.

Note that the `#` symbol doesn't need to be escaped here.
```bash
export BSPWM_VIM_INSERT=#ffffff
export BSPWM_VIM_NORMAL=#ffffff
```
## Compatibility with other bspwm custom colors

The listener script assumes that you are not using any other custom border colors for any other programs.
It resets the active border to the default for any other window that isn't vim.
If you are already managing custom colors of other programs you should disable this plugin's listener
script by adding the following to `~/.vimrc`
```Vim script
let g:bspwm_listener = 0
```
Alternatively if you already have a heavily customized setup, consider using the [Minimal branch](https://github.com/Kody-Quintana/bspwm_border_color/tree/minimal)
which only includes the minimum boilerplate to change vim's border color (and is not a plugin).

## Other Requirements
- xtitle
