FROM baserow/baserow:2.1.6

# Fix: Replace Caddy with nginx for routing (Render blocks setcap needed by Caddy)
RUN apt-get update && apt-get install -y nginx && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy nginx config (uses $PORT env var set by Render, default 10000)
COPY nginx.conf /etc/nginx/nginx.conf

# Replace Caddy in supervisor with nginx
COPY supervisor.conf /baserow/supervisor/supervisor.conf

# Copy render_env.sh so DISABLE_VOLUME_CHECK and Render vars are set
COPY deploy/render_env.sh /baserow/supervisor/env/render_env.sh
