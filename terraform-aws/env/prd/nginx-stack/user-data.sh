#!/bin/bash

sudo yum update -y && sudo yum install docker -y && \
service docker start