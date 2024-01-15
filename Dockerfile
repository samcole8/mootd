# Use Alpine Linux as the base image
FROM alpine:latest

# Install packages
RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk update
RUN apk add --no-cache cowsay@testing fortune nginx dcron

# Nginx configuration
COPY ./nginx.conf /etc/nginx/http.d/default.conf
RUN mkdir /srv/www
RUN touch /srv/www/index.html
RUN chown -R :nginx /srv/www
RUN chmod -R 750 /srv/www

# Bash file / dcron configuration
COPY ./motd.sh /root/motd.sh
RUN echo -e '0 * * * * /root/motd.sh\n' | crontab -u root -

# Expose HTTP port
expose 80

# Entrypoint configuration
RUN touch /root/new
COPY entrypoint.sh /root/entrypoint.sh
ENTRYPOINT ["/root/entrypoint.sh"]
