#!/bin/bash

curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
python /tmp/get-pip.py
pip install ansible==$ANSIBLE_VERSION
rm -f /tmp/get-pip.py
