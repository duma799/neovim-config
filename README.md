# neovim-config

My personal Neovim configuration, built on [lazy.nvim](https://github.com/folke/lazy.nvim).

![Neovim](https://img.shields.io/badge/Neovim-0.11%2B-green?logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/Lua-2C2D72?logo=lua&logoColor=white)

## Features

- **Lazy-loaded plugins**, one file per plugin in `lua/plugins/`
- **Dashboard** via snacks.nvim with custom ASCII art, recent files and projects
- **LSP** through the native `vim.lsp.config` API, with Mason auto-installing servers for Lua, Python, TypeScript, HTML, CSS, Tailwind, JSON, Bash and C# (Roslyn)
- **C# support**: Roslyn works for full solutions/projects *and* standalone `.cs` files; the code runner uses `dotnet run`
- **Autocompletion** with nvim-cmp, LuaSnip and friendly-snippets, plus cmdline completion
- **Fuzzy finding** with Telescope + fzf-native (files, grep, jump into a directory)
- **Navigation**: flash.nvim jumps, harpoon marks, oil.nvim for directory editing, neo-tree sidebar
- **Treesitter** highlighting, textobjects (functions, classes, arguments, loops…) and sticky context
- **Diagnostics** list with Trouble, TODO highlighting and a scrollbar showing diagnostics, search hits and git changes
- **Formatting** on save with conform.nvim and **linting** with nvim-lint (linters only run when installed)
- **Git**: gitsigns hunks, lazygit, blame and browse via snacks.nvim
- **Debugging** with nvim-dap + dap-ui (Python)
- **Claude Code** integration via claudecode.nvim
- **Themes**: custom Ultraviolet and Token colorschemes, transparent background and an optional all-bold mode
- **Terminal sync**: switching themes updates WezTerm and Ghostty
- **Neovide** tuned for macOS: Cmd shortcuts, zoom, padding, blur and snappy animations

## Requirements

- Neovim **0.11+** (uses `vim.lsp.config` / `vim.lsp.enable`)
- `git`, `make` and a C compiler (for telescope-fzf-native and treesitter parsers)
- [ripgrep](https://github.com/BurntSushi/ripgrep) and [fd](https://github.com/sharkdp/fd)
- A [Nerd Font](https://www.nerdfonts.com/) (Neovide uses JetBrainsMono Nerd Font)
- Optional: [lazygit](https://github.com/jesseduffield/lazygit), [.NET SDK](https://dotnet.microsoft.com/) for C#, [Claude Code](https://claude.com/claude-code), [Neovide](https://neovide.dev/), [WezTerm](https://wezfurlong.org/wezterm/) or [Ghostty](https://ghostty.org/)
- Optional formatters/linters: stylua, black, prettier, shfmt, rustfmt, gofmt, ruff, eslint_d, luacheck, shellcheck

## Install

```bash
# back up any existing config first
mv ~/.config/nvim ~/.config/nvim.bak

git clone https://github.com/duma799/neovim-config.git ~/.config/nvim
nvim
```

lazy.nvim bootstraps itself and installs every plugin on first launch. Mason installs the language servers in the background.

## Colorschemes

| Keymap | Action |
|---|---|
| `Space cu` | Ultraviolet (default) |
| `Space cf` | Token |
| `Space cg` | Gruvbox (hard contrast) |
| `Space ct` | Tokyo Night |
| `Space cn` | Nightfox |
| `Space cb` | Toggle transparent background |
| `Space cB` | Toggle bold text |

`unyielding-grayscale` and `pywal` are also available in `colors/` (`:colorscheme <name>`).

The selected theme is saved to `~/.config/wezterm/current_theme.txt` and restored on next launch. The background color in `~/.config/ghostty/config` is updated to match. If those files don't exist, the writes are skipped.

## Keymaps

Leader is `Space`. Press it and wait for which-key to show every group.

### General

| Keymap | Action |
|---|---|
| `<C-h/j/k/l>` | Move between windows |
| `<C-Arrows>` | Resize window |
| `<S-l>` | Next buffer |
| `<S-h>` | First non-blank character of line |
| `Space w` / `Space q` / `Space Q` | Save / quit / quit all |
| `Space sv` / `Space sh` | Split vertically / horizontally |
| `Space se` / `Space sx` | Equalize / close split |
| `<Esc>` | Clear search highlight |

### Editing

| Keymap | Action |
|---|---|
| `J` / `K` (visual) | Move selection down / up |
| `<` / `>` (visual) | Indent and keep selection |
| `Space p` (visual) | Paste without yanking replaced text |
| `Space d` | Delete to void register |
| `s` / `S` | Flash jump / Flash treesitter select |
| `af` `if` `ac` `ic` `aa` `ia` `ai` `ii` `al` `il` | Treesitter textobjects (function, class, argument, conditional, loop) |
| `]f` `[f` `]c` `[c` `]a` `[a` | Jump to next/previous function, class, argument |
| `Space an` / `Space ap` | Swap argument with next / previous |
| `Space uu` | Undotree |

### Files & search

| Keymap | Action |
|---|---|
| `<C-p>` | Find files |
| `<Alt-f>` | Live grep |
| `<Alt-d>` | Pick a directory and `cd` into it |
| `<C-n>` | Neo-tree file explorer |
| `-` | Oil (edit parent directory as a buffer) |
| `Space ha` / `Space hh` | Harpoon: add file / menu |
| `Space 1`–`Space 4` | Harpoon: jump to file 1–4 |
| `Space ft` | Find TODOs |

### LSP & diagnostics

| Keymap | Action |
|---|---|
| `K` | Hover docs |
| `gd` / `gD` | Definition / declaration |
| `gi` / `gr` | Implementation / references |
| `Space D` | Type definition |
| `Space ca` | Code action |
| `Space rn` | Rename |
| `Space e` | Show diagnostic float |
| `[d` / `]d` | Previous / next diagnostic |
| `Space xx` / `Space xX` | Trouble: all / buffer diagnostics |
| `Space xs` / `Space xl` | Trouble: symbols / LSP references |
| `Space fm` | Format buffer |
| `Space ll` | Run linters |

### Run code

| Keymap | Action |
|---|---|
| `Space rr` | Run current file (Python, JS, Lua, shell) |
| `Space rs` (visual) | Run selection |
| `Space rl` | Run current line |
| `Space rc` / `Space rf` | Run with code_runner |
| `Space rt` | Run in a new tab |
| `Space rq` | Close runner |
| `Space rp` | Python REPL |

code_runner handles Python, JS/TS, Lua, Rust, Go, Java, C, C++, shell and C# (`dotnet run` in the nearest `.csproj`, or `dotnet run --file` for a single file).

### Git

| Keymap | Action |
|---|---|
| `Space gg` | Lazygit |
| `Space gl` / `Space gf` | Lazygit log / current file history |
| `Space gb` | Blame line |
| `Space gB` | Open in browser |
| `]h` / `[h` | Next / previous hunk |
| `Space hs` / `Space hr` | Stage / reset hunk |
| `Space hS` / `Space hR` | Stage / reset buffer |
| `Space hd` | Diff this |
| `Space htb` | Toggle inline blame |

### Debug (DAP)

| Keymap | Action |
|---|---|
| `Space db` | Toggle breakpoint |
| `Space dc` | Continue |
| `Space di` / `Space do` / `Space dO` | Step into / over / out |
| `Space dr` / `Space dl` | REPL / run last |
| `Space dt` | Toggle debug UI |
| `Space dx` | Terminate |

### Claude Code

| Keymap | Action |
|---|---|
| `Space ac` | Toggle Claude (right split) |
| `Space af` | Focus Claude |
| `Space ar` / `Space aC` | Resume / continue session |
| `Space am` | Select model |
| `Space ab` | Add current buffer |
| `Space as` | Send selection (visual) / add file from tree |
| `Space aa` / `Space ad` | Accept / deny diff |

### Other

| Keymap | Action |
|---|---|
| `<C-/>` | Toggle terminal |
| `<Esc>` / `<C-q>` (terminal) | Exit terminal mode / close terminal |
| `Space z` | Zen mode |
| `Space s` / `Space S` | Scratch buffer / pick scratch buffer |
| `Space us` / `Space uw` | Toggle spell / wrap |
| `Space snh` | Noice message history |
| `Space N` | Neovim news |

### Neovide only

| Keymap | Action |
|---|---|
| `Cmd c` / `Cmd v` | Copy / paste |
| `Cmd s` | Save |
| `Cmd =` / `Cmd -` / `Cmd 0` | Zoom in / out / reset |
| `Space ut` | Toggle window transparency |

Left Option acts as Alt, so `<Alt-…>` mappings work in Neovide on macOS.

## Plugins

| Plugin | Purpose |
|---|---|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager |
| [snacks.nvim](https://github.com/folke/snacks.nvim) | Dashboard, lazygit, terminal, zen, scratch, indent guides, smooth scroll |
| [noice.nvim](https://github.com/folke/noice.nvim) + [nvim-notify](https://github.com/rcarriga/nvim-notify) | Cmdline, messages and notifications UI |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keymap hints |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) + [tabline.nvim](https://github.com/kdheepak/tabline.nvim) | Statusline and buffer tabs |
| [nvim-scrollbar](https://github.com/petertriho/nvim-scrollbar) + [nvim-hlslens](https://github.com/kevinhwang91/nvim-hlslens) | Scrollbar with diagnostics, search and git marks |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | File explorer sidebar |
| [oil.nvim](https://github.com/stevearc/oil.nvim) | Edit directories like buffers |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder (with fzf-native and ui-select) |
| [harpoon](https://github.com/ThePrimeagen/harpoon) | Quick file marks |
| [flash.nvim](https://github.com/folke/flash.nvim) | Jump anywhere on screen |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting and indentation |
| [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) | Code-aware textobjects and motions |
| [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context) | Sticky scope header |
| [mason.nvim](https://github.com/williamboman/mason.nvim) + [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) | Language server installer |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP server configs |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) + [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Completion and snippets |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Formatting |
| [nvim-lint](https://github.com/mfussenegger/nvim-lint) | Linting |
| [trouble.nvim](https://github.com/folke/trouble.nvim) | Diagnostics, symbols and quickfix lists |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | Highlight and search TODOs |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) + [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) | Debugging |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git signs and hunk actions |
| [code_runner.nvim](https://github.com/CRAG666/code_runner.nvim) | Run code from the editor |
| [claudecode.nvim](https://github.com/coder/claudecode.nvim) | Claude Code integration |
| [nvim-surround](https://github.com/kylechui/nvim-surround) | Surround motions |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto-close brackets |
| [undotree](https://github.com/mbbill/undotree) | Undo history tree |
| [markview.nvim](https://github.com/OXY2DEV/markview.nvim) | Markdown rendering |
| [nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua) | Inline color previews |
| [mini.animate](https://github.com/echasnovski/mini.animate) + [beacon.nvim](https://github.com/rainbowhxch/beacon.nvim) | Cursor animation and jump flash |
| [typr](https://github.com/nvzone/typr) | Typing practice (`:Typr`) |
| [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim), [tokyonight.nvim](https://github.com/folke/tokyonight.nvim), [nightfox.nvim](https://github.com/EdenEast/nightfox.nvim) | Extra colorschemes |

## Structure

```
~/.config/nvim/
├── init.lua                # Bootstraps lazy.nvim and loads modules
├── lazy-lock.json          # Pinned plugin versions
├── colors/                 # ultraviolet, token, unyielding-grayscale, pywal
└── lua/
    ├── vim-options.lua     # Editor options and Neovide settings
    ├── keymaps.lua         # Core keymaps, theme switching, run commands
    ├── custom-colors.lua   # Transparency, bold mode, highlight overrides
    ├── dashboard-art.lua   # ASCII header for the dashboard
    ├── lualine/themes/     # Custom lualine theme
    ├── token/              # Token colorscheme source (palette + highlight groups)
    └── plugins/            # One lazy.nvim spec per file
```
