# echo-app-rust: A simple Rust CLI to understand Cargo and Rust's ecosystem

[![License: BSD-2-Clause](https://img.shields.io/badge/License-BSD%202--Clause-blue.svg)](./LICENSE)
[![Rust](https://img.shields.io/badge/Rust-2021%2B-blue?logo=rust)](https://www.rust-lang.org/tools/install)
[![Educational](https://img.shields.io/badge/purpose-educational-yellow)](https://dibs.ravenhill.cl)
[![Status](https://img.shields.io/badge/status-stable-brightgreen)]()
[![DIBS Site](https://img.shields.io/badge/website-dibs.ravenhill.cl-purple)](https://dibs.ravenhill.cl)

A minimal command-line app written in Rust, designed to introduce Cargo and the Rust toolchain through a reproducible, idiomatic, and educational example. It accompanies the DIBS course’s lesson on setting up a basic Rust project, aimed at learners with a background in Kotlin or similar languages.

> [!note]
> The course is taught in Spanish, but **all code and repository documentation are in English** to support a wider audience and promote accessibility.

## 📖 Table of Contents

- [echo-app-rust: A simple Rust CLI to understand Cargo and Rust's ecosystem](#echo-app-rust-a-simple-rust-cli-to-understand-cargo-and-rusts-ecosystem)
  - [📖 Table of Contents](#-table-of-contents)
  - [🎓 Lessons](#-lessons)
  - [🔍 Overview](#-overview)
  - [📝 Getting Started](#-getting-started)
    - [Prerequisites](#prerequisites)
    - [Clone \& Compile](#clone--compile)
  - [🤝 Contributing](#-contributing)
    - [How to Contribute](#how-to-contribute)
  - [🛡️ License](#️-license)
  - [🌐 DIBS Website](#-dibs-website)

## 🎓 Lessons

This repository accompanies the following lesson from the DIBS course:

- **[Creating a Basic Rust Project with Cargo](https://dibs.ravenhill.cl/docs/build-systems/init/cargo)**  
  Learn how to install Rust, use Cargo to initialize a project, understand the default project layout, customize your `Cargo.toml`, and write your first Rust program.

More lessons will be added as the course progresses.

## 🔍 Overview

This repository demonstrates:

- Installing the Rust toolchain using platform-specific scripts.
- Creating a minimal binary application using `cargo new`.
- Understanding the structure and roles of files like `Cargo.toml` and `main.rs`.
- Executing a simple CLI program with `cargo run`.
- Customizing compilation profiles (`dev`, `release`) for better learning and performance tuning.

The project is intentionally minimal to highlight **best practices**, **toolchain usage**, and **code clarity**.

## 📝 Getting Started

### Prerequisites

You’ll need:

- A recent version of Rust (via [rustup](https://rustup.rs/))
- Bash (Linux/macOS) or PowerShell (Windows)
- Git (for cloning the repo)

To install Rust easily, use the OS-specific scripts provided in the lesson or follow [the official guide](https://www.rust-lang.org/tools/install).

### Clone & Compile

```bash
git clone https://github.com/r8vnhill/echo-app-rust.git
cd echo-app-rust
cargo run
````

You should see:

```text
Even the darkest night will end and the sun will rise.
```

## 🤝 Contributing

This is an educational project and not intended for production use — but contributions are welcome!

### How to Contribute

1. [Open an issue](https://github.com/r8vnhill/echo-app-rust/issues) to suggest improvements or report errors.
2. Follow the [Code of Conduct](./CODE_OF_CONDUCT.md).
3. Fork the repo and submit a pull request.

Ideas for contributions:

* Improving comments or docstrings.
* Adding alternate examples (e.g., user input, command-line parsing).
* Translating or internationalizing examples.

## 🛡️ License

This code is released under the **[BSD 2-Clause License](./LICENSE)**.

You may use, adapt, and distribute it in educational and personal projects with attribution.

## 🌐 DIBS Website

The full course (*Diseño e Implementación de Bibliotecas de Software*) is available at:

👉 **[https://dibs.ravenhill.cl](https://dibs.ravenhill.cl)**

There you’ll find more lessons, slides, exercises, and supporting material (in Spanish).
