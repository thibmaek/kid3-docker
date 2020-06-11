FROM jlesage/baseimage-gui:ubuntu-18.04

RUN set -x && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        chromium-browser \
        fonts-takao \
        fonts-takao-mincho \
        locales \
        software-properties-common \
        wget \
        ca-certificates \
        xdg-utils \
        && \
    echo "========== Install Picard ==========" && \
    add-apt-repository -y ppa:ufleisch/kid3 && \
    apt-get update && \
    apt-get install -y \
        kid3 kid3-cli \
        && \
    echo "========== Update OpenBox Config ==========" && \
    sed -i 's/<application type="normal">/<application type="normal" title="Kid3">/' /etc/xdg/openbox/rc.xml && \
    sed -i '/<decor>no<\/decor>/d' /etc/xdg/openbox/rc.xml && \
    echo "========== Final Config ==========" && \
    locale-gen en_US.UTF-8 && \
    mkdir -p /tmp/run/user/app && \
    chmod 0700 /tmp/run/user/app && \
    sed -i 's/Exec=chromium-browser/Exec=chromium-browser --no-sandbox/g' /usr/share/applications/chromium-browser.desktop && \
    echo "========== Clean-up ==========" && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

COPY start.sh /startapp.sh

ENV APP_NAME="Kid3" \
    LC_ALL="en_US.UTF-8" \
    LANG="en_US.UTF-8" \
    LANGUAGE="en_US.UTF-8"
