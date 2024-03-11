# Use Alpine Linux as the base image
FROM alpine:latest

# Install packages
RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk update && \
    apk add --no-cache cowsay@testing fortune nginx dcron

# Nginx configuration
COPY ./nginx.conf /etc/nginx/http.d/default.conf
RUN mkdir /srv/www && \
    touch /srv/www/index.html && \
    chown -R :nginx /srv/www && \
    chmod -R 750 /srv/www

# Bash file / dcron configuration
COPY ./mootd.sh /root/mootd.sh
RUN echo -e '0 0 * * * /root/mootd.sh\n' | crontab -u root -

# Expose HTTP port
EXPOSE 80

# Entrypoint configuration
RUN touch /root/new
COPY entrypoint.sh /root/entrypoint.sh
ENTRYPOINT ["/root/entrypoint.sh"]
