# DistroD

# Overview + Philosophy

My own homebrewed Ansible playbooks for provisioning a **usable**,
**ultra stable** Linux installation. My goals with this are, above all,
completely predictability and stability. Hence, using Openbox as the window
manager and avoiding, where possible, extra layers of "user-friendliness". I
have experienced enough issues with systems like iBus and GNOME Shell where
some shoddy bug ruins my day. Instead I aimed for using the lowest-level, most
stable systems.

This installation is unashamedly for me, though it's possible other people
might find it useful. All the configurations and applications chosen are for a
software developer who works in the terminal and wants the OS to get out of my
way. It's stripped down to the near-bare-bones but has some modern niceties,
like a fancy application launcher, automatic USB drive mounting, night light etc.

# Install

## Ubuntu Linux

Works on Xenial:

    sudo apt-get install python3-pip sshpass
    sudo pip3 install ansible>=2.9.7

# Ansible Configuration

All Ansible role pre-requisites for DistroD should be installed initially:

    ansible-galaxy install -r requirements.yml

# Target Configuration

**Debian Buster** is the targeted base distro.
Before running the playbook, ensure you can SSH to the target machine
beforehand. For example:

    ssh 192.168.2.4

The bare minimum your target machine must have is Python3:

    sudo apt install python3

# Playbook Configuration

There are a number of hook points in the Ansible roles that are designed to be
configurable. These should be overridden using the standard Ansible approach of
specifying extra variable files. The following describes the most important configuration options.

## User

By default, the playbook creates no users and updates existing standard users.
Extra users may be created. Unless specified otherwise, every user configured will, by
default, be assigned the password `vagrant`.
Users can be overridden in your local vars file. For example, the following
generates a single user named Max Power:

    users:
      - username: mpower
        shell: /bin/bash
        name: Max Power
        password: <big_long_alphanumeric_value>
        sudoer: true

Note that the value of password is crypted in the format Ansible requires.
See [Ansible's documentation](http://docs.ansible.com/ansible/latest/faq.html#how-do-i-generate-crypted-passwords-for-the-user-module)
for how to create a crypted password value.

## High DPI Support

High DPI support for all displays can be enabled with a few settings.

The following sets a DPI of 168 (175% scaling) with additional tweaks
and global settings for various applications:
```yaml
display:
  dpi: 168
  scaling:
    gdk_scale: 2
    gdk_dpi_scale: 0.5
    qt_auto_screen_scale_factor: 1
openbox:
  panel:
    width: 100
    height: 42
    icon_size: 40
    max_task_width: 250
```

## Device Packages

Any packages that are required for your hardware can be set with this variable.
For example, installing Broadcom and AMD-specific packages:

    openbox:
      device_packages:
        - firmware-b43-installer
        - amd64-microcode

# Playbook Running

Once all configuration of the playbook and machine is done, you should be ready
to run the playbook.
Create the inventory file based on what was needed to SSH to the target machine.
For example, if my username is mpower and the IP address is 192.168.2.4, the
inventory file should contain the following:

    [devbox]
    devbox ansible_ssh_host=192.168.2.4 ansible_ssh_port=22 ansible_ssh_user=mpower

`devbox` on the second line can be changed to whatever you want to name your
host but can be left as is.

Armed with a valid inventory and vars file, you can now run the playbook on the
target machine. Note that since we need a password to login as the mpower user
and we need a password to get root access via sudo with this user, we use
the `-k -K` options. In this example, the vars and inventory files are named
testbed_vars.yml and testbed_inventory:

    ansible-playbook -b -e @testbed_vars.yml -i testbed_inventory -k -K playbook.yml

# TODO

* Dynamic monitor and resolution detection
* Configure fstab based on partitions specified
* Use systemd for daemons to enable automatic restarting on crashes
* VNC server