#!/bin/env bash
set -e

a=0.9.6

docker build -t diamond29/packer:$a .

docker push diamond29/packer:$a
