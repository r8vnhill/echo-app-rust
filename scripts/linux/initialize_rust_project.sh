#!/usr/bin/env bash

set -euo pipefail

# Initializes a new Rust binary project and changes into its directory.
#
# Arguments:
#   $1 - Name of the Rust project to create
initialize_rust_project() {
  local project_name="$1"

  # Create a new Rust binary project using Cargo
  cargo new "$project_name"

  # Change into the newly created project directory
  pushd "$project_name"
}

# Call the function with the desired project name
initialize_rust_project "echo_app_rust"
