- curl -L -o /path/to/destination/filename https://raw.githubusercontent.com/user/repo/commit_hash/filename

SubModules
- git submodule add https://github.com/user/external_repo.git path/to/submodule

When working with submodules, remember to keep them up-to-date by running
- git submodule update --remote

Checkout the submodule to the desired commit hash, if needed
- git checkout commit_hash

Navigate back
- git add .gitmodules path/to/submodule

To Stage and commit the submodule changes
- git commit -m "Add external_repo as a submodule"
- git push

If the external repository is included as a submodule within your main repository
- git clone --recurse-submodules https://github.com/user/main_repo.git

- 
