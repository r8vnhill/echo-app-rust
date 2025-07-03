#!/usr/bin/env bash

set -euo pipefail

# Function to check if commands are available by calling them with --version
test_installed() {
  for cmd in "$@"; do
    if ! command -v "$cmd" &> /dev/null; then
      echo "❌ '$cmd' was not found after installation. Check your PATH." >&2
      exit 1
    fi
    "$cmd" --version > /dev/null || {
      echo "❌ '$cmd' exists but failed to respond to --version." >&2
      exit 1
    }
  done
}

install_rust_dependencies() {
  # Install rustup via Homebrew if not already installed
  if ! command -v rustup &> /dev/null; then
    echo "📦 Installing rustup using Homebrew..."
    brew install rustup-init
    rustup-init -y
  else
    echo "ℹ️ rustup is already installed."
  fi

  # Add the cargo bin directory to PATH
    if [ -f "$HOME/.cargo/env" ]; then
      . "$HOME/.cargo/env"
    else
      echo "⚠️ Warning: '$HOME/.cargo/env' not found. Ensure Rust is properly installed."
    fi

    # Ensure rustc and cargo are installed
    test_installed rustup rustc cargo

    echo "✅ Rust toolchain is installed successfully."
}

install_rust_dependencies
