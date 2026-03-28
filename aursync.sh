#!/bin/env bash
aur sync -u --ignore-file "$PWD/aur.ignore" --pacman-conf "$PWD/pacman.conf" --makepkg-conf "$PWD/makepkg.conf" --remove "$@"
