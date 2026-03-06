# Dotfiles

Personal dotfiles repository managed with GNU Stow.

## Overview

This repository contains configuration files for development tools, with emphasis on Neovim as the primary editor. Each tool's configuration is organized as a separate "package" that can be symlinked into the home directory independently.

## What's Included

### nvim
Complete Neovim configuration with:
- **lazy.nvim** - Plugin manager for efficient plugin loading
- **LSP Setup** - Language Server Protocol support with mason for automatic server installation
  - Lua (lua_ls)
  - Python (basedpyright)
  - TypeScript/JavaScript (ts_ls)
  - Rust (rust_analyzer)
- **Completion** - nvim-cmp with snippet support via LuaSnip
- **Treesitter** - Better syntax highlighting, indentation, and incremental selection
- **File Navigation** - Telescope for fuzzy finding

## Installation

### Prerequisites

- Neovim (0.9+)
- Git
- GNU Stow

### Setup

1. Clone the repository:
```bash
git clone <repo-url> ~/dotfiles
cd ~/dotfiles
```

2. Install Stow (if not already installed):
```bash
# macOS
brew install stow

# Linux (Debian/Ubuntu)
sudo apt-get install stow

# Linux (Fedora/RHEL)
sudo dnf install stow
```

3. Stow the packages:
```bash
# Stow nvim config
stow nvim

# Or stow all packages
stow */
```

This creates symlinks in your home directory pointing to the configs in this repo.

## Usage

### Making Changes

Simply edit files in this repository. Changes are automatically reflected in your home directory via symlinks.

### Adding New Dotfiles

To add configuration for a new tool:

1. Create the directory structure matching your home directory:
```bash
mkdir -p <package>/<path-to-config>
```

2. Copy existing configs:
```bash
cp -r ~/.<config> <package>/
```

3. Stow the package:
```bash
stow <package>
```

4. Commit to git:
```bash
git add .
git commit -m "Add <package> configuration"
```

### Removing Packages

To remove a stowed package:
```bash
stow -D <package>
```

## Development

### Keybindings

- **Leader key**: `,`
- **LSP**: `gd` (definition), `gr` (references), `K` (hover), `,rn` (rename), `,ca` (code action)
- **Treesitter incremental selection**: `gnn` (start), `grn` (expand), `grc` (scope), `grm` (shrink)

### Adding Plugins

Plugins are defined in `nvim/.config/nvim/lua/plugins/`. Create a new file or modify existing ones following the lazy.nvim plugin spec.

## Resources

- [GNU Stow Documentation](https://www.gnu.org/software/stow/)
- [Neovim Documentation](https://neovim.io)
- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
