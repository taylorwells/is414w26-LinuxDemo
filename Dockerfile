FROM debian:trixie-slim

# Debian slim images exclude docs/manpages by default; remove that behavior
RUN rm -f /etc/dpkg/dpkg.cfg.d/docker

RUN apt-get update && apt-get install -y \
    openssh-server \
    sudo \
    bash \
    dos2unix \
    bzip2 \
    file \
    man-db manpages \
    cron \
    nano \
    locales \
    && rm -rf /var/lib/apt/lists/*

RUN sed -i 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
    && locale-gen

ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

RUN mkdir -p /run/sshd

RUN useradd -m -s /bin/bash rootkit && \
    echo "rootkit:rootkit" | chpasswd && \
    usermod -aG sudo rootkit

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]