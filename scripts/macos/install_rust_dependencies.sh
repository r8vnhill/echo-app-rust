#!/usr/bin/env bash

# Enable strict mode:
# -e: Exit immediately if a command exits with a non-zero status
# -u: Treat unset variables as errors
# -o pipefail: Fail a pipeline if any command fails
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

# Install minimal C toolchain using Homebrew (no Xcode required)
install_c_toolchain() {
    echo "📦 Installing C compiler and build tools using Homebrew..."

    # Install LLVM (provides clang), GNU Make, and pkg-config
    brew install llvm make pkg-config

    # Suggest exporting CC/CXX for crates that need clang
    if brew list llvm &>/dev/null; then
        echo "📝 You may want to export these for compatibility with some crates:"
        echo "  export CC=$(brew --prefix llvm)/bin/clang"
        echo "  export CXX=$(brew --prefix llvm)/bin/clang++"
    fi

    # Ensure make is available
    test_installed make
}

# Install Rust toolchain via rustup
install_rust_dependencies() {
    # Install rustup if not already installed
    if ! command -v rustup &>/dev/null; then
        echo "📦 Installing rustup using Homebrew..."
        brew install rustup-init
        rustup-init -y
    else
        echo "ℹ️ rustup is already installed."
    fi

    # Source Rust environment if available
    if [ -f "$HOME/.cargo/env" ]; then
        . "$HOME/.cargo/env"
    else
        echo "⚠️ Warning: '$HOME/.cargo/env' not found. Ensure Rust is properly installed."
    fi

    # Ensure rustup, rustc, and cargo are functional
    test_installed rustup rustc cargo

    echo "✅ Rust toolchain is installed successfully."
}

# Run both installation steps
install_c_toolchain
install_rust_dependencies
