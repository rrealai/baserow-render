FROM baserow/baserow:develop-latest

RUN apt-get update \
    && apt-get remove -y postgresql postgresql-contrib redis-server \
    && apt-get clean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

COPY deploy/render_env.sh /baserow/supervisor/env/render_env.sh
