## Description

This is a docker container using the perl tool "rifec" based on a ubuntu:trusty image. This comes in handy if you have a stable system like CentOS where even perl is outdated and doesn't support the syntax change introduced in perl 5.14

rifec is a perl server for the eyefi cards. We have an EyeFi connect X2 in use inside our hackerspace and wanted to transfer our images to our local nfs share. The original EyeFi-Tool uploads the images (shrug) to the "Cloud", where it's processed and submitted to e.g. a public FTP server. 

## Setup

```bash
$~ git clone https://github.com/schinken/docker-container.git
$~ cd docker-container/rifec
$~ docker -t build rifec .
```

or pull it directly from the docker repositry

```bash
docker pull schinken/rifec
```

## Running the container

```bash
docker run -v /mnt/yourIncomingDirection/:/mnt/pictures -e MACADDR="CA-ME-RA-MA-CA-DD-RE-SS" -e UPLOADKEY="youruploadkey" -p 59278:59278 -t rifec:latest
```

You can specify your own incoming directory, and run the container as often as you like in parallel


### Retrieve the uploadkey

Once you've setup the original software and connected your EyeFi SDCard to it, you can extract the uploadkey from 

```
C:\Documents and Settings\[User]\Application Data\Eye-Fi\Settings.xml
```


