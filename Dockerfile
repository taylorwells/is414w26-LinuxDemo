FROM debian:trixie-slim

RUN apt-get update && apt-get install -y \
    openssh-server \
    sudo \
    bash \
    dos2unix \
    bzip2 \
    file \
    man-db \
    cron \
    nano \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/sshd

RUN useradd -m -s /bin/bash rootkit && \
    echo "rootkit:rootkit" | chpasswd && \
    usermod -aG sudo rootkit

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]