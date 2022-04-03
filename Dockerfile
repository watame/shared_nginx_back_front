FROM nginx:1.21.6-alpine

ENV LANG=ja_JP.UTF-8 \
    LC_CTYPE=ja_JP.UTF-8 \
    TZ=Asia/Tokyo

RUN apk update && \
    rm -f /etc/nginx/conf.d/*
ADD ./nginx.conf /etc/nginx/conf.d/nginx.conf

#-c以降の設定ファイルを指定して起動 daemon offでフォアグラウンドで起動
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
