default:
    @just --list

switch-ares:
  sudo cp /etc/nixos/hardware-configuration.nix ~/nixos-conf/nixos/hardware-configuration.nix
  nh os switch -H ares .

switch-artemis:
  sudo cp /etc/nixos/hardware-configuration.nix ~/nixos-conf/nixos/hardware-configuration.nix
  nh os switch -H artemis .

switch-dionysus:
  sudo cp /etc/nixos/hardware-configuration.nix ~/nixos-conf/nixos/hardware-configuration.nix
  nh os switch -H dionysus .

switch-apollo:
  sudo cp /etc/nixos/hardware-configuration.nix ~/nixos-conf/nixos/hardware-configuration.nix
  nh os switch -H apollo .

switch-athena:
  sudo cp /etc/nixos/hardware-configuration.nix ~/nixos-conf/nixos/hardware-configuration.nix
  nh os switch -H athena .

switch-eros:
  nh darwin switch -H eros .

update-flake:
  nix flake update

remove-trash:
  nh clean all

hm-info:
  journalctl -e --unit home-manager-askodon.service

new-install:
 cd /etc/nixos
 sudo cp /etc/nixos/hardware-configuration.nix ~/nixos-conf/nixos/hardware-configuration.nix
 su -c 'sudo rm -r /boot/*'
 NIX_CONFIG="experimental-features=nix-command flakes"; sudo nixos-rebuild switch --flake.#apollo
 mkdir ~/wallpaper

