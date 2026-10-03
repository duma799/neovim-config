vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 50
vim.opt.colorcolumn = ""
vim.opt.signcolumn = "yes:1"
vim.opt.numberwidth = 1
vim.opt.statuscolumn = "%=%l %s"
vim.opt.clipboard = "unnamedplus"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.cursorline = true

vim.opt.guifont = "JetBrainsMono Nerd Font:h16:sb"

if vim.g.neovide then

  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_cursor_trail_size = 0
  vim.g.neovide_cursor_animate_in_insert_mode = false
  vim.g.neovide_cursor_animate_command_line = false

  vim.g.neovide_cursor_vfx_mode = ""

  vim.g.neovide_cursor_smooth_blink = true
  vim.g.neovide_position_animation_length = 0

  vim.g.neovide_scroll_animation_length = 0.08

  -- ignore sideways trackpad drift while scrolling vertically
  for _, key in ipairs({ "<ScrollWheelLeft>", "<ScrollWheelRight>", "<S-ScrollWheelUp>", "<S-ScrollWheelDown>" }) do
    vim.keymap.set({ "n", "v", "i" }, key, "<Nop>")
  end

  -- Option acts as Alt so <A-...> mappings work
  vim.g.neovide_input_macos_option_key_is_meta = "only_left"

  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_remember_window_size = true
  vim.opt.linespace = 2

  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5

  vim.g.neovide_opacity = 0.95
  vim.g.neovide_window_blurred = true

  vim.g.neovide_refresh_rate = 60

  vim.g.neovide_padding_top = 10
  vim.g.neovide_padding_bottom = 10
  vim.g.neovide_padding_right = 12
  vim.g.neovide_padding_left = 12

  -- Cmd shortcuts
  vim.keymap.set({ "n", "v" }, "<D-c>", '"+y', { desc = "Copy" })
  vim.keymap.set({ "n", "v" }, "<D-v>", '"+P', { desc = "Paste" })
  vim.keymap.set("n", "<D-s>", "<cmd>write<CR>", { desc = "Save" })
  vim.keymap.set("i", "<D-s>", "<Esc><cmd>write<CR>gi", { desc = "Save" })
  vim.keymap.set({ "i", "c" }, "<D-v>", "<C-r>+", { desc = "Paste" })
  vim.keymap.set("t", "<D-v>", [[<C-\><C-n>"+Pi]], { desc = "Paste" })

  -- Cmd +/-/0 zoom
  vim.g.neovide_scale_factor = 1.0
  local function zoom(delta)
    vim.g.neovide_scale_factor = math.max(0.5, math.min(3.0, vim.g.neovide_scale_factor * delta))
  end
  vim.keymap.set({ "n", "v", "i", "c", "t" }, "<D-=>", function() zoom(1.1) end, { desc = "Zoom in" })
  vim.keymap.set({ "n", "v", "i", "c", "t" }, "<D-->", function() zoom(1 / 1.1) end, { desc = "Zoom out" })
  vim.keymap.set({ "n", "v", "i", "c", "t" }, "<D-0>", function() vim.g.neovide_scale_factor = 1.0 end, { desc = "Reset zoom" })

  -- toggle transparency
  vim.keymap.set("n", "<leader>ut", function()
    vim.g.neovide_opacity = vim.g.neovide_opacity < 1 and 1.0 or 0.95
    vim.g.neovide_window_blurred = vim.g.neovide_opacity < 1
  end, { desc = "Toggle transparency" })
end
