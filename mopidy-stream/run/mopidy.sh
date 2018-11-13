#!/bin/bash

if [ -n "$SPOTIFY_PASSWORD" ]; then
    sed -i "s/password = demo/password = $SPOTIFY_PASSWORD/g" /etc/mopidy/mopidy.conf
fi

if [ -n "$SPOTIFY_USERNAME" ]; then
    sed -i "s/username = demo/username = $SPOTIFY_USERNAME/g" /etc/mopidy/mopidy.conf
fi

if [ -n "$SPOTIFY_ID" ]; then
    sed -i "s/client_id = demo/client_id = $SPOTIFY_ID/g" /etc/mopidy/mopidy.conf
fi

if [ -n "$SPOTIFY_SECRET" ]; then
    sed -i "s/client_secret = demo/client_secret = $SPOTIFY_SECRET/g" /etc/mopidy/mopidy.conf
fi

exec sudo -u mopidy mopidy --config /etc/mopidy/mopidy.conf
