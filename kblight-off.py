#!/usr/bin/env python3
# coding: utf-8
"""
kblight-off.py

Script for turning off the keyboard backlight on Ubuntu 17.10
Written on an Asus Zenbook

inspired by/copied from:
https://wiki.archlinux.org/index.php/Keyboard_backlight

author:  Marion Anderson
date:    2017-11-23
license: MiT
"""

import dbus  # interfaces with keyboard backlight

def kb_light_set(val):
    """
    Sets keyboard backlight to val
    @param val  <int>  desired value of keyboard brightness
    """

    # access keyboard backlight via DBus
    bus = dbus.SystemBus()
    kbd_backlight_proxy = bus.get_object('org.freedesktop.UPower',
                                         '/org/freedesktop/UPower/KbdBacklight')
    kbd_backlight = dbus.Interface(kbd_backlight_proxy,
                                   'org.freedesktop.UPower.KbdBacklight')

    # validate brightness value
    current = kbd_backlight.GetBrightness()
    maximum = kbd_backlight.GetMaxBrightness()

    print("current: {0:d}\nmaximum: {1:d}".format(current, maximum))

    # set brightness
    kbd_backlight.SetBrightness(val)


if __name__ == "__main__":
    kb_light_set(0)
