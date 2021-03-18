#!/bin/sh

DEBUG="--gst-debug=shmsrc:TRACE,xvimagesink:TRACE"

# Capabilities must be set to the same as ones given by "videotestsrc"
gst-launch-1.0 ${DEBUG} -v shmsrc socket-path=./socket ! "video/x-raw,width=1920,height=1080,format=I420,framerate=25/1" ! xvimagesink
