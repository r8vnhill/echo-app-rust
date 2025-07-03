function Install-RustDependencies {
    # Helper function to verify that a tool was correctly installed by checking its --version output.
    function Test-Installed([string[]] $CheckCommands) {
        foreach ($command in $CheckCommands) {
            try {
                # Attempt to run the tool with --version. Suppress output with Out-Null.
                & $command --version | Out-Null
            } catch {
                # If the command fails (e.g., not in PATH), throw a descriptive error.
                throw "❌ '$CheckCommand' was not found after installation."
            }
        }
    }

    # Install Rustup using Scoop. Scoop will also install rustc and cargo through rustup.
    # If Scoop fails, PowerShell will continue unless -ErrorAction is used elsewhere.
    scoop install rustup

    # Validate that rustc was installed and is available on the system
    Test-Installed rustup, rustc, cargo

    # Inform the user that the installation and checks succeeded
    Write-Host "✅ Rust toolchain is installed successfully." -ForegroundColor Green
}

# Run the installation function
Install-RustDependencies
