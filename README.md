# AlchemicVim
Hey there! 👋

This is my personal NeoVim config. For me, it's a learning experience that's allowed me to make something that I find really helpful to do my job.

## Highlights
- This config uses NeoVim's native `vim.pack` to handle plugin installs. `<leader>pu` will let you update plugins.
- Several of quality of life plugins are included, mainly from mini.nvim.
- I'm a Ruby on Rails developer working in a component-based architecture, so some of the decisions I make (particularly around loading ruby-lsp) center around that.

## Versions
I had an old config hosted at this repo that is incompatible with the most recent version. The `main` branch is going to be bleeding edge changes, and the `v0.1` branch has the latest version of that old config.

## Setup

### Install NeoVim
On a mac:
```bash
brew install neovim
```

### Install external dependencies
- Stuff that's probably already installed on your system - `curl`, `git`
- ripgrep and fd-find
```bash
brew install rg fd
```
- ruby and bundler
- ruby-lsp gem HAS to be installed manually or through bundler, there are problems with installing it via mason
```bash
gem install ruby-lsp
```

## Acknowledgements
[kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) was the place I started building from.
