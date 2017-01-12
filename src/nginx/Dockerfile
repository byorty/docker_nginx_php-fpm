FROM alpine:edge

ARG DOMAIN
ENV DOMAIN=${DOMAIN}

RUN apk --update add \
    nginx \
    gettext

RUN rm -rf /var/cache/apk/*

COPY nginx.conf   /etc/nginx/nginx.conf
COPY default.tpl /etc/nginx/sites-enabled/default.tpl

RUN envsubst '\$DOMAIN' < /etc/nginx/sites-enabled/default.tpl > /etc/nginx/sites-enabled/default
RUN rm /etc/nginx/sites-enabled/default.tpl

VOLUME ["/var/log/nginx", "/app"]

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]