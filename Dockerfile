FROM baserow/baserow:2.1.6

RUN apt-get update \
    && apt-get remove -y postgresql postgresql-contrib redis-server \
    && apt-get install -y nginx \
    && apt-get clean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

COPY deploy/render_env.sh /baserow/supervisor/env/render_env.sh
COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisor.conf /baserow/supervisor/supervisor.conf
