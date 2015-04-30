# PHP Development box
A simple Ubuntu 14.04 Vagrant Box for developing web applications in PHP, provisioned with Ansible. This box uses a base image created by [PHPacker](https://github.com/kevinbungeneers/PHPacker) in order to cut down on the provisioning time.

## What's included?
* Nginx
* PHP 5.6
* Composer
* PostgreSQL 9.4
* Nodejs

## Requirements
* [VirtualBox](http://virtualbox.org)
* [Packer](http://packer.io)
* [Ansible](http://ansible.com)
* [Vagrant](http://vagrantup.com)
* [PHPacker](https://github.com/kevinbungeneers/PHPacker)

## Optional
* [Vagrant Hostsupdater](https://github.com/cogitatio/vagrant-hostsupdater)

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
