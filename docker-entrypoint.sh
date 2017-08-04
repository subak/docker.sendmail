#!/usr/bin/env bash

if [ -n "${SSMTP_CONF}" ]; then
  echo "${SSMTP_CONF}" > /etc/ssmtp/ssmtp.conf
fi

incrond --foreground