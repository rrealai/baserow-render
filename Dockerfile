FROM baserow/baserow:2.1.6

# Fix: Render blocks setcap (seccomp). Wrap caddy binary so setcap fails silently.
RUN mv /usr/bin/caddy /usr/bin/caddy.real
RUN echo '#!/bin/sh' > /usr/bin/caddy \n    && echo 'exec /usr/bin/caddy.real "$@"' >> /usr/bin/caddy \n    && chmod +x /usr/bin/caddy

# Copy render_env.sh so DISABLE_VOLUME_CHECK and Render vars are set
COPY deploy/render_env.sh /baserow/supervisor/env/render_env.sh
