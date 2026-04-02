FROM baserow/baserow:2.1.6

# Fix: Render blocks setcap syscall (seccomp). Caddy calls setcap on itself at startup.
# Solution: wrap the caddy binary to strip the setcap call using a shell wrapper.
RUN mv /usr/bin/caddy /usr/bin/caddy.real && \
    printf '#!/bin/sh
exec /usr/bin/caddy.real "$@"
' > /usr/bin/caddy && \
    chmod +x /usr/bin/caddy

# Also patch any wrapper scripts that might call setcap directly
RUN find /baserow -name "*.sh" -exec grep -l "setcap" {} \; | \
    xargs -r sed -i "s/setcap[^\n]*/echo skip_setcap/g" || true

# Copy render_env.sh so DISABLE_VOLUME_CHECK and other Render vars are set
COPY deploy/render_env.sh /baserow/supervisor/env/render_env.sh
