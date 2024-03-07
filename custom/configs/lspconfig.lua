local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "gopls", "rust_analyzer" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- 
local clangd_capabilities = require("plugins.configs.lspconfig").capabilities
clangd_capabilities.offsetEncoding = "utf-8"

lspconfig.clangd.setup {
    on_attach = on_attach,
    capabilities = clangd_capabilities,
    cmd = {
		-- see clangd --help-hidden
		"clangd",
		-- by default, clang-tidy use -checks=clang-diagnostic-*,clang-analyzer-*
		-- to add more checks, create .clang-tidy file in the root directory
		-- and add Checks key, see https://clang.llvm.org/extra/clang-tidy/
		"--clang-tidy",
		"--background-index",
		"--completion-style=bundled",
		"--header-insertion=iwyu",
		"--enable-config",
	},
	-- TODO: figure out what is this
	init_options = {
		clangdFileStatus = true, -- Provides information about activity on clangd’s per-file worker thread
		usePlaceholders = true,
		completeUnimported = true,
		semanticHighlighting = true,
	},
}

