# A Script to debloat freshs ubuntu installation

## Firstly remove following programs from ubuntu software center
- to-do
- calendar
- thunderbird
- gedit
- media player

## remove snap store with following script

list all snaps with following command
```sh
snap list --all
```
remove all snaps other than `core` (the one which is not disabled and `snapd`

to check the mounted snap core, use `df -H` to check any mount point for core snap

remove disabled core snaps by referencing to revision number as follows

```sh
sudo snap remove core --revision xxxxx
```
the remove the `snapd` using
```sh
apt-get purge snapd
```


remove the snap store app as follows
```sh
sudo snap remove snap-store
```
after this, typing `snap list` should give message that there are no snaps installed.


Then start unmounting snap points as follows
```sh
sudo umount /snap/core/xxxxx

sudo umount /var/snap

rm -rf ~/snap
sudo rm -rf /snap
sudo rm -rf /var/snap
sudo rm -rf /var/lib/snapd
```