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



RUN mkdir /root/.ScreamingFrogSEOSpider
RUN touch /root/.ScreamingFrogSEOSpider/spider.config

RUN echo 'eula.accepted=11' >> /root/.ScreamingFrogSEOSpider/spider.config

ENV DISPLAY :99

COPY start_screamingfrog.sh /root/start_screamingfrog.sh
RUN chmod a+x /root/start_screamingfrog.sh

ENTRYPOINT ["/root/start_screamingfrog.sh"]
