#!/bin/bash

/usr/bin/Xvfb :99 -screen 0 1280x1024x24 -noreset -nolisten tcp &
sleep 2
xhost +local:all
exec /usr/bin/screamingfrogseospider "$@"
