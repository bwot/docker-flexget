#!/bin/sh
set -e

TZ=${TZ:-"UTC"}
FLEXROOT="/flexget"
FLEX_GID=${FLEX_GID:-""}
FLEX_UID=${FLEX_UID:-""}
LOGLEVEL=${LOGLEVEL:-"info"}

# runs on startup as root 
if [ "$(id -u)" = '0' ]; then
  if [ ! -f /etc/timezone ]; then
    echo "$TZ" > /etc/timezone
    cp "/usr/share/zoneinfo/$TZ" /etc/localtime
  fi

  if [ "$(grep -c "^flexget:" /etc/passwd)" = '0' ]; then
    if [ "$FLEX_GID" != "" ]; then
      echo "Creating group with GID: $FLEX_GID"
      addgroup -S flexget -g "$FLEX_GID"
    else
      addgroup -S flexget
    fi

    if [ "$FLEX_UID" != "" ]; then
      echo "Creating user with UID: $FLEX_UID"
      adduser -D -s /bin/sh -u "$FLEX_UID" -G flexget -S flexget
    else
      adduser -D -s /bin/sh -G flexget -S flexget
    fi
  fi

	if [ ! -d "$FLEXROOT" ]; then
		mkdir "$FLEXROOT"
	fi

  chown -R flexget:flexget "$FLEXROOT" > /dev/null 2>&1 || true
  chmod 700 "$FLEXROOT"

  su-exec flexget:flexget /entrypoint.sh "$@"; exit
fi

# --- non root below ---

if [ ! -d "$HOME/.flexget" ]; then
  ln -s "$FLEXROOT" "$HOME/.flexget"
fi

# override
if [ "$#" -gt 0 ]; then
  exec "$@"
fi

if [ ! -f "$FLEXROOT/config.yml" ]; then
  (>&2 echo "Error: config.yml requred but not found at $FLEXROOT/config.yml")
  exit 1
fi

umask 013

exec flexget --loglevel "$LOGLEVEL" daemon start
