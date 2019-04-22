#!/usr/bin/env sh
set -e

# Save torrents with full permissions
umask 0000

# Start flexget daemon
flexget -c /flexget/config.yml daemon start
