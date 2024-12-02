# rumpowered Arch repo

add this to your pacman config
```toml
[rumpowered]
Server = https://jc141x.github.io/rumpowered-packages/$arch
```

## GPG Key

keyid: [cc7a2968b28a04b3](https://keyserver.ubuntu.com/pks/lookup?op=vindex&fingerprint=on&exact=on&search=0xe78f977d7bbb55791eb097b4cc7a2968b28a04b3)

<details>
<summary>How do I add the key?</summary>

```
sudo pacman-key --recv-keys cc7a2968b28a04b3
sudo pacman-key --lsign-key cc7a2968b28a04b3
```
</details>

## todo

- automatically update packages that are on AUR
- write documentation for maintainers
- ???

---

## Some info for maintainers

### How to update dwarfs

```sh
cd pkgbuilds/dwarfs
## update the version in the PKGBUILD with your favorite text editor
updpkgsums
makepkg --printsrcinfo > .SRCINFO
makechrootpkg -cur $CHROOT -- --nosign
mv dwarfs-<VERSION>-<RELEASE>-x86_64.pkg.tar.zst ../../x86_64/
cd ../..
repo-add -s -R x86_64/rumpowered.db.tar.zst x86_64/dwarfs-<VERSION>-<RELEASE>-x86_64.pkg.tar.zst
gpg --detach-sign x86_64/dwarfs-<VERSION>-<RELEASE>-x86_64.pkg.tar.zst
## add, commit, push
```

explaination:
- `makechrootpkg -cur $CHROOT -- --nosign`:
    - `-cur`: **c**lean, **u**pdate, **r**oot
    - `$CHROOT`: points to a chroot created with `mkarchroot` (see [here](https://wiki.archlinux.org/title/DeveloperWiki:Building_in_a_clean_chroot#Classic_way))
    - `-- --nosign`: pass `--nosign` to `makepkg` to because the signing key is not available in the chroot
- `repo-add -s -R x86_64/rumpowered.db.tar.gz x86_64/dwarfs-<VERSION>-<RELEASE>-x86_64.pkg.tar.zst`:
    - `-s`: sign the database
    - `-R`: remove old versions of the package from the database
