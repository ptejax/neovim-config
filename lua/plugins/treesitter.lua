-- ============================================================
-- Treesitter: parsers, highlighting
-- (folding options are in lua/config/options.lua, the explicit
-- highlighter attach autocmd is in lua/config/autocmds.lua)
-- ============================================================
return {
  'nvim-treesitter/nvim-treesitter',
  -- The `main` branch is a rewrite that removed the `nvim-treesitter.configs`
  -- module used below; stay on `master`.
  branch = 'master',
  lazy = false, -- master does not support lazy-loading
  build = ':TSUpdate',
  config = function()
    -- Install/manage parsers and enable highlighting via the
    -- legacy module system (still used for ensure_installed).
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "c", "cpp", "python", "vim", "vimdoc", "query", "yaml", "bash", "json", "toml" },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    })
  end,
}
