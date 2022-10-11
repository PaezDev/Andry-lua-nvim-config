local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function()
        -- Packer just manages itself
	    use 'wbthomason/packer.nvim'

        -- nvim LSP configs
	    use 'neovim/nvim-lspconfig'
	    use 'hrsh7th/cmp-nvim-lsp'
	    use 'hrsh7th/cmp-buffer'
	    use 'hrsh7th/cmp-path'
	    use 'hrsh7th/cmp-cmdline'
	    use 'hrsh7th/nvim-cmp'
	    use 'williamboman/nvim-lsp-installer'
        
        -- Luasnip (primarily for hrsh7th/nvim-cmp)
	    use 'L3MON4D3/LuaSnip'
	    use 'saadparwaiz1/cmp_luasnip'

        -- Load spicy gruvbox color theme
	    use 'gruvbox-community/gruvbox'

        -- Treesitter is life
	    use {
		        'nvim-treesitter/nvim-treesitter',
		        run = ':TSUpdate'
	    }

        -- Gaze deeply into the unknown
	    use {
		        'nvim-telescope/telescope.nvim',
		        requires = { {'nvim-lua/plenary.nvim'} }
	    }

        --Use fzf native for telescope
	    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

        -- nvim-tree, lua alternative to nerd tree :)
        use {
                'nvim-tree/nvim-tree.lua',
                requires = { 'nvim-tree/nvim-web-devicons',
                },
                config = function() require'nvim-tree'.setup {} end
        }

        -- LazyGit because I'm lazy
        use 'kdheepak/lazygit.nvim'

        -- comment stuff out
	    use 'preservim/nerdcommenter'

        -- Time Pope is a god
	    use 'tpope/vim-surround'

        -- Yanking manager
	    use {
		        "AckslD/nvim-neoclip.lua",
		        requires = { {'nvim-telescope/telescope.nvim'} },
		        config = function()
		    	        require('neoclip').setup()
		        end,
	    }
        
        -- Cool little line
        use {
		        'nvim-lualine/lualine.nvim',
		        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
	    }

        use {
		        'goolord/alpha-nvim',
		        requires = { 'nvim-tree/nvim-web-devicons' },
		        config = function ()
			            require'alpha'.setup(require'alpha.themes.theta'.config)
		        end
	    }

        -- A floating terminal has appeared!!
        use {"akinsho/toggleterm.nvim", tag = '*', config = function()
            require("toggleterm").setup {} end
        }

        -- Auto pairs
        use "windwp/nvim-autopairs"

        -- End wise
        use {
                 "RRethy/nvim-treesitter-endwise",
                 wants = "nvim-treesitter",
                 event = "InsertEnter",
        }

        -- Auto tag
        use {
                "windwp/nvim-ts-autotag",
                wants = "nvim-treesitter",
                event = "InsertEnter",
                config = function()
                        require("nvim-ts-autotag").setup { enable = true }
                end,
        }

        use { 
                'anuvyklack/pretty-fold.nvim',
                config = function()
                        require('pretty-fold').setup()
                end
        }

        -- Rust
	    use 'simrat39/rust-tools.nvim'
	    use 'mfussenegger/nvim-dap'
	    use 'nvim-lua/popup.nvim'

        -- Automatically set up your configuration after cloning packer.nvim
    	-- Put this at the end after all plugins
    	if packer_bootstrap then
		    require('packer').sync()
	    end
end)
