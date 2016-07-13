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

* Base application list
* Create base Openbox menu
* Create base Openbox configuration: keyboard shortcuts, toolbar
* Logout / Suspend / Shutdown commands
* Enable and test sound
* Theming and styling of login manager
* Theming and styling of X session
* Auto-detect and configure multiple monitors
* Integrate conky with shortcut list and some sys monitors
* Integrate fancy application launcher
* Automatic mounting of plugged in devices
* Configure terminal emulator with correct fonts, settings, etc.
* Extended application list for apps not in repositories e.g. Intellij IDEA