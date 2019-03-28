#!/bin/sh

mkfifo /tmp/mpd.fifo || true

udpsink() {
  setsid nc -kluvw -1 -q -1 127.0.0.1 -p 5555 > /tmp/mpd.fifo 2> /dev/null
}

udpsink &

exec "$@"

