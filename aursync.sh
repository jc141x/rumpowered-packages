#!/bin/env bash
aur sync -u --pacman-conf "$PWD/pacman.conf" --makepkg-conf "$PWD/makepkg.conf" --remove "$@"
