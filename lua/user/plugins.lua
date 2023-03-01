local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
  print 'Installing packer close and reopen Neovim...'
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use 'wbthomason/packer.nvim' -- Have packer manage itself
  use 'nvim-lua/popup.nvim' -- An implementation of the Popup API from vim in Neovim
  use 'nvim-lua/plenary.nvim' -- Useful lua functions used by lots of plugins
  use 'windwp/nvim-autopairs' -- Autopairs, integrates with both cmp and treesitter
  use 'numToStr/Comment.nvim' -- Easily comment stuff
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-tree/nvim-tree.lua'
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
  use 'moll/vim-bbye'
  use 'nvim-lualine/lualine.nvim'
  use 'ahmedkhalf/project.nvim'
  use 'lewis6991/impatient.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'goolord/alpha-nvim'
  use 'antoinemadec/FixCursorHold.nvim' -- This is needed to fix lsp doc highlight
  use 'ggandor/lightspeed.nvim'
  use {
    'xiyaowong/nvim-transparent',
    config = function()
      require('transparent').setup {
        enable = true,
        styles = {
          sidebars = "transparent"
        }
      }
    end,
  }
  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  }
  use {
    'raghur/vim-ghost',
    run = ':GhostInstall',
  }
  use {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup()
    end,
  }

  -- Colorschemes
  use 'lunarvim/colorschemes'
  use { 'folke/tokyonight.nvim', config = function()
    require('tokyonight').setup({
      transparent = true
    })
  end,
  }

  -- cmp plugins
  use 'hrsh7th/nvim-cmp' -- The completion plugin
  use 'hrsh7th/cmp-buffer' -- buffer completions
  use 'hrsh7th/cmp-path' -- path completions
  use 'hrsh7th/cmp-cmdline' -- cmdline completions
  use 'saadparwaiz1/cmp_luasnip' -- snippet completions
  use 'hrsh7th/cmp-nvim-lsp'

  -- snippets
  use 'L3MON4D3/LuaSnip' --snippet engine
  use 'rafamadriz/friendly-snippets' -- a bunch of snippets to used

  -- LSP
  use 'neovim/nvim-lspconfig' -- enable LSP
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'jose-elias-alvarez/null-ls.nvim' -- for formatters and linters
  use 'RRethy/vim-illuminate'
  use 'simrat39/rust-tools.nvim'
  use 'github/copilot.vim'
  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup {}
    end,
  }
  use {
    'saecki/crates.nvim',
    tag = 'v0.2.1',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('crates').setup()
    end,
  }

  -- DAP
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'ravenxrz/DAPInstall.nvim'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  -- Testing
  use 'vim-test/vim-test'
  use {
    'nvim-neotest/neotest',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim',
      'marilari88/neotest-vitest',
      'rouge8/neotest-rust',
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-vitest',
          require 'neotest-rust',
        },
      }
    end,
  }

  -- Git
  use 'lewis6991/gitsigns.nvim'
  use {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = function()
      require('octo').setup()
    end,
  }

  -- Notes
  use 'renerocksai/telekasten.nvim'
  use 'renerocksai/calendar-vim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
