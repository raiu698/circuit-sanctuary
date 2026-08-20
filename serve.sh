#!/bin/sh
# Serves the site on http://localhost:8899
# Public URL: run `tailscale funnel 8899` in a second terminal (see README).
cd "$(dirname "$0")" || exit 1
echo "Circuit Sanctuary -> http://localhost:8899  (Ctrl-C to stop)"
exec python3 -m http.server 8899 --bind 127.0.0.1
