-- Enable mouse
-- vim.opt.mouse = ""
vim.opt.mouse = "a"

-- Always use zsh for :terminal, :!cmd and system(), instead of $SHELL
-- (which is bash outside tmux). Falls back to $SHELL where zsh isn't installed.
if vim.fn.executable("/usr/bin/zsh") == 1 then
  vim.opt.shell = "/usr/bin/zsh"
end

-- Display line numbers
vim.opt.number = true

-- Tab spacing
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Do not scan for modelines
-- What are modelines? https://www.roguelazer.com/blog/nix-tip-of-the-day-vim-modelines/
-- `vim:`, `vi:` and `ex:` are interpreted as modeline patterns in the first and last x lines
vim.opt.modeline = false

-- Fold based on Treesitter syntax tree (functions/blocks/etc.)
-- instead of indentation. Uses the native Lua foldexpr, not the
-- old vimscript nvim_treesitter#foldexpr() (deprecated).
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldenable = true   -- folding active
vim.opt.foldlevel = 100 -- but everything starts expanded

-- Set background
vim.opt.background = "dark"
