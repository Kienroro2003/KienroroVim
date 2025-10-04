return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "tabs",
      separator_style = "slant",
    },
  },

  vim.keymap.set("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true }),
  vim.keymap.set("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true }),
  vim.keymap.set("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", { noremap = true, silent = true }),

  vim.keymap.set("n", "<leader>bp", ":BufferLineCyclePrev<CR>", { desc = "Chuyển buffer trước", silent = true }),
  vim.keymap.set(
    "n",
    "<leader>bn",
    ":BufferLineCycleNext<CR>",
    { desc = "Chuyển buffer tiếp theo", silent = true }
  ),
  vim.keymap.set("n", "<leader>bc", ":bdelete<CR>", { desc = "Đóng buffer hiện tại", silent = true }),
  vim.keymap.set(
    "n",
    "<leader>bo",
    ":BufferLineCloseOthers<CR>",
    { desc = "Đóng tất cả buffer khác", silent = true }
  ),
  vim.keymap.set(
    "n",
    "<leader>bl",
    ":BufferLineCloseLeft<CR>",
    { desc = "Đóng các buffer bên trái", silent = true }
  ),
  vim.keymap.set(
    "n",
    "<leader>br",
    ":BufferLineCloseRight<CR>",
    { desc = "Đóng các buffer bên phải", silent = true }
  ),

  vim.keymap.set(
    "n",
    "<leader>b,",
    ":BufferLineMovePrev<CR>",
    { desc = "Di chuyển buffer về trước", silent = true }
  ),
  vim.keymap.set("n", "<leader>b.", ":BufferLineMoveNext<CR>", { desc = "Di chuyển buffer về sau", silent = true }),
}
