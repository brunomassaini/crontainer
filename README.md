# CRONtainer

Simple container with `awscli` and `kubectl` installed that run cron scripts

## How to use

You can deploy wherever you want but to test it locally you can follow these two steps:

```bash
## Build de image
docker build -t crontainer .

## Runn the container locally as a daemon
docker run -it -d crontainer
```

## Create new crons

```
├── Dockerfile
├── README.md
├── crontab
├── entrypoint.sh
└── scripts
    └── tools
        ├── cron_log.sh
        └── supervisor.conf
```

To create and add new crons just add the scripts to `scripts` folder
(Make sure the scripts are executable)

After that add the new script to `crontab` file so cron will execute it

## Check if it's working

By default the CRONtainer already comes with a simple script that runs every minute:
`/scripts/tools/cron_log.sh`

You should start seeing the logs on `/var/log/scripts/cron.log` after two minutes the container is running
