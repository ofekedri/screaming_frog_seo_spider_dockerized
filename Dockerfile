FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

#screamingfrogseospider dependencies (excluding wget and xvfb)
RUN apt update && \
apt install -y wget xvfb xdg-utils ttf-mscorefonts-installer fonts-wqy-zenhei libgconf-2-4 libgtk2.0-0 \
libnss3 libxss1 zenity libasound2 && \
rm -rf /var/lib/apt/lists/*

# Install seo spider (screamingfrog)
RUN wget https://download.screamingfrog.co.uk/products/seo-spider/screamingfrogseospider_16.7_all.deb && \
dpkg -i screamingfrogseospider_16.7_all.deb && \
rm screamingfrogseospider_16.7_all.deb

RUN apt-get update && apt install systemd -y

COPY xvfb.service /etc/systemd/system/xvfb.service 
RUN systemctl enable /etc/systemd/system/xvfb.service
RUN echo "export DISPLAY=:0" >> ~/.bashrc



RUN mkdir /root/.ScreamingFrogSEOSpider && \
touch /root/.ScreamingFrogSEOSpider/spider.config && \
echo 'eula.accepted=11' >> /root/.ScreamingFrogSEOSpider/spider.config

RUN mkdir /root/seo_spider_configuration && \
mkdir /root/seo_spider_configuration/volume && \
mkdir /root/seo_spider_configuration/configuration


ENTRYPOINT [ "/usr/bin/screamingfrogseospider"]

