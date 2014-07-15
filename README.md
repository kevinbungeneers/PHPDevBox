# Vagrant PHP Development box
A simple Ubuntu 14.04 Vagrant Box for developing web applications in PHP, provisioned with Ansible.

I tried to keep the provisioning of this box as simple as I could. This means that
there is no excessive use of variables and the roles used are only tested with Ubuntu 14.04.

## What's included?
* Nginx
* PHP 5.5
* Composer
* MySQL 5.6

## Requirements
[VirtualBox](http://www?virtualbox.org) and [Vagrant](http://www.vagrantup.com)

## Getting started
```bash
$ git clone https://github.com/kevinbungeneers/PhpDevBox.git && cd PhpDevBox
$ vagrant up
```
Executing the above will set you up with a fresh Ubuntu 14.04 install running the bare
essentials for developing PHP web applications.

## Configuring
Configuring a role can be done by editing its respective variable file. Each role
has it's own defaults in `provisioning/{role}/defaults/main.yml` which are overwritten by the ones
defined in `provisioning/variables/{role}.yml`
