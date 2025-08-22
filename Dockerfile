FROM python:3.9-slim-bullseye
WORKDIR /app
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get install -y git python3 python3-pip ffmpeg supervisor \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
