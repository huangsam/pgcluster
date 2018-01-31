#!/bin/bash

docker build -f Dockerfile.pg --rm -t my/postgres:9.6 .
