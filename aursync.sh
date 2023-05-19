#!/bin/env bash
aur sync --ignore-file=aur.ignore -u --pacman-conf "$PWD/pacman.conf" --makepkg-conf "$PWD/makepkg.conf" --remove "$@"
