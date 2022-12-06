#!/bin/bash
# Copyright (C) 2021 Intel Corporation
# SPDX-License-Identifier: BSD-3-Clause
# --- Get kernel parameters ---

rm /var/run/dbus.pid

dbus-daemon --system &
sleep 1

# --- Get kernel parameters ---
kernel_params=$(cat /proc/cmdline)

if [[ $kernel_params == *"wpassid="* ]]; then
       tmp="${kernel_params##*wpassid=}"
       SSID="${tmp%% *}"
fi

if [[ $kernel_params == *"wpapsk="* ]]; then
       tmp="${kernel_params##*wpapsk=}"
       PSK="${tmp%% *}"
fi

configdir="/var/lib/iwd"
configfile="/var/lib/iwd/$SSID.psk"
configfileTemplate="/opt/iwd.conf.template"

mkdir -p /var/lib/iwd

cp ${configfileTemplate} ${configfile}

if [ -d "/sys/class/ieee80211" ]; then
  if [ -n "${SSID}" ] && [ -n "${PSK}" ]; then
    cp ${configfileTemplate} ${configfile}

    sed -i -e "s/@@PSK@@/${PSK}/g" ${configfile}

    if [ -d "${configdir}" ] && [ -f "${configfile}" ]; then
      /usr/libexec/iwd -d
    fi
  fi
fi


