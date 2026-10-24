-- Fixed-width terminal on the right.
-- `\t` (normal mode) shows/hides a full-height terminal split on the far
-- right, TERM_WIDTH columns wide. Hiding only closes the window: the one
-- shared terminal buffer (`term_buf`) keeps its shell running, so every
-- toggle, in any tab page, returns to the same session. On resize, the
-- terminal is kept at TERM_WIDTH and the other windows are made equal.

local TERM_WIDTH = 150
local term_buf = nil

local function find_term_win()
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    if vim.w[win].fixed_term then return win end
  end
end

local function enforce_term_width()
  local win = find_term_win()
  if win and vim.api.nvim_win_get_width(win) ~= TERM_WIDTH then
    vim.api.nvim_win_set_width(win, TERM_WIDTH)
  end
end

local function toggle_term()
  local win = find_term_win()
  if win then
    -- hide the window but keep the terminal (and its running shell) alive
    if #vim.api.nvim_tabpage_list_wins(0) > 1 then
      vim.api.nvim_win_hide(win)
    end
    return
  end

  vim.cmd("botright vsplit")          -- full-height split on the far right
  win = vim.api.nvim_get_current_win()
  vim.w[win].fixed_term = true

  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    vim.api.nvim_win_set_buf(win, term_buf)
  else
    vim.cmd("terminal")
    term_buf = vim.api.nvim_get_current_buf()
    vim.bo[term_buf].buflisted = false
  end

  vim.wo[win].winfixwidth = true      -- don't let equalizing touch it
  vim.wo[win].number = false
  vim.wo[win].relativenumber = false
  vim.api.nvim_win_set_width(win, TERM_WIDTH)
  vim.cmd("wincmd =")                 -- re-share width among the left splits
  vim.cmd("startinsert")
end

vim.o.equalalways = true              -- default, but make it explicit

vim.api.nvim_create_autocmd({ "VimResized", "WinResized" }, {
  callback = function()
    enforce_term_width()
    if vim.v.event and vim.fn.has("nvim-0.9") == 1 then
      vim.cmd("wincmd =")
    end
  end,
})

vim.keymap.set("n", "<leader>t", toggle_term, { desc = "Toggle right terminal" })
