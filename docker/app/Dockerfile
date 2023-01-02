FROM ubuntu:latest

RUN apt-get update && apt-get install -y --no-install-recommends wget build-essential libreadline-dev \ 
libncursesw5-dev libssl-dev libsqlite3-dev libgdbm-dev libbz2-dev liblzma-dev zlib1g-dev uuid-dev libffi-dev libdb-dev vim

RUN wget --no-check-certificate https://www.python.org/ftp/python/3.11.1/Python-3.11.1.tgz \
&& tar -xf Python-3.11.1.tgz \
&& cd Python-3.11.1 \
&& ./configure --enable-optimizations\
&& make \
&& make install

RUN apt-get autoremove -y

WORKDIR /app
COPY ./docker/app/requirements.txt .

#必要なpythonパッケージをpipでインストール
RUN pip3 install --no-cache-dir --upgrade -r requirements.txt

