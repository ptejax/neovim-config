-- Small editing helpers. Both are loaded at startup: Comment.nvim maps
-- gc/gb in normal, visual and operator-pending mode, and autoclose also
-- maps in command-line mode, so event-based lazy-loading could miss them.
return {
  -- Comment.nvim shortcuts (defaults). `gc` = linewise (`//` on each line),
  -- `gb` = blockwise (one `/* ... */` around the whole range).
  --   Normal mode:
  --     gcc / gbc        toggle the current line, linewise / blockwise
  --     gc{motion}       linewise over a motion, e.g. gcap (paragraph), gc3j
  --     gb{motion}       blockwise over a motion, e.g. gbap, gbi{
  --     [count]gcc       linewise over count lines, e.g. 5gcc
  --     gco / gcO        add a comment on a new line below / above, start typing
  --     gcA              add a comment at the end of the line, start typing
  --   Visual mode (select lines first with V or v):
  --     gc               comment each selected line
  --     gb               one block comment around the selection
  -- Blockwise only works in languages that have block comments (C/C++, Lua's
  -- --[[ ]], ...); Python, shell, YAML etc. only have line comments.
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },

  -- Autoclose setup
  {
    'm4xshen/autoclose.nvim',
    config = function()
      require("autoclose").setup()
    end,
  },
}
