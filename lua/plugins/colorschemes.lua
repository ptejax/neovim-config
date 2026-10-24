-- Colorschemes. All installed, none active: Neovim's default colorscheme is
-- in use. They are loaded at startup (just added to the runtimepath, nothing
-- is applied) so `:colorscheme <Tab>` keeps listing them; with `lazy = true`
-- lazy.nvim would still load them on `:colorscheme <name>`, but they would no
-- longer show up in the completion.
--
-- To make one the default, give its spec `priority = 1000` and call
-- `vim.cmd.colorscheme(...)` in its `config`.
--
-- Color scheme experiments (previously in init.lua):
-- vim.cmd("colorscheme kanagawa-dragon")
-- vim.opt.background = "dark"
-- require('solarized').setup({
--   transparent = {
--     enabled = false,
--   },
-- })
-- vim.cmd.colorscheme "oxocarbon"
-- vim.cmd.colorscheme = 'solarized'
-- vim.cmd.colorscheme "nord"

-- vim.o.background = 'dark'
-- vim.o.background = 'light'

-- vim.cmd.colorscheme "catppuccin-frappe"

-- vim.o.background = "dark" -- or "light" for light mode
-- vim.cmd([[colorscheme gruvbox]])

-- local function arch_hl()
--   local set = vim.api.nvim_set_hl
--   set(0, "@code.body", { fg = "#4a4a4a" })
--   set(0, "@comment", { fg = "#d7c37a", italic = true })
--   set(0, "@type", { fg = "#8ec5d6", bold = true })
--   set(0, "@variable.member", { fg = "#e0e0e0" })
--   set(0, "@function.method", { fg = "#ffffff", bold = true })
-- end
-- arch_hl()
-- vim.api.nvim_create_autocmd("ColorScheme", { callback = arch_hl })
return {
  {
    'rebelot/kanagawa.nvim',
    -- Loads before other startup plugins due to high priority
    -- config run after loading the plugin so that colorscheme is set
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('kanagawa-wave')
    end,
  },
  { 'nyoom-engineering/oxocarbon.nvim' },
  { 'maxmx03/solarized.nvim' },
  { 'ellisonleao/gruvbox.nvim' },
  { 'shaunsingh/nord.nvim' },
  { "catppuccin/nvim", name = "catppuccin" },
}
