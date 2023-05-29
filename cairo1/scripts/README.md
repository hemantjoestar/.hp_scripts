Cairo1 utilities i use

Not all scripts are meant to be called standalone. Most are helper scripts.

1. Update cairo compiler and set necessary files and config for development
  - `cairo-compiler-update`
  - replace `destination_folder` within script to install in specific location
2. Start new project
  - Cairo: `cairo-new <project-name>`
  - Starknet: `cairo-new --starknet <project-name>`
3. Dependency installation
  - `cairo-install-dependency <repo> [commit bash]`
  - managed using git submodules into a folder under root called `deps`
  
