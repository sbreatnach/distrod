# Install

## Ubuntu Linux

Works on Xenial:

    sudo apt-get install vagrant virtualbox python-pip libffi-dev libssl-dev
    sudo pip install ansible

# Ansible Configuration

    sudo ansible-galaxy install -r requirements.yml

# Vagrant Testing

    vagrant up
    ansible-playbook -b -u vagrant --private-key .vagrant/machines/default/virtualbox/private_key -i inventory playbook.yml