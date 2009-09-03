#!/bin/sh -e

BASEURL="http://www.eviloverlord.com/lists/"
LISTS="{overlord.html,dungeon_a.html,dungeon_b.html}"

[ "$1" == "--clean" ] && rm -f $LISTS eviloverlord{,.dat} && exit 0

[ "$1" == "--download" ] && wget $BASEURL$LISTS && exit 0

cat $LISTS | grep '^<LI>.*<P>$' \
  | sed 's,<[^>]*>,,g' \
  | while read LINE; do
      echo "$LINE"
      echo "    -- Things I'd Do If I Ever Became An Evil Overlord"
      echo "%"
    done >> eviloverlord

strfile eviloverlord
