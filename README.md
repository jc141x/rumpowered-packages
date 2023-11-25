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

- automatically sync to server
- automatically update packages that are on AUR
- write documentation for maintainers
- ???
