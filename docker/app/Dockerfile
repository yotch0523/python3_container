FROM ubuntu:latest

ARG USER_NAME
ARG GROUP_NAME
ARG UID
ARG GID
ARG USER_PASSWORD

RUN apt-get update && apt-get install -y --no-install-recommends wget binutils build-essential sysstat libreadline-dev \ 
libncursesw5-dev libssl-dev libsqlite3-dev libgdbm-dev libbz2-dev liblzma-dev zlib1g-dev uuid-dev libffi-dev libdb-dev vim \ 
fonts-takao fio qemu-kvm virt-manager libvirt-clients virtinst jq docker.io containerd libvirt-daemon-system sudo

RUN wget --no-check-certificate https://www.python.org/ftp/python/3.11.1/Python-3.11.1.tgz \
&& tar -xf Python-3.11.1.tgz \
&& cd Python-3.11.1 \
&& ./configure --enable-optimizations\
&& make \
&& make install

# add sudo user
RUN useradd -m -s /bin/bash -u $UID -g $GID -G sudo $USER_NAME && \
    echo $USER_NAME:$USER_PASSWORD | chpasswd && \
    echo "$USER_NAME   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN adduser `id -un` libvirt
RUN adduser `id -un` libvirt-qemu
RUN adduser `id -un` kvm

RUN apt-get autoremove -y

USER $USER_NAME

WORKDIR /app
COPY ./docker/app/requirements.txt .

COPY ./docker/app/config/vim/.vimrc /root/.vimrc
COPY ./docker/app/config/vim/.vim /root/.vim

# install python packages
RUN pip3 install --no-cache-dir --upgrade -r requirements.txt

