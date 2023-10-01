Cairo1 utilities i use

- Not all scripts are meant to be called standalone. Most are helper scripts.
- needs 'unbuffer' from 'expect' package to retrieve colors from cairo binaries

TODO:
1. `cairo-install-dependency` needs fixes
  - if repo contains `-`, replace when adding to cairo project toml
  - dont download again
  - git install submodules if needed

3. Update cairo compiler and set necessary files and config for development
  - `cairo-compiler-update`
  - replace `destination_folder` within script to install in specific location
4. Start new project
  - Cairo: `cairo-new <project-name>`
  - Starknet: `cairo-new --starknet <project-name>`
5. Dependency installation
  - `cairo-install-dependency <repo> [commit bash]`
  - managed using git submodules into a folder under root called `deps`
6. For Development
  - Cairo Project `cairo-watch`. 
  - To pass cairo args ex. `cairo-watch --filter <string>`
  - To view cairo prints `cairo-watch [cairo-args] --debug-print`
  - Starknet Project `starknet-watch`
  - For multiple starknet contracts. Change `Makefile` accordingly
  - TODO: unify make-commands scripts for above
  
