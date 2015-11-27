FROM ubuntu:trusty

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates nginx && \
    rm -rf /var/lib/apt/lists/* && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

COPY site-https /etc/nginx/sites-available/site-https

RUN ln -s  /etc/nginx/sites-available/site-https /etc/nginx/sites-enabled/site-https

EXPOSE 80 443
VOLUME ["/var/cache/nginx"]

CMD ["nginx", "-g", "daemon off;"]
