#!/bin/bash
# Lab Setup Script
git clone https://github.com/esolace88/Staging.git
mkdir terraformk8s
mv Staging/*.tf terraformk8s/
rm -rf setup.sh
rm -rf Staging
