FROM sualex/debian-ssh:jessie-slim
# Install packages
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        locales \
        apt-utils \
        build-essential \
        python \
        ca-certificates \
        curl \
        git \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && localedef -i en_US -c -f UTF-8 en_US.UTF-8
#
ENV LANG en_US.utf8
# use non-root user for meteor
USER  docker
RUN   curl https://install.meteor.com/ | sh
USER  root
