# Use Alpine Linux as the base image
FROM alpine:3.20.0

# Copy binaries
COPY ./bin/api ./bin/renew.sh /usr/local/bin/

# Make configurations
RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk update && \
    apk add --no-cache cowsay@testing fortune dcron && \
    chmod +x /usr/local/bin/api /usr/local/bin/renew.sh && \
    touch /srv/first_run /srv/mootd && \
    # Create restricted user
    addgroup api && \
    adduser -s /bin/nologin -D -G api api && \
    chown -R root:api /srv && \
    chmod -R 770 /srv && \
    chown root:api /usr/local/bin/api /usr/local/bin/renew.sh && \
    chmod 550 /usr/local/bin/api /usr/local/bin/renew.sh && \
    echo -e '0 0 * * * /usr/local/bin/renew.sh\n' | crontab -u api -

# Expose HTTP port
EXPOSE 80

USER api

# Entrypoint configuration
ENTRYPOINT ["/usr/local/bin/api"]