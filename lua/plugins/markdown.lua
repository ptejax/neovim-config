-- Rendered markdown in the buffer.
-- No lazy key/trigger, so it loads at startup (lazy.nvim's default).
-- It could be lazy-loaded with `ft = { 'markdown' }`
--  -> Indicating to Lazy.nvim that it should be loaded on the `ft=markdown` trigger event
return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    -- Icons come from nvim-web-devicons (installed for nvim-tree).
    -- 'nvim-mini/mini.nvim',            -- if you use the mini.nvim suite
    -- 'nvim-mini/mini.icons',           -- if you use standalone mini plugins
    'nvim-tree/nvim-web-devicons',       -- if you prefer nvim-web-devicons
  },
  config = function()
    require('render-markdown').setup({})
  end,
}
