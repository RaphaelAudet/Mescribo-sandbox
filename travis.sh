#!/bin/bash

set -xeu

./export-model.sh
./push.sh

exit 0
