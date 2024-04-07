# Go Project Helpers
This is a respository of helper scripts to initialize Go projects in various common project layouts.

## Setup:
1. Clone this repository.
```bash
git clone https://github.com/bmshema/go_projectHelpers.git
```
2. Run `setup_config.sh`. This will establish environment variables for your `WORKDIR` (your workspace for go projects) and `DOMAIN` (your domain) to be used by the helper scripts.
3. Run the appropriate helper script for your project.
   - Each helper script requires a project name arguement.
  ```bash
Usage: ./go_cobra.sh -n NAME [-d DOMAIN]

Options:
  -d DOMAIN    The project repo domain. (If different than what was set globally)
  -n NAME      The project name. This option is required.

Examples:
  ./go_cobra.sh -n mycliapp
  ./go_cobra.sh -n mycliapp -d mydomain.com
  ```

---
## Helpers:
### go_cobra:
Initalizes a Go project with Cobra CLI dependency in the following layout...
```bash
.
├── main.go
├── go.mod
├── go.sum
├── cmd
│  └── projectname
│    └── root.go
└── pkg
  └── projectname
    └── projectname.go
```
