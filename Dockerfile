FROM baserow/baserow:2.1.6

# Fix: Render blocks setcap syscall (seccomp profile).
# Caddy tries to run setcap on itself at startup - wrap it so setcap targets a shell script (fails silently).
RUN mv /usr/bin/caddy /usr/bin/caddy.real && \
    cp /bin/sh /usr/bin/caddy-wrapper && \
    cat > /usr/bin/caddy << 'EOF'
#!/bin/sh
exec /usr/bin/caddy.real "$@"
EOF
RUN chmod +x /usr/bin/caddy

# Copy render_env.sh so DISABLE_VOLUME_CHECK and other Render vars are set
COPY deploy/render_env.sh /baserow/supervisor/env/render_env.sh
