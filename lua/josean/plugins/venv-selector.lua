return {
  "linux-cultist/venv-selector.nvim",
  dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
  opts = {},
  keys = {
    { "<leader>vs", "<cmd>VenvSelect<CR>", desc = "Chọn Virtual Environment" },
    { "<leader>vc", "<cmd>VenvSelectCached<CR>", desc = "Chọn Virtual Environment (cached)" },
  },
}
