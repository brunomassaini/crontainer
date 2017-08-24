#!/bin/bash

# As cron runs without any environment variable, this command will import all environment
# variables file and run it on every cronjob run
printenv | sed 's/^\(.*\)$/export \1/g' > /root/env_vars.sh
chmod +x /root/env_vars.sh
