function Initialize-RustProject {
    [CmdletBinding()]
    param (
        # Name of the Rust project to create.
        [string]$ProjectName
    )

    # Create a new Rust binary project with the specified name using Cargo.
    # This will generate a new directory containing a basic Rust project structure.
    cargo new $ProjectName

    # Change the current working directory to the newly created project folder.
    # This makes it easier to run further setup steps inside the project context.
    Push-Location $ProjectName
}

# Call the function to create and navigate into a new Rust project named "echo_app_rust"
Initialize-RustProject -ProjectName "echo_app_rust"
