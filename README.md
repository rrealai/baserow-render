# baserow-render

Minimal Baserow deployment for Render.com with Caddy fix.

## What this does

Render.com blocks `setcap` via seccomp, which prevents Caddy from starting inside the
official Baserow Docker image. This repo patches that line out before the container runs.

## Updating Baserow version

Edit the `FROM` line in `Dockerfile`:

```dockerfile
FROM baserow/baserow:X.X.X  # change version here
```

## Render settings

- **Repository**: `https://github.com/rrealai/baserow-render`
- **Branch**: `main`
- **Dockerfile path**: `./Dockerfile`
- **Docker context**: `.`
