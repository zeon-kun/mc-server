# MC Server

This repository includes general information about minecraft server script and setup. Hope you find this helpful :).

## Table of Contents

- [Usage](#usage)
- [Screen](#screen)
- [Docker](#docker)

## Usage

In this repository there are two ways of setting up the mc server. Firstly the screen_setup directory in which it has the old scripts you needed (I used this for my 2023's private server too, works like a charm). And secondly the docker_setup directory which is the new one, and I am trying to make it as neat as possible (currently as of right now it has 1 script startup only, in near days I might add support for backups and etc.).

## Screen

### backup.sh

This file is used to backup your minecraft server daily. I personally advice you to setup a cron job every night that will run this script.

### monitor_minecraft.sh

This file is used to monitor the server. If the server is not active, it will create a backup and proceed to start the server again. I personally initialize this script as a systemd service (a daemon thingies).

### profile_server.sh

This file is used to monitor server metrics by using spark mod. So you will need to have the mod installed for it to work.

### startup.sh

This file is just your ordinary startup script :D.

### read_player_data.py

This file is used for checking your server player's data. The script will read the old data and the new data of the player. And convert it from bin to readable text. So you can purposely operates player data's by forwarding or backwarding the data using the saved backups.

## Docker

### Running it

Just clone, and then run docker build and docker run (you might want to use docker-compose for fallback options). I advice you to persist the minecraft data inside a volume in the host system.

```
docker run -d -p 25565:25565 -v /path/to/local/minecraft_data:/minecraft_fabric_server your-minecraft-image-name
```
