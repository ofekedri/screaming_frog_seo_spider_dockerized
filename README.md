# Dockerized Screaming Frog SEO Spider
## Run Screaming Frog cli in docker container
- Based on Ubuntu 20.04
- Launches the X virtual frame buffer (Xvfb) which emulates an X11 display (For Screamingfrog's embeded browser working)

## Building
- Copy your licence.txt to current directory
- run `docker build -t screamingfrog .`

## Usage
Need to add license file (licence.txt) to existing folder.
Need to create folder for mount
```sh
mkdir container
```


Example:

```sh
docker run --rm \
-v ${PWD}/container:/root/output \
-v ${PWD}/licence.txt:/root/.ScreamingFrogSEOSpider/licence.txt \
screamingfrog:ubuntu2004 \
--crawl https://google.com \
--headless \
--output-folder /root/output \
--save-crawl --timestamped-output --export-format csv \
--overwrite \
--export-tabs "Internal:All,Response Codes:Client Error (4xx)"
```
