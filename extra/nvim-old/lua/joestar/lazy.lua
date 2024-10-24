require("lazy").setup({
	{
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {"nvim-lua/plenary.nvim", "BurntSushi/ripgrep"}
	},
--	{"scottmckendry/cyberdream.nvim"},
	{ 
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000
	},

--	{"rebelot/kanagawa.nvim"},
	{"nvim-treesitter/nvim-treesitter"},
	{"mbbill/undotree"},
	{"tpope/vim-fugitive"},
	{"nvim-lualine/lualine.nvim"},
	{'Diogo-ss/42-header.nvim'},
	{"andweeb/presence.nvim"},
--LSP
	{"neovim/nvim-lspconfig"},
	{"williamboman/mason.nvim"},
	{"williamboman/mason-lspconfig.nvim"},
	{"hrsh7th/nvim-cmp"},
	{"hrsh7th/cmp-nvim-lsp"},
	{"hrsh7th/cmp-buffer"},
	{"hrsh7th/cmp-path"},
	{"saadparwaiz1/cmp_luasnip"},
	{"L3MON4D3/LuaSnip"},
	{"rafamadriz/friendly-snippets"},
})

