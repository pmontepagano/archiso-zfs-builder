FROM archlinux/base:latest

RUN pacman -Sy --noconfirm \
    git \
    file \
    archiso \
    && pacman -Scc --noconfirm

RUN cp -r /usr/share/archiso/configs/releng/ /archiso

#ENV ARCHISO_INSTALL_DIRECTORY="arch"
#ENV ARCHISO_WORK_DIRECTORY="/archiso/work"
ENV ARCHISO_OUTPUT_DIRECTORY="/tmp/build_output"

WORKDIR /archiso

COPY default_build_vars /root/default_build_vars
COPY clone-and-build.sh /root/clone-and-build.sh

CMD ["/bin/sh", "/root/clone-and-build.sh"]
