# Installation

Loading neovim lazy config from `HOME/dotifiles/nvim/lazy/` path.

Create this file

``` ~/.config/nvim/init.lua
local home_dir = os.getenv("HOME")

package.path = home_dir .. "/dotfiles/nvim/lazy/?.lua;" .. package.path

local config_dir = home_dir .. "/dotfiles/nvim/lazy/"

vim.opt.rtp:prepend(config_dir)
```
