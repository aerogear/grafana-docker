#!/bin/bash -e

: "${GF_PATHS_CONFIG:=/etc/grafana/grafana.ini}"

if [ ! -d /var/lib/grafana/plugins ]; then
  mkdir -p /var/lib/grafana/plugins
fi

# Copying the plugin files to /tmp and then cp'ing them here seems to be the only way to get this to work
# using COPY commands in the Dockerfile didn't work

cp -r /tmp/grafana-piechart-panel/ /var/lib/grafana/plugins/grafana-piechart-panel
cp -r /tmp/grafana-worldmap-panel/ /var/lib/grafana/plugins/grafana-worldmap-panel

/usr/sbin/grafana-server --homepath=/usr/share/grafana --config="$GF_PATHS_CONFIG"