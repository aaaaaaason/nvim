local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        }
    }

    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            { -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-buffer' }, -- Optional
            { 'hrsh7th/cmp-path' }, -- Optional
            { 'L3MON4D3/LuaSnip' }, -- Required
        }
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    --Use {
    --  'phaazon/hop.nvim',
    --  branch = 'v2', -- optional but strongly recommended
    --}
    use 'ggandor/leap.nvim'

    use { "akinsho/toggleterm.nvim", tag = '*' }

    use {
        'lewis6991/gitsigns.nvim',
        -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    }

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use "lukas-reineke/indent-blankline.nvim"

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use "gpanders/editorconfig.nvim"

    use 'ThePrimeagen/harpoon'

    -- using packer.nvim
    --use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }

    use { 'jose-elias-alvarez/null-ls.nvim' }
    use { 'kevinhwang91/nvim-bqf' }
    -- Lua

    --use "EdenEast/nightfox.nvim"
    --use 'Mofiqul/dracula.nvim'
    --use 'navarasu/onedark.nvim'
    --use 'shaunsingh/solarized.nvim'
    --use { "ellisonleao/gruvbox.nvim" }
    --use { "catppuccin/nvim", as = "catppuccin" }
    --use 'ayu-theme/ayu-vim'
    --use "aaaaaaason/darkplus.nvim"
    --use "lunarvim/darkplus.nvim"
    --use 'martinsione/darkplus.nvim'
    -- Packer:
    use 'aaaaaaason/vscode.nvim'
    use 'simrat39/symbols-outline.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end

    require 'quickfix'
    require 'plugin-config/nvim-tree'
    require 'plugin-config/telescope'
    require 'plugin-config/nvim-treesitter'
    --require 'plugin-config/hop'
    require 'plugin-config/lsp-zero'
    --require 'plugin-config/one-dark'
    require 'plugin-config.lualine'
    require 'plugin-config.toggleterm'
    require 'plugin-config.gitsigns'
    require 'plugin-config.indent-blankline'
    --require 'plugin-config.bufferline'
    require 'plugin-config.null-ls'
    require 'plugin-config.nvim-bqf'
    require 'plugin-config/harpoon'
    require 'plugin-config/symbols-outline'
    require 'plugin-config/leap'
    require 'basic'
end)
