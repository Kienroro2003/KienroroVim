return {
  "voldikss/vim-floaterm",
  config = function()
    -- Cấu hình Floaterm
    vim.g.floaterm_width = 0.8
    vim.g.floaterm_height = 0.8
    vim.g.floaterm_borderchars = "─│─│╭╮╯╰"
    vim.g.floaterm_wintype = "float"
    vim.g.floaterm_autoclose = 2 -- Tự động đóng terminal khi hoàn thành

    -- Key mappings tối ưu
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    keymap("n", "<leader>tt", ":FloatermToggle<CR>", vim.tbl_extend("force", opts, { desc = "Toggle Floaterm" }))
    keymap("n", "<leader>tn", ":FloatermNew<CR>", vim.tbl_extend("force", opts, { desc = "New Floaterm" }))
    keymap("n", "<leader>th", ":FloatermPrev<CR>", vim.tbl_extend("force", opts, { desc = "Previous Floaterm" }))
    keymap("n", "<leader>tl", ":FloatermNext<CR>", vim.tbl_extend("force", opts, { desc = "Next Floaterm" }))
    keymap("n", "<leader>tx", ":FloatermKill<CR>", vim.tbl_extend("force", opts, { desc = "Kill Floaterm" }))
  end,
}
