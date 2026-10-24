-- Leader must be set before lazy.nvim loads any plugin, otherwise mappings
-- made in plugin configs (e.g. <leader>e for nvim-tree) use the wrong leader.
-- `\` is Vim's default leader; it is set explicitly so nothing changes.
vim.g.mapleader = "\\"

require("config.options")
require("config.keymaps")
require("config.autocmds")

-- lazy.nvim resets 'packpath' to this anyway (performance.reset_packpath), but
-- only after it has enabled vim.loader, which by then has already indexed the
-- old packer plugins in ~/.local/share/nvim/site/pack/packer. Without this,
-- `require()` keeps loading their Lua modules from packer's copies as long as
-- that directory exists. Doing the reset first avoids that.
vim.go.packpath = vim.env.VIMRUNTIME

-- Bootstrap lazy.nvim
-- https://lazy.folke.io/installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Plugin setup: one spec per plugin/concern in lua/plugins/*.lua
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
})

-- Fixed width terminal on the right
require("fixed_terminal")
