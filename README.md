## Building the image

`docker build . -t archiso-builder:latest`

## Usage

To build the default baseline image you can simply execute the image: `docker run --privileged --rm -t archiso-builder`

To capture the output you should mount the `build_output`-path to a docker volume.

If you want to build a custom archiso project you can mount your files to `/archiso` where the `build.sh` will be executed with the given environmental values as documented below.

### Full example

With the following command you can build an archiso project called *rescue* in the current working directory and store the resulting image in a directory called *output*.

`docker run --privileged --rm -tv "${pwd}/output:/tmp/build_output" -v "${pwd}/rescue:/archiso" archiso-build`

## Environment Variables
| Key | Default Value |
| --- | ------------- |
| ARCHISO_SOURCE_REPOSITORY | <undefined> |
| ARCHISO_NAME | archlinux |
| ARCHISO_VERSION | latest |
| ARCHISO_LABEL | ARCH |
| ARCHISO_PUBLISHER | Arch Linux <http://www.archlinux.org> |
| ARCHISO_APPLICATION_NAME | Arch Linux Live/Rescue CD |
| ARCHISO_OUTPUT_DIRECTORY | /tmp/build_output |
