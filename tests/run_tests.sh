#!/bin/bash

# Run unit tests
/etc/trigger/unit_test.sh

# Test struct commando
python /tests/test_structured_commando.py

# Test gnng
/tests/test_gnng.sh
