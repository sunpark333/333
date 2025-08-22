FROM python:3.9-slim-bullseye
WORKDIR /app
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y git python3 python3-pip ffmpeg
COPY . .
RUN pip3 install -r requirements.txt
