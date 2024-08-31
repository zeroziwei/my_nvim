local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
local plugins = {
  "folke/tokyonight.nvim",           -- 主题
  "nvim-treesitter/nvim-treesitter", -- 语法高亮
  "nvim-tree/nvim-tree.lua",         -- 文档树
  "nvim-tree/nvim-web-devicons",     -- 文档树图标
  "nvim-lualine/lualine.nvim",       -- 状态栏口
  -- tmux-navigator
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  --bufferline
  { 'akinsho/bufferline.nvim', version = "*",     dependencies = 'nvim-tree/nvim-web-devicons' },
  "p00f/nvim-ts-rainbow",    -- 配合treesitter，不同括号颜色区分
  "numToStr/Comment.nvim",   -- gcc和gc注释
  "windwp/nvim-autopairs",   -- 自动补全括号
  "lewis6991/gitsigns.nvim", -- 左则git提示

  {
    'nvim-telescope/telescope.nvim', -- 文件检索
    tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  { 'neoclide/coc.nvim',       branch = 'master', run = 'npm ci' },
  "honza/vim-snippets",
  "chentoast/marks.nvim",
  "zbirenbaum/neodim",
  "kylechui/nvim-surround"
}
local opts = {} -- 注意要定义这个变量
require("lazy").setup(plugins, opts)
