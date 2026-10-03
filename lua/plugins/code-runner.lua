return {
	"CRAG666/code_runner.nvim",
	config = function()
		require("code_runner").setup({
			mode = "term",
			focus = true,
			startinsert = false,
			term = {
				position = "bot",
				size = 15,
			},
			filetype = {
				cs = function()
					local project_dir = vim.fs.root(0, function(name)
						return name:match("%.csproj$") ~= nil
					end)

					if project_dir then
						return "cd " .. vim.fn.shellescape(project_dir) .. " && dotnet run$end"
					end

					return "dotnet run --file $file$end"
				end,
				python = "python3 -u",
				javascript = "node",
				typescript = "ts-node",
				lua = "lua",
				rust = "cargo run",
				go = "go run",
				java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
				c = "cd $dir && gcc $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
				cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
				sh = "bash",
			},
			project = {

			},
		})

		vim.keymap.set("n", "<leader>rc", ":RunCode<CR>", { desc = "Run Code (code_runner)" })
		vim.keymap.set("n", "<leader>rf", ":RunFile<CR>", { desc = "Run File (code_runner)" })
		vim.keymap.set("n", "<leader>rt", ":RunFile tab<CR>", { desc = "Run in new tab" })
		vim.keymap.set("n", "<leader>rq", ":RunClose<CR>", { desc = "Close runner" })
	end,
}
