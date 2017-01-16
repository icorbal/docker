FROM frekele/docker-ant

ENV ANT_VERSION=1.10.0
ENV ANT_HOME=/opt/ant

#############
# Ant Contrib
#############

# Preparation
ENV ANT_CONTRIB_VERSION 1.0b2

# Installation

RUN cd /tmp \
        && wget http://kent.dl.sourceforge.net/project/ant-contrib/ant-contrib/ant-contrib-${ANT_CONTRIB_VERSION}/ant-contrib-${ANT_CONTRIB_VERSION}-bin.tar.gz \
        && tar -zxvf ant-contrib-${ANT_CONTRIB_VERSION}-bin.tar.gz \
        && cp ant-contrib/lib/ant-contrib.jar ${ANT_HOME}/lib \
        && rm -rf ant-contrib \
        && rm ant-contrib-${ANT_CONTRIB_VERSION}-bin.tar.gz \
        && unset ANT_CONTRIB_VERSION;

RUN set -ex \
        && apk add --no-cache --virtual .app-builddeps curl \
        && export GDRIVE_URL='https://docs.google.com/uc?id=0B3X9GlR6EmbnQ0FtZmJJUXEyRTA&export=download' \
        && export GDRIVE_SHA128=4fd8391b300cac45963e53da44dcfe68da08d843 \
        && curl -fSL "${GDRIVE_URL}" -o /usr/local/bin/gdrive \
        && chmod +x /usr/local/bin/gdrive \
        && apk del .app-builddeps

