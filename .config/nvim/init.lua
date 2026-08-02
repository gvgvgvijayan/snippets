-- Set leader keys before loading anything else
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Execute core editor configs
require('config.options')
require('config.keymaps')
require('config.autocmds')

-- Bootstrap lazy.nvim package manager engine
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Initialize lazy and tell it to scan the plugins directory automatically
require('lazy').setup({
  spec = {
    { import = 'plugins' }, -- Automatically imports everything inside lua/plugins/
  },
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘', config = '🛠', event = '📅', ft = '📂', init = '⚙',
      keys = '🗝', plugin = '🔌', runtime = '💻', require = '🌙',
      source = '📄', start = '🚀', task = '📌', lazy = '💤 ',
    },
  },
})