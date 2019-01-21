# mopidy-stream

This is a docker container which provides the latest mopidy release combined with a streaming server. The current version (0.19) sends EOS (End-of-Stream) if the track changes which closes the stream in icecast, mplayer, etc. 

This solution pipes the output through liquidsoap which then provides a http stream.

This is based on the work of "schinken" (https://github.com/schinken/docker-container/tree/master/mopidy-stream). I just adjusted some 
things and replaced the version of mopidy-spotify with an "on the fly self compiled" one.

## Setup

```bash
$~ git clone https://github.com/schinken/docker-container.git
$~ cd docker-container/mopidy-stream
$~ docker build -t mopidy-stream .
```

or pull it directly from the docker repository

```bash
docker pull galdan/mopidy-stream
```

## Running the container

```bash
docker run \
-e SPOTIFY_USERNAME=spotifyUser \
-e SPOTIFY_PASSWORD=spotifyPassword \
-e SPOTIFY_ID=spotifyPassword \
-e SPOTIFY_SECRET=spotifyPassword \
-p 6600:6600 \
-p 6680:6680 \
-p 8800:8800 \
-t \
galdan/mopidy-stream:latest
```

* Port 6600 provides the mpd interface
* On Port 6680 there's the webinterface "Mopidy-MusicBox-Webclient"
* Port 8800 provides the HTTP stream encoded as mp3-192
