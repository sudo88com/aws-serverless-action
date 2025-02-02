#!/usr/bin/env bash

# This script is specifically designed for the GitHub Action.
# Running it outside of GitHub Actions may result in dependency issues. Use at your own risk.

set -o errexit -o pipefail

# GitHub Action Layer
function main() {
    echo "Running AWS Serverless Action"
    pwd
    ls -all
    echo "Using Serverless configuration file: ${SERVERLESS_FILE}"
    serverless deploy --config ${SERVERLESS_FILE}
}

if [ "$#" -eq 1 ]; then
    "$1"
else
    echo "Usage: $0 <function_name>" >&2
    exit 1
fi
