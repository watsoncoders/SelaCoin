
Debian
====================
This directory contains files used to package selacoind/selacoin-qt
for Debian-based Linux systems. If you compile selacoind/selacoin-qt yourself, there are some useful files here.

## selacoin: URI support ##


selacoin-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install selacoin-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your selacoin-qt binary to `/usr/bin`
and the `../../share/pixmaps/selacoin128.png` to `/usr/share/pixmaps`

selacoin-qt.protocol (KDE)

