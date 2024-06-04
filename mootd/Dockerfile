# Use Alpine Linux as the base image
FROM alpine:30.20.0

# Install packages
RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk update && \
    apk add --no-cache cowsay@testing fortune dcron

# Copy binaries
COPY ./bin/api ./bin/renew /root/bin/
RUN chmod +x /root/bin/*

# Append Cron job
RUN echo -e '0 0 * * * /root/mootd.sh\n' | crontab -u root -

# Expose HTTP port
EXPOSE 80

# Entrypoint configuration
ENTRYPOINT ["/root/bin/api"]