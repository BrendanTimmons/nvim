local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  vim.notify('nvim-lsp-installer could not be loaded')
	return
end

-- Installed servers
local serverNames = {
  'angularls',
  'eslint',
  'html',
  'jsonls',
  'jsonls',
  'sumneko_lua',
  'tsserver'
}

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

  for _, serverName in pairs(serverNames) do
	 if server.name == serverName then
	 	local serverOpts = require("user.lsp.settings." .. serverName)
	 	opts = vim.tbl_deep_extend("force", serverOpts, opts)
	 end
  end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
