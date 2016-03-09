#!/bin/bash

# Test struct commando
python /tests/test_structured_commando.py

# Test gnng
/tests/test_gnng.sh

# Run unit tests
TEST_ROOT=/etc/trigger/tests
TEST_DATA=$TEST_ROOT/data
export TRIGGER_SETTINGS="${TEST_DATA}/settings.py"
cd /etc/trigger
py.test -vv --strict
