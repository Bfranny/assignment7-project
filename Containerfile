FROM fedora:latest
RUN useradd collin
RUN dnf install -y httpd && dnf clean all
RUN mkdir /structure && chmod 777 /structure
RUN mkdir /structure/sync-work && chown sync:root /structure/sync-work
RUN mkdir /structure/nobody-work && chown nobody:nobody /structure/nobody-work
RUN mkdir -p /var/www/html \
    && echo "Containers are easy!" > /var/www/html/index.html
EXPOSE 80
ENTRYPOINT ["/usr/sbin/httpd", "-DFOREGROUND"]
