# Brief
Docker image with dpkg utilities to make Debian packages

# makedeb
Contains a `makedeb` script to generate Debian packages from a specific architecture:

## environment variables
`DIST` to be set to the distribution codename (jessie, stretch, ...)
`ARCH` to be set to the architecture (amd64, i386, ...)

## files
`./build/deb`: files to install
`./debfiles`: list files to copy to ./build/deb, one per line as "from:to"
`./${DIST}/${ARCH}/DEBIAN` or `./${DIST}/DEBIAN` or `./DEBIAN`: the DEBIAN directory with at least the control file (where `Architecture:` and `Installed-Size:` lines are to be set but not to be defined)

## output
the output will be into `/shared/$(mktemp -d)/${CI_PROJECT_NAME}\_${version}\_${DIST}\_${ARCH}.deb`
