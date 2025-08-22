FROM debian:bullseye
WORKDIR /app
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && apt-get install -y git python3 python3-pip ffmpeg
COPY . .
RUN pip3 install -r requirements.txt
