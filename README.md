# NeoVim Distribution for Python Development

This NeoVim distribution is tailored for an enhanced Python development experience. It features a robust set of plugins and configurations, including support for the Debug Adapter Protocol (DAP) for an integrated debugging experience. While it is optimized for Python, it can be easily extended to support a variety of programming languages.

## Prerequisites

Before you begin, ensure that you have NeoVim installed on your system. This distribution requires NeoVim 0.5 or newer.

## Installation

To install this NeoVim distribution:

1. Backup your existing NeoVim configuration if necessary.
2. Clone this distribution into `~/.config/nvim` or your preferred configuration directory.
3. Delete any existing NeoVim cache found at `~/.local/share/nvim` to prevent conflicts with the new configuration.

## Setup

Upon the first launch of NeoVim with this distribution, run the following commands:

- `:TSInstall python` - Installs the necessary Tree-sitter grammar for Python, which enhances syntax highlighting and code analysis for DAP.
- `:MasonInstallAll` - Installs all LSP servers and necessary tools as specified in the `plugins.lua` file. Add new plugins there and run this command again to install them.

## Usage

### Language Server Protocol (LSP)

- Run `:LspInfo` to view the LSP configuration currently loaded into the buffer.

### Debugging with DAP

- Set a breakpoint with `[space] + d + b`.
- Run tests with `[space] + d + p + r`.

### Theme Switching

- Switch themes with `[space] + t + h`.

### File Tree View

- Toggle the file tree view with `Ctrl + n`.

### Code Formatting

- The distribution uses the `black` formatter for Python, set to format on save.
- You can also format manually with `[space] + f + m`.

## Customization

This distribution is set up to support Python development by default. However, it's designed to be flexible and can be extended to support other programming languages by modifying the `plugins.lua` file and installing the necessary LSP servers via Mason.

## Notes

- For optimal functionality, especially with DAP, it's crucial to run `:TSInstall python` on the initial setup.
- If you encounter any issues, ensure that you have removed any old configurations and cleared the NeoVim cache as described in the Installation section.

Happy Coding!

