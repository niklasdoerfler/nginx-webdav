#!/bin/bash

# Change permission of mounted volume to be writable for everyone
chmod a+w "${EXCHANGE_VOLUME_PATH}"
