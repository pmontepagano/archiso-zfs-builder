## Building the image

`docker build . -t archiso-builder:latest`

## Usage

To build the default baseline image you can simply execute the image: `docker run --privileged --rm -t archiso-builder`

To capture the output you should mount the `build_output`-path to a docker volume.

If you want to build a custom archiso project you can either mount your files to `/archiso/source` or specify a git repository URI via the `ARCHISO_SOURCE_REPOSITORY` environmental variable. 

> Note that currently when using `ARCHISO_SOURCE_REPOSITORY` the build script will assume you're using `origin/master` as your branch and *will* hard reset the repository to remote `master` HEAD if the source directory is mounted with git information.

Then the `build.sh` will be executed with the given environmental values as documented below.

### Full example

With the following command you can build an archiso project called *rescue* in the current working directory and store the resulting image in a directory called *output*.

`docker run --privileged --rm -tv "${pwd}/output:/tmp/build_output" -v "${pwd}/rescue:/archiso" archiso-build`

## Build Variables

Build variables should be provided through a file called `build_vars` in the image sources. If this file isn't found, the default command will copy in defaults from `/root/default_build_vars` in the image.

| Key | Default Value | Comment |
| --- | ------------- | ------- |
| ARCHISO_NAME | archlinux | |
| ARCHISO_VERSION | $(date +%Y.%m.%d) | |
| ARCHISO_LABEL | ARCH_$(date +%Y%m) | |
| ARCHISO_PUBLISHER | Arch Linux <http://www.archlinux.org> | |
| ARCHISO_APPLICATION_NAME | Arch Linux Live/Rescue CD | |

## Environmental Variables

The following environmental variables define the behaviour of the build command.

| Key | Default Value | Comment |
| --- | ------------- | ------- |
| ARCHISO_SOURCE_REPOSITORY | <undefined> | Defining this variable will make the image clone a git repository as the source for the build. If the `source` directory is mounted or exists as a non-git directory with this defined the build will fail.
| ARCHISO_OUTPUT_DIRECTORY | /tmp/build_output |
