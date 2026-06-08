# excel2csv.nvim

Export all sheets of an Excel workbook (.xlsx) directly to CSV files from Neovim.

## Features

- Export every worksheet from an .xlsx file
- Creates one CSV per sheet
- Simple :ExcelToCSV command
- Works with Lazy.nvim and other plugin managers

## Requirements

- Neovim >= 0.10
- Python 3
- xlsx2csv

Install xlsx2csv:

bash pip install xlsx2csv 

## Installation

### Lazy.nvim

lua {     "yourname/excel2csv.nvim",     cmd = "ExcelToCSV", } 

## Usage

Open an Excel file and run:

vim :ExcelToCSV 

Example:

text report.xlsx 

Exports:

text report_sheet_1.csv report_sheet_2.csv report_sheet_3.csv 

The CSV files are written to the same directory as the source workbook.

## Keymap Example

lua {     "yourname/excel2csv.nvim",     cmd = "ExcelToCSV",     keys = {         {             "<leader>xc",             "<cmd>ExcelToCSV<CR>",             desc = "Excel → CSV",         },     }, } 

## License

MIT
