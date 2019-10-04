#!/bin/sh
while inotifywait -e modify . ; do
    make complete
done
 
