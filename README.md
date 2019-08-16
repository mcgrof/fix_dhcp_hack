fix_dhcp_hack
=============

What can I say, despite all efforts to keep network interface device
names persistent, sometimes this does not work. You boot up a system
with a new kernel and somehow the device name changes. When doing Linux
kernel development we may sometimes not really care about the device name
change, even if it is a bug, whether that be in userspace or kernelspace.

Networking guys may care, but if your focus is on another subsystem you *may*
not want to bother with this issue and just want to get your network interfaces
up. If you have a controlled environment and you *know* all interfaces exposed
other than loopback should call DHCP this ansible role will solve those woes
for you.

This hack is intended only to be used for *careless*, *throw away* development
environments by essentially always requiring DHCP on all interfaces exposed
other than your loopback interface.

The issue has been observed with debian testing as of August 16, 2019, and
then booting into linux-next next-20190816. Since only debian is known to
have this issue at this point, all other distros won't be affected if this
role is enabled for them.

How booting into a new kernel could have exposed this issue is beyond me at
this point. If I have time I may look into it...

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
[fw-kdevops](https://github.com/mcgrof/fw-kdevops) project or the
[kdevops](https://github.com/mcgrof/kdevops) project or the
[oscheck](https://github.com/mcgrof/oscheck) project from where
this code originally came from.

License
-------

GPLv2
