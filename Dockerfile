FROM baserow/baserow:2.1.6

# Fix: Render blocks setcap (seccomp restriction), skip it for Caddy
RUN sed -i "s/setcap cap_net_bind_service.*caddy/echo skip_setcap/g" \
    /baserow/supervisor/wrapper.sh || true
