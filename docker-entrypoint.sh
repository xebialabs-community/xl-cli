#!/bin/sh
set -e
/usr/local/bin/wait-for $XL_DEPLOY -t 120
/usr/local/bin/wait-for $XL_RELEASE -t 120
/usr/local/bin/xl $@