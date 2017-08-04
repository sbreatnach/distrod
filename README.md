

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

# Target Configuration

Ubuntu Server 16.04 LTS is the known tested distro, though others may be supported without any changes.
Before running the playbook, ensure you can SSH to the target machine beforehand. For example:

    ssh 192.168.2.4

The bare minimum your target machine must have is Python:

    sudo apt install python

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

<<<<<<< HEAD
# Playbook Running

Once all configuration of the playbook and machine is done, you should be ready to run the playbook.
Create the inventory file based on what was needed to SSH to the target machine. For example, if my username is mpower and the IP address is 192.168.2.4, the inventory file should contain the following:

    [devbox]
    devbox ansible_ssh_host=192.168.2.4 ansible_ssh_port=22 ansible_ssh_user=mpower

`devbox` on the second line can be changed to whatever you want to name your host but can be left as is.

Armed with a valid inventory and vars file, you can now run the playbook on the target machine. Note that since we need a password to login as the mpower user and we need a password to get root access via sudo with this user, we use the `-k -K` options. In this example, the vars and inventory files are named testbed_vars.yml and testbed_inventory:

    ansible-playbook -b -e @testbed_vars.yml -i testbed_inventory -k -K playbook.yml

# TODO

* Add calendar display when clock is clicked
* Integrate clipboard viewer/manager
* Remove configuration from /etc/network/interfaces once Network Manager installed