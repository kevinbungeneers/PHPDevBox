#!/usr/bin/env bash

# Setup Ansible for Local Use and Run
sudo ansible-playbook /vagrant/provisioning/site.yml --connection=local