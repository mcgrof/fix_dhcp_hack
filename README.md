fix_dhcp_hack
=============

On certain distributions you may end up with a situation where your network
interfaces do not get dhcp called for them for one bug reason or another bug
reason. This ansible tries to address this from a distribution agnostic
perspective. Each distribution can have their own solution.

Since only distro with issues at this time is debian, this role won't do
anything on other distros.

# Known issues

## Debian

debian testing as of August 16, 2019 does *not* properly update
`/etc/network/interfaces`. Upon reboot you won't get DHCP. This is odd
given that even though you start up with the enp6s0 network interaface
and there are no entries for it under `/etc/network/interfaces/` you still
get DHCP on the interface after initial bring up. Upon reboot though you
won't be able to ssh in though, as dhcp won't be called for the interface.

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
