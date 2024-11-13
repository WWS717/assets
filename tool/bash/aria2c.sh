#! /bin/bash

if [ ! -x /usr/local/bin/aria2c ]; then
    echo "aria2c is not installed"
    exit 1
fi

if [ ! -d ~//Desktop/torrent ]; then
    mkdir ~//Desktop/torrent
fi

while :; do
    for i in $@; do
        MAGNET=false
	if [[ "$i" = magnet* ]]; then
	    MAGNET=true
	elif [ ! -f "$i" ]; then
	    echo "The file ('$i') is not given or does not exist"
	    exit 1
	fi
	if ! aria2c --hash-check-only=true "$i" &> /dev/null; then
	    aria2c "$i"
	    sleep 30m && kill -9 `pidof aria2c`
	else
	    echo "Torrent is downloaded!"
	fi
    done
done
