#!/bin/bash
# Lab Setup Script
wget https://raw.githubusercontent.com/esolace88/Staging/main/providers.tf
mkdir terraformk8s
mv providers.tf terraformk8s/
rm -rf lab_7_setup.sh
