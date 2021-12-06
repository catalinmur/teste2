#!/bin/bash
while [ $(zfs list -t snapshot|grep backup@pyznap |awk {'print $1'}|wc -l) -gt 4 ]
do
zfs destroy $(zfs list -t snapshot|grep backup@pyznap |awk {'print $1'}|sort -n|head -1)
done
