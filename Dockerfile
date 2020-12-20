FROM python:3.6.12-alpine3.12
LABEL mantainer="ResolveWang <resolvewang@foxmail.com>"

COPY . /haipproxy
WORKDIR /haipproxy
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
ENV ISDOCKER 1
RUN echo -e "https://mirrors.tuna.tsinghua.edu.cn/alpine/v3.12/main/\nhttps://mirrors.tuna.tsinghua.edu.cn/alpine/v3.12/community/" > /etc/apk/repositories\
  && apk upgrade --no-cache \
  && apk add --no-cache \
  squid \
  libxml2-dev \
  libxml2 \
  libxslt-dev \
  libxslt \
  libffi-dev \
  gcc musl-dev libxslt-dev libffi-dev libressl-dev\
  # python3-dev \
  && rm -rf /var/cache/* \
  && rm -rf /root/.cache/*\
  #RUN apt update
  #RUN apt install squid -yq
  && sed -i 's/http_access deny all/http_access allow all/g' /etc/squid/squid.conf && cp /etc/squid/squid.conf /etc/squid/squid.conf.backup\
  #RUN apt install python3 python3-pip -yq
  #RUN which python3|xargs -i ln -s {} /usr/bin/python
  #RUN which pip3|xargs -i ln -s {} /usr/bin/pip
  && pip3 install -i https://pypi.douban.com/simple/ -U pip && pip3 install -i https://pypi.douban.com/simple/ -r requirements.txt 
#CMD ['python3', 'crawler_booter.py', '--usage', 'crawler', 'common']
