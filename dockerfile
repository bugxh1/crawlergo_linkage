FROM ubuntu:16.04
RUN apt-get update && apt-get install -y wget unzip git \
&& git clone --depth=1 https://github.com/bugxh1/crawlergo_x_XRAY.git 
WORKDIR /crawlergo_x_XRAY/
RUN rm -rf crawlergo && pip3 install -r requirements.txt && wget https://storage.googleapis.com/chromium-browser-snapshots/Linux_x64/706915/chrome-linux.zip \
https://github.com/0Kee-Team/crawlergo/releases/download/v0.4.0/crawlergo_linux_amd64.zip \
&& unzip chrome-linux.zip && unzip crawlergo_linux_amd64.zip \
&& rm -rf chrome-linux.zip crawlergo_linux_amd64.zip
ENTRYPOINT ["python","launcher_new.py"]