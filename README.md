# Install

## Ubuntu Linux

Works on Xenial:

    sudo apt-get install vagrant virtualbox python-pip libffi-dev libssl-dev
    sudo pip install ansible==2.1.0

# Ansible Configuration

All Ansible role pre-requisites for DistroD should be installed initially:

    sudo ansible-galaxy install -r requirements.yml

# Vagrant Testing

This project comes with a Vagrant setup to test your configuration. Running the test is easy:

    vagrant up
    ansible-playbook -b -e @vm_vars.yml -u vagrant --private-key .vagrant/machines/default/virtualbox/private_key -i vm_inventory playbook.yml

# Playbook Configuration

There are a number of hook points in the Ansible roles that are designed to be configurable. These should be overridden using the standard Ansible approach of specifying extra variable files. For example, note that the ansible-playbook command above for Vagrant testing includes vm_vars.yml.

## User

By default, the playbook creates a single user with the username `vagrant` and password `vagrant`. Unless specified otherwise, every user configured will, by default, be assigned the password `vagrant`.
Users can be overridden in your local vars file. For example, the following generates a single user named Max Power:

    users:
      - username: mpower
        shell: /bin/bash
        name: Max Power
        password: <big_long_alphanumeric_value>
        sudoer: true

Note that the value of password is crypted in the format Ansible requires.
See [Ansible's documentation](http://docs.ansible.com/ansible/latest/faq.html#how-do-i-generate-crypted-passwords-for-the-user-module)
for how to create a crypted password value.
