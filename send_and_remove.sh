#!/usr/bin/env bash

set -eu

path="${1}"

echo
TZ=Asia/Tokyo date -Iseconds >&2
echo ${path} >&2
head -n 10 ${path} >&2

sendmail -i -t < "${path}"
rm "${path}"