FROM archlinux/base:latest

RUN pacman -Sy --noconfirm \
    git \
    file \
    archiso \
    && pacman -Scc --noconfirm

RUN cp -r /usr/share/archiso/configs/releng/ /archiso

ENV ARCHISO_NAME="archlinux"
ENV ARCHISO_VERSION="latest"
ENV ARCHISO_LABEL="ARCH"
ENV ARCHISO_PUBLISHER="Arch Linux <http://www.archlinux.org>"
ENV ARCHISO_APPLICATION_NAME="Arch Linux Live/Rescue CD"
#ENV ARCHISO_INSTALL_DIRECTORY="arch"
#ENV ARCHISO_WORK_DIRECTORY="/archiso/work"
ENV ARCHISO_OUTPUT_DIRECTORY="/tmp/build_output"

WORKDIR /archiso

CMD ["/bin/sh", "-c", "/bin/bash ./build.sh -N \"${ARCHISO_NAME}\" -V \"${ARCHISO_VERSION}\" -L \"${ARCHISO_LABEL}\" -P \"${ARCHISO_PUBLISHER}\" -A \"${ARCHISO_APPLICATION_NAME}\" -o \"${ARCHISO_OUTPUT_DIRECTORY}\""]
