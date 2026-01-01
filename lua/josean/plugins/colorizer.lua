return {
  "NvChad/nvim-colorizer.lua",
  event = "BufReadPre",
  opts = {
    filetypes = { "*", "!lazy", "!popup" },
    user_default_options = {
      mode = "background", -- Hiển thị màu nền
      css = true, -- Bật tính năng CSS
      tailwind = true, -- Bật tính năng Tailwind
    },
  },
}
