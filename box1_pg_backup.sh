#!/bin/bash

while [ $( /sbin/zfs list -t snapshot|/bin/grep pg_dataset@pyznap |/usr/bin/awk {'print $1'}|/usr/bin/wc -l ) -gt 4 ]
  do
    /sbin/zfs destroy $(/sbin/zfs list -t snapshot|/bin/grep pg_dataset@pyznap |/usr/bin/awk {'print $1'}|/usr/bin/sort -n|/usr/bin/head -1)
  done
/usr/local/bin/pyznap snap --take
/bin/sleep 3s
/usr/local/bin/pyznap send -s pool/pg_dataset -d ssh:22:root@box2:pool/backup -i /root/.ssh/id_rsa --dest-auto-create