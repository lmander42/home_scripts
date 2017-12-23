#!/usr/bin/env bash

# print status on init scripts | get script name | prepend full path | head
service --status-all | cut -d' ' -f6 | sed s_^_/etc/init.d/_ | xargs head

exit 0
