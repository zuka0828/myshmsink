#!/bin/bash -e

# Download the video file:
# wget http://linode.boundarydevices.com/videos/trailer_1080p_h264_mp3.avi
VIDEO=trailer_1080p_h264_mp3.avi

DEBUG="--gst-debug=shmsink:TRACE"

. common.sh

if [ "${TARGET}" = "pc" ]; then
	DECODE="avdec_h264"
else
	DECODE="v4l2h264dec capture-io-mode=dmabuf"
fi

rm -f ./socket

gst-launch-1.0 ${DEBUG} -v filesrc location=${VIDEO} ! \
	avidemux ! h264parse ! ${DECODE} ! \
	shmsink socket-path=./socket shm-size=${SHM_SIZE_MB}000000 wait-for-connection=true
