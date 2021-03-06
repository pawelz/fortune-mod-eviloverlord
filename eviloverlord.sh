#!/bin/sh -e

# This program is free software. It comes without any warranty, to
# the extent permitted by applicable law. You can redistribute it
# and/or modify it under the terms of the Do What The Fuck You Want
# To Public License, Version 2, as published by Sam Hocevar. See
# http://sam.zoy.org/wtfpl/COPYING for more details.

# Copyright (c) by Paweł Zuzelski <pawelz@pld-linux.org>

# eviloverlord fortunes are distributable. See COPYING for details.

BASEURL="http://www.eviloverlord.com/lists/"
LISTS="{overlord.html,dungeon_a.html,dungeon_b.html}"

[ "$1" == "--clean" ] && rm -f $LISTS eviloverlord{,.dat} && exit 0

[ "$1" == "--download" ] && wget $BASEURL$LISTS && exit 0

for I in $LISTS; do awk -ve=0 '/\<\/OL\>/ {e=1} {if (e!=1) print}' $I; done \
  | grep '^<LI>.*<P>$' \
  | sed 's,<[^>]*>,,g' \
  | while read LINE; do
      echo "$LINE"
      echo "    -- Things I'd Do If I Ever Became An Evil Overlord"
      echo "%"
    done | fold -s -w78 > eviloverlord

strfile eviloverlord
