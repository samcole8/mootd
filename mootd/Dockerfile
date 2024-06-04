# Use Alpine Linux as the base image
FROM alpine:30.20.0

# Copy binaries
COPY ./bin/api ./bin/renew.sh /usr/local/bin/

# Make configurations
RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk update && \
    apk add --no-cache cowsay@testing fortune dcron && \
    chmod +x /usr/local/bin/api /usr/local/bin/renew.sh && \
    echo -e '0 0 * * * /usr/local/bin/renew.sh\n' | crontab -u root -

# Expose HTTP port
EXPOSE 80

# Entrypoint configuration
ENTRYPOINT ["/usr/local/bin/api"]