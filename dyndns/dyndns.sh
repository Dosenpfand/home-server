#!/usr/bin/env bash
set -euo pipefail

: "${API_TOKEN:?API_TOKEN is required}"
: "${ZONE_NAME:?ZONE_NAME is required}"
: "${RECORD_NAME:?RECORD_NAME is required}"

LAST_IP=""

while true; do
  IP=$(curl -sf https://api4.ipify.org) && \
  if [[ "$IP" != "$LAST_IP" ]]; then
    curl -sf -X POST "https://api.hetzner.cloud/v1/zones/$ZONE_NAME/rrsets/$RECORD_NAME/A/actions/set_records" \
      -H "Authorization: Bearer $API_TOKEN" \
      -H "Content-Type: application/json" \
      -d "{\"records\":[{\"value\":\"$IP\"}]}" && LAST_IP="$IP"
  fi || true
  sleep "$INTERVAL"
done
