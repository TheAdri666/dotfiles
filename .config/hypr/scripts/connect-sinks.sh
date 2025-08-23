#!/bin/bash

# Config
MAX_RETRIES=1
SLEEP_INTERVAL=2
WAIT_RETRIES=3
WAIT_DELAY=1

# Globals
declare -A port_found
some_link_failed=0

# List of required ports
ports=(
  "Speakers:monitor_FL"
  "Speakers:monitor_FR"
  "Sunshine:monitor_FL"
  "Sunshine:monitor_FR"
  "27G2G5:playback_FL"
  "27G2G5:playback_FR"
  "Razer Barracuda X:playback_FL"
  "Razer Barracuda X:playback_FR"
  "OnePlus Buds Pro 2:playback_FL"
  "OnePlus Buds Pro 2:playback_FR"
  "HDMI 2:playback_FL"
  "HDMI 2:playback_FR"
)

# List of links as source sink pairs
links=(
  "Sunshine:monitor_FL|Razer Barracuda X:playback_FL"
  "Sunshine:monitor_FR|Razer Barracuda X:playback_FR"
  "Sunshine:monitor_FL|OnePlus Buds Pro 2:playback_FL"
  "Sunshine:monitor_FR|OnePlus Buds Pro 2:playback_FR"
  "Speakers:monitor_FL|27G2G5:playback_FL"
  "Speakers:monitor_FR|27G2G5:playback_FR"
  "Speakers:monitor_FL|HDMI 2:playback_FL"
  "Speakers:monitor_FR|HDMI 2:playback_FR"
)

wait_for_port() {
  local port=$1
  local attempt=0

  until pw-cli ls Port | grep -q "$port"; do
    ((attempt++))
    if (( attempt > WAIT_RETRIES )); then
      echo "Timeout waiting for port '$port'"
      port_found["$port"]=0
      return 1
    fi
    echo "Waiting for port '$port' to appear... ($attempt/$WAIT_RETRIES)"
    sleep $WAIT_DELAY
  done

  port_found["$port"]=1
  return 0
}

wait_for_all_ports() {
  for port in "${ports[@]}"; do
    wait_for_port "$port"
  done
}

link_if_needed() {
  local source=$1
  local sink=$2

  if ! pw-link -l | grep -q "^${source} .*${sink}$"; then
    echo "Linking $source -> $sink"
    if ! pw-link "$source" "$sink"; then
      echo "Failed to link $source -> $sink"
      return 1
    fi
  else
    echo "Link $source -> $sink already exists, skipping."
  fi
  return 0
}

attempt_links() {
  local attempt=1

  while (( attempt <= MAX_RETRIES )); do
    echo "Attempt $attempt of $MAX_RETRIES to link PipeWire sinks..."
    local failed=0

    for pair in "${links[@]}"; do
      IFS="|" read -r source sink <<< "$pair"

      # Check both ports are present
      if [[ "${port_found["$source"]}" != "1" || "${port_found["$sink"]}" != "1" ]]; then
        echo "Skipping link $source -> $sink because one or both ports are missing."
        continue
      fi

      if ! pw-link -l | grep -q "^${source} .*${sink}$"; then
        # Link is missing; try to create it
        if ! pw-link "$source" "$sink"; then
          echo "Failed to create link $source -> $sink"
          ((failed++))
        fi
      else
        echo "Link $source -> $sink already exists, skipping."
      fi
    done

    if (( failed == 0 )); then
      echo "All required links created successfully."
      return 0
    else
      echo "$failed link(s) failed. Retrying in $SLEEP_INTERVAL seconds..."
      sleep $SLEEP_INTERVAL
    fi

    ((attempt++))
  done

  some_link_failed=$failed
  return 1
}

# Main
wait_for_all_ports
if attempt_links; then
  exit 0
fi

if (( some_link_failed > 0 )); then
  echo "Failed to create some new links after $MAX_RETRIES attempts."
  exit 1
else
  echo "No new links were needed or all were already present."
  exit 0
fi

