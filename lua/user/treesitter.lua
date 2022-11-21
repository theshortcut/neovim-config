local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.wgsl = {
  install_info = {
    url = 'https://github.com/szebniok/tree-sitter-wgsl',
    files = { 'src/parser.c' },
  },
}

configs.setup {
  ensure_installed = 'all',
  sync_install = false,
  ignore_install = { '' },
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { '' }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { 'yaml' } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
