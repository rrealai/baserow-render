FROM baserow/baserow:2.1.6

# Fix 1: Render blocks setcap (seccomp restriction), skip it for Caddy
RUN sed -i "s/setcap cap_net_bind_service.*caddy/echo skip_setcap/g" \
    /baserow/supervisor/wrapper.sh || true

# Fix 2: Copy render_env.sh so DISABLE_VOLUME_CHECK and other vars are set
COPY deploy/render_env.sh /baserow/supervisor/env/render_env.sh
