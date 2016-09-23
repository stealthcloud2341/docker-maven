#!/bin/env bash
set -e

a=0.1.5

docker build -t stealthcloud2341/gitlab_ci_maven_runner:$a .

docker push stealthcloud2341/gitlab_ci_maven_runner:$a
