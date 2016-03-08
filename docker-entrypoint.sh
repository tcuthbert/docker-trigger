#!/bin/bash
set -eo pipefail

# Env
export TRIGGER_SETTINGS=/etc/trigger/conf/trigger_settings.py
export TACACSRC_KEYFILE=/etc/trigger/.tackf
export PYTHONPATH=/etc/trigger

# Add test device to hosts file
cat /tmp/hosts_to_inject >> /etc/hosts
#echo '10.20.1.10 r1.demo.local' >> /etc/hosts

# Fix tests perms
chown -R root:root /tests
chmod -R a+x /tests

# Situate trigger
cd /etc/trigger
cp /conf/trigger_settings.py ./conf/
cp /conf/netdevices.json ./
cp /conf/tackf .tackf
echo '# Saved by trigger.tacacsrc at 2016-03-06 00:54:11 UTC

cisco_uname_ = U7OHeek+j6M=
cisco_pwd_ = U7OHeek+j6M=' > /root/.tacacsrc

# Run redis
redis-server /etc/redis/redis.conf &

# Run tests
bash -c /tests/run_tests.sh

exec "$@"
