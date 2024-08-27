# MC Server
This repository includes 4 shell scripts and a python file. Each file is used for different purposes

## Table of Contents

- [Usage](#usage)
- [Contributors](#contributors)
- [License](#license)

## Usage
### backup.sh
  This file is used to backup your minecraft server daily. I personally advice you to setup a cron job every night that will run this script.
### monitor_minecraft.sh
  This file is used to monitor the server. If the server is not active, it will create a backup and proceed to start the server again. I personally initialize this script as a systemd service (a daemon thingies).
### profile_server.sh
  This file is used to monitor server metrics by using spark mod. So you will need to have the mod installed for it to work charmingly alright.
### startup.sh
  This file is just your ordinary startup script :D.
### read_player_data.py
  This file is used for checking your server player's data. The script will read the old data and the new data of the player. And convert it from bin to readable text. So you can purposely operates player data's by forwarding or backwarding the data using the saved backups.

## Contributors

- [Muhammad Rafif Tri Risqullah](https://github.com/zeon-kun)

## License

This project is non-licensed and open source. If you are interested to develop this into something greater - let us know !
