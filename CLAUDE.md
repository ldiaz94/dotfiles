# Dotfiles Repository

Managed with GNU Stow for symlink-based configuration management.

## Structure

- `nvim/` - Neovim configuration
  - `.config/nvim/` - Main nvim config directory
  - Uses lazy.nvim as the plugin manager
  - LSP and file navigation plugins configured

## Workflow

1. Make changes to configs in the dotfiles repo
2. Changes are automatically reflected in `~/.config/nvim` (via Stow symlinks)
3. Commit changes to git

## Adding New Dotfiles

To add a new tool's configuration:

```bash
# Create package directory structure matching home directory layout
mkdir -p <package>/<path-to-config>
cp -r ~/.<config> <package>/

# Stow it
stow <package>

# Commit
git add . && git commit -m "Add <package> config"
```

## Tools Used

- **Stow** - Symlink farm manager for managing dotfiles
- **Lazy.nvim** - Neovim plugin manager
