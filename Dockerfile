FROM inikolaev/alpine-jdk-ant

RUN export GDRIVE_URL='https://docs.google.com/uc?id=0B3X9GlR6EmbnQ0FtZmJJUXEyRTA&export=download' \
        && wget "${GDRIVE_URL}" -O /usr/local/bin/gdrive \
        && chmod +x /usr/local/bin/gdrive

RUN apk add --update zip

RUN apk --update add --no-cache openssl wget


