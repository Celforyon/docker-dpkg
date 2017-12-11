## Brief
Docker image with dpkg utilities to make Debian packages

## makedeb
Contains a `makedeb` script to generate Debian packages from a specific architecture

## environment variables
### Required
- `DIST`: the distribution codename (jessie, stretch, ...)
- `ARCH`: the architecture (amd64, i386, ...)

### Optional
- `PROJECT_NAME`: the project name, defaults to `${CI_PROJECT_NAME}` (defined by GitLab CI)
- `DEPLOY_DIR`: the deploy directory, defaults to `deploy`
- `PKG_ROOTDIR`: the package root directory (full path will be `${DEPLOY_DIR}/${PKG_ROOTDIR}`), defaults to `root_dir`
- `INSTALL_FILE`: the "install" file (see below) (full path will be `${DEPLOY_DIR}/${INSTALL_FILE}`), defaults to `install`
- `VERBOSE`: outputs more information if set to "1"
- `IGNORE_CHECKS`: set to "1" if you want failed checks to be ignored
- `SHELLCHECK_EXCLUDE_CODES`: set to a comma separated list of `shellcheck` codes (e.g.: SC1009,SC2086) to ignore in shellcheck reporting. See `man shellcheck`
- `DEPLOY`: set to 0 to disable the deployment (defaults to 1)

## root\_dir
This is the project's root directory, which will be used to build the `.deb` file using `dpkg-deb`

## install file
Each line of this file is read as:
`source:destination`
where `source` is the current file location (if relative, from the `makedeb` working directory, which is Git's root directory when running in GitLab CI) and `destination` is the *relative* destination path, from the package root directory

## output
the output will be into `/shared/$(mktemp -d)/${CI_PROJECT_NAME}\_${version}\_${DIST}\_${ARCH}.deb`

## Steps of makedeb
- check input variables (env)
- find `DEBIAN` directory
- process install file
- generate debian package
- run some checks (lintian, shellcheck)
- deploy into `/shared`
