vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "vsplit window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "vsplit window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make vsplits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current vsplit" }) -- close current split window

keymap.set("n", "<leader>rr", ":w <bar> exec '!python3 '.shellescape('%')<CR>")

local compile_and_run = {
  c = "gcc % -o %:r && ./%:r",
  cpp = "g++ -std=c++20 -Wall -Wextra -g % -o %:r && ./%:r",
  python = "python3 %",
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "python" },
  callback = function(args)
    local cmd = compile_and_run[args.match]
    if cmd then
      vim.keymap.set("n", "cpl", function()
        vim.cmd("w") -- Save the file before compiling
        local term_cmd = cmd
          :gsub("%%:r", vim.fn.fnameescape(vim.fn.fnamemodify(args.file, ":r")))
          :gsub("%%", vim.fn.fnameescape(args.file))
        vim.cmd("vsplit | terminal " .. term_cmd)
      end, { buffer = args.buf, desc = "Compile and Run" })
    end
  end,
})

vim.api.nvim_set_keymap("n", "<leader>;", "A;<Esc>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>a", "ggVG", { noremap = true, silent = true })

-- vim.keymap.set("i", "<CR><CR>", function()
-- Kiểm tra filetype hiện tại
-- if vim.bo.filetype == "python" then
-- local line = vim.api.nvim_get_current_line()
-- local indent = line:match("^%s*")
-- vim.api.nvim_feedkeys("\n" .. indent .. "\t\n" .. indent, "n", false)
-- end
-- end, { noremap = true })
