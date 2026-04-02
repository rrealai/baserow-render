FROM baserow/baserow:2.1.6

# Fix: Remove Caddy from supervisor - Render blocks setcap/exec on binaries.
# Caddy is not needed as Render handles TLS/routing externally.
# Traffic goes directly to webfrontend on port 10000.
COPY supervisor.conf /baserow/supervisor/supervisor.conf

# Copy render_env.sh so DISABLE_VOLUME_CHECK and Render vars are set
COPY deploy/render_env.sh /baserow/supervisor/env/render_env.sh
