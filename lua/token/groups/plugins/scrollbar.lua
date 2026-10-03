---@param p TokenPalette
---@return table<string, vim.api.keyset.highlight>
local function scrollbar(p)
  return {
    ScrollbarHandle = { bg = p.bg5 },
    ScrollbarCursor = { fg = p.accent },
    ScrollbarError = { fg = p.red },
    ScrollbarWarn = { fg = p.yellow },
    ScrollbarInfo = { fg = p.blue },
    ScrollbarHint = { fg = p.cyan },
    ScrollbarMisc = { fg = p.purple },
    ScrollbarSearch = { fg = p.orange },
    ScrollbarGitAdd = { fg = p.gsign_add },
    ScrollbarGitChange = { fg = p.gsign_change },
    ScrollbarGitDelete = { fg = p.gsign_del },
  }
end

return scrollbar