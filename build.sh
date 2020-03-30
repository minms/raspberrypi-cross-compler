#!/bin/bash

docker system prune -f
docker build -t cross-compler .