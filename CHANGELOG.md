## 2026-01-29

- Update 'mini.completion' setup to use `now_if_args` instead of `later`. Otherwise it doesn't set proper omnifunc for files opened during startup (because necessary `LspAttach` events are already triggered).

- Move setting up 'mini.nvim' modules that need `now_if_args` in a separate "Step one or two" section.

## 2026-01-13

- Improve 'stevearc/conform.nvim' setup:
    - Setup plugin to allow formatting from LSP server if no dedicated formatter is available. This provides more versatile behavior. Previously it was forced in `<Leader>lf` mapping.
    - Use plain `require('conform').format()` in `<Leader>lf` keymaps.

## 2026-01-08

- Improve keymaps for exploring quickfix list (make implementation shorter and more robust) and location list (add it as `<Leader>eQ` to compliment `<Leader>eq` for quickfix).

## 2026-01-03

- Improve 'mini.clue' setup:
    - Use array `mode` where possible for a more concise setup.
    - Use `gen_clues.square_brackets()` to show more built-in clues.
    - Use `s` as a trigger. Currently only for 'mini.surround' actions, but will be more useful in the future.

## 2025-12-20

- Start using 'mini.cmdline'.

## 2025-12-16

- Update 'nvim-treesitter/nvim-treesitter' plugin to not explicitly use `main` branch as it is now the default.

- Update 'mason-org/mason.nvim' example to use `now_if_args` instead of `later`. Otherwise LSP server installed via Mason will not yet be available if Neovim is started as `nvim -- path/to/file`.

## 2025-11-22

- Update `<Leader>fs` mapping to use `"workspace_symbol_live"` scope for `:Pick lsp` instead of `"workspace_symbol"`

## 2025-10-16

- Move `now_if_args` startup helper to 'init.lua' as `_G.Config.now_if_args` to be directly usable from other config files.

- Enable 'mini.misc' behind `now_if_args` instead of `now`. Otherwise `setup_auto_root()` and `setup_restore_cursor()` don't work on initial file(s) if Neovim is started as `nvim -- path/to/file`.

## 2025-10-13

- Initial release.
