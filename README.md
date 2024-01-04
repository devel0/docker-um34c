# um34c docker container

## Features

- allow to connect um34c via bluetooth and log data in json format each 1 min ( tunable )

- for backend the [um34c](https://github.com/sebastianha/um34c) project was used

- startup parameters of the logger app.js can be customized in the `entrypoint.sh` file

## Motivations

through docker the um34c project can be built as it was on bionic version of ubuntu; actually I have a different distro and dependancies results in failing build.

## Prerequisites

- [docker-ce](https://docs.docker.com/engine/install/ubuntu/)

- know the device bluetooth address ( [scan devices](https://github.com/devel0/knowledge/blob/8d1ce9b58e8e8bf05f9075e6ff8fae48111c45a9/doc/bluetooth.md#scan-devices) )

- rfcomm from bluez package ( install with `apt install bluez` )

- jq for logging examples ( install with `apt install jq` )

## Build

```sh
./build.sh
```

## Run

```sh
sudo rfcomm bind 0 aa:bb:cc:dd:ee:ff
./run.sh
```

## Logging data

following and example to log voltages:

```sh
docker logs -n 1 -f um34c | while read line; do echo "$(echo $line | jq -r .voltage)V $(echo $line | jq -r .current)A $(echo $line | jq -r .record.power)mAh"; done
```
