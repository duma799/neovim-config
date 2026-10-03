return {
	"petertriho/nvim-scrollbar",
	dependencies = { "kevinhwang91/nvim-hlslens" },
	event = "BufWinEnter",
	opts = {
		handle = {
			color = "ScrollbarHandle",
		},
		marks = {
			Cursor = { color = "ScrollbarCursor" },
			Error = { color = "ScrollbarError" },
			Warn = { color = "ScrollbarWarn" },
			Info = { color = "ScrollbarInfo" },
			Hint = { color = "ScrollbarHint" },
			Misc = { color = "ScrollbarMisc" },
			Search = { color = "ScrollbarSearch" },
			GitAdd = { color = "ScrollbarGitAdd" },
			GitChange = { color = "ScrollbarGitChange" },
			GitDelete = { color = "ScrollbarGitDelete" },
		},
		handlers = {
			cursor = true,
			diagnostic = true,
			gitsigns = true,
			handle = true,
			search = true,
		},
	},
}