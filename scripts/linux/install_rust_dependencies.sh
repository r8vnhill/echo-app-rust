#!/usr/bin/env bash

# Enable strict mode for safer scripting:
# -e: Exit on any command failure
# -u: Treat unset variables as errors
# -o pipefail: Cause a pipeline to fail if any command fails
set -euo pipefail

# Function to check if given commands are available and respond to --version
test_installed() {
    for cmd in "$@"; do
        # Check if command is in PATH
        if ! command -v "$cmd" &>/dev/null; then
            echo "❌ '$cmd' was not found after installation. Check your PATH." >&2
            exit 1
        fi
        # Check if the command responds to --version
        "$cmd" --version >/dev/null || {
            echo "❌ '$cmd' exists but failed to respond to --version." >&2
            exit 1
        }
    done
}

# Install minimal C toolchain using apt (Debian/Ubuntu)
install_c_toolchain_debian() {
    echo "📦 Installing C compiler and build tools (Debian/Ubuntu)..."

    # Update the APT package index
    sudo apt update

    # Install essential packages for building C/C++ projects and native Rust crates
    sudo apt install -y build-essential pkg-config libssl-dev

    # Confirm key tools were installed successfully
    test_installed gcc make
}

# Install Rust toolchain via rustup
install_rust_dependencies() {
    # Install rustup only if not already present
    if ! command -v rustup &>/dev/null; then
        echo "📦 Installing rustup using the official script..."
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    else
        echo "ℹ️ rustup is already installed."
    fi

    # Source environment variables to ensure `cargo` and `rustc` are available
    if [ -f "$HOME/.cargo/env" ]; then
        . "$HOME/.cargo/env"
    else
        echo "⚠️ Warning: '$HOME/.cargo/env' not found. Ensure Rust is properly installed."
    fi

    # Verify Rust toolchain is correctly installed
    test_installed rustup rustc cargo

    echo "✅ Rust toolchain is installed successfully."
}

# Entry point: Run all installation steps
install_c_toolchain_debian
install_rust_dependencies
