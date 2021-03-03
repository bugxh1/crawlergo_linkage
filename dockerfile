FROM ubuntu:16.04
RUN apt-get update && apt-get install -y wget unzip git python3-pip \
&& mkdir crawlergo_linkage
WORKDIR /crawlergo_linkage/
RUN wget https://storage.googleapis.com/chromium-browser-snapshots/Linux_x64/706915/chrome-linux.zip \
https://github.com/0Kee-Team/crawlergo/releases/download/v0.4.0/crawlergo_linux_amd64.zip \
https://raw.githubusercontent.com/bugxh1/crawlergo_linkage/main/requirements.txt \
https://raw.githubusercontent.com/bugxh1/crawlergo_linkage/main/craw_d.py \
&& pip3 install -r requirements.txt \
&& unzip chrome-linux.zip \
&& unzip crawlergo_linux_amd64.zip \
&& rm -rf chrome-linux.zip crawlergo_linux_amd64.zip
ENTRYPOINT ["python3","craw_d.py"]
