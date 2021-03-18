#!/bin/bash -e

DEBUG="--gst-debug=shmsrc:TRACE,xvimagesink:TRACE"

. common.sh

if [ "${TARGET}" = "pc" ]; then
	FORMAT="I420"
	SINK="xvimagesink"
else
	FORMAT="YUY2"
	SINK="kmssink connector-id=54 plane-id=31"
fi

# Capabilities must be set to the same as the input video
gst-launch-1.0 ${DEBUG} -v shmsrc socket-path=./socket ! \
	"video/x-raw,width=1920,height=1080,format=${FORMAT},framerate=25/1" ! \
	${SINK}
