fix_dhcp_hack
=============

What can I say, despite all efforts to keep network interface device
names persistent, sometimes this does not work. You boot up a system
with a new kernel and somehow the device name changes. When doing Linux
kernel development we may sometimes not really care about the device name
change, even if it is a bug. Networking guys may care, but if your focus
is on another subsystem you really don't want to bother with this issue
and just want to get your network interfaces up. If you have a controlled
environment and you *know* all interfaces exposed other than loopback should
call DHCP this ansible role will solve those woes for you.

This hack is supposed to address for *careless*, *throw away* development
environments by essentially always requiring DHCP on all interfaces exposed
other than your loopback interface.

Requirements
------------

None.

Role Variables
--------------

  * enable_dhcp_hack: set to false by defaul, set this to true in your
    project if you really know and have vetted you can use this.

Dependencies
------------

None.

Example Playbook
----------------

Below is an example playbook task:

```
---
- hosts: all
  roles:
    - role: mcgrof.fix_dhcp_hack
```

For further examples refer to one of this role's users, the
[https://github.com/mcgrof/fw-kdevops](fw-kdevops) project or the
[https://github.com/mcgrof/kdevops](kdevops) project or the
[https://github.com/mcgrof/oscheck](oscheck) project from where
this code originally came from.

License
-------

GPLv2
