local M = {}

function M.setup(opts)
	opts = opts or {}

	vim.api.nvim_create_user_command("ExcelToCSV", function()
		M.export_all_sheets()
	end, {})
end

function M.export_all_sheets()
	local file = vim.fn.expand("%:p")

	if not file:match("%.xlsx$") then
		vim.notify("Keine .xlsx Datei geöffnet", vim.log.levels.ERROR)
		return
	end

	local dir = vim.fn.fnamemodify(file, ":h")
	local base = vim.fn.fnamemodify(file, ":t:r")

	local sheet = 1
	local exported = 0

	while true do
		local out = string.format("%s/%s_sheet_%d.csv", dir, base, sheet)

		local cmd = string.format("python3 -m xlsx2csv -s %d %q %q", sheet, file, out)

		vim.fn.system(cmd)

		if vim.v.shell_error ~= 0 then
			break
		end

		exported = exported + 1
		sheet = sheet + 1
	end

	if exported == 0 then
		vim.notify("Keine Sheets exportiert", vim.log.levels.ERROR)
	else
		vim.notify(string.format("Excel → CSV: %d Sheets exportiert ✔", exported), vim.log.levels.INFO)
	end
end

vim.api.nvim_create_user_command("ExcelToCSV", function()
	M.export_all_sheets()
end, {
	desc = "Exportiert alle Excel-Sheets als CSV",
})

return M
