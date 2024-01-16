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

### Integrated Terminal

- Toggle the integrated terminal with `<Space>tt`.

### Debugging with DAP

- Set a breakpoint with `<Space>db`.
- Run tests with `<Space>dpr`.

### Theme Switching

- Switch themes with `<Space>th`.

### File Tree View

- Toggle the file tree view with `Ctrl+n`.

### Code Formatting

This distribution uses the `black` formatter for Python, set to format on save.
- You can also format manually with `<Space>fm`.

### LazyGit Integration

- Bring up the LazyGit UI within NeoVim with `<Space>lg`. This allows you to perform Git operations directly within your NeoVim environment.

### Copilot Integration

This distribution comes with Copilot integration, allowing you to easily use the Copilot AI to generate code. To use it, you must first install the Copilot CLI and authenticate it with your GitHub account.
- Once Copilot is installed and authenticated, you can use it to generate code by running `<Space>cp` and entering the desired prompt.

## Customization

This distribution is set up to support Python development by default. However, it's designed to be flexible and can be extended to support other programming languages by modifying the `plugins.lua` file and installing the necessary LSP servers via Mason.

## Notes

- For optimal functionality, especially with DAP, it's crucial to run `:TSInstall python` on the initial setup.
- If you encounter any issues, ensure that you have removed any old configurations and cleared the NeoVim cache as described in the Installation section.

Happy Coding!
