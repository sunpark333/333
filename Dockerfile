FROM python:3.11-slim-bullseye
RUN mkdir /app && chmod 777 /app
WORKDIR /app
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y git python3 python3-pip ffmpeg && rm -rf /var/lib/apt/lists/*
COPY . .
RUN pip3 install --no-cache-dir -r requirements.txt
CMD gunicorn app:app --bind 0.0.0.0:10000 & python -m main
