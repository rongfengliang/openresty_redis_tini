FROM openresty/openresty:alpine
ENV TINI_VERSION v0.18.0
RUN apk add --update \
    &&  apk add redis \
    &&  apk add --no-cache tini
ADD entrypoint.sh /entrypoint.sh
COPY redis.conf /redis.conf
COPY nginx.conf usr/local/openresty/nginx/conf/
ENV PATH=$PATH:/usr/bin
EXPOSE 6379
EXPOSE 80
ENTRYPOINT ["/sbin/tini","-s", "--", "/entrypoint.sh"]

