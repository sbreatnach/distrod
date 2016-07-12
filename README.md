# Install

## Ubuntu Linux

Works on Xenial:

    sudo apt-get install vagrant virtualbox python-pip libffi-dev libssl-dev
    sudo pip install ansible==2.1.0

# Ansible Configuration

    sudo ansible-galaxy install -r requirements.yml

# Vagrant Testing

    vagrant up
    ansible-playbook -b -e @vm_vars.yml -u vagrant --private-key .vagrant/machines/default/virtualbox/private_key -i vm_inventory playbook.yml

# TODO

* Configure login manager and X start script
* Create base menu
* Create base configuration
* Suspend / Shutdown commands
* Enable and test sound
* Theming and styling of login manager
* Theming and styling of X session