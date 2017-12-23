service --status-all | cut -d' ' -f6 | sed s_^_/etc/init.d/_ | xargs head
