return {
  "simrat39/symbols-outline.nvim",
  cmd = "SymbolsOutline",
  keys = { { "<leader>so", ":SymbolsOutline<CR>", desc = "Toggle Symbols Outline" } },
  config = function()
    require("symbols-outline").setup({
      autofold_depth = 1, -- Mặc định chỉ mở cấp đầu tiên
      width = 30, -- Độ rộng sidebar
      auto_close = true, -- Tự động đóng khi mở file khác
      keymaps = {
        close = { "q" }, -- Nhấn 'q' để đóng sidebar
        goto_location = { "<CR>", "<Space>" }, -- Đi đến function khi nhấn Enter
      },
    })
  end,
}
