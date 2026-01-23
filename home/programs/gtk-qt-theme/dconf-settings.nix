# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      cursor-size = 24;
      cursor-theme = "Bibata-Original-Classic";
      enable-animations = true;
      enable-hot-corners = false;
      font-antialiasing = "grayscale";
      font-hinting = "slight";
      font-name = "RobotoMono Nerd Font Regular 11";
      font-rgba-order = "rgb";
      gtk-theme = "Qogir-Dark";
      icon-theme = "Tela-circle-dark";
      monospace-font-name = "FiraCode Nerd Font 10";
      text-scaling-factor = 1.0;
      toolbar-icons-size = "large";
      toolbar-style = "both-horiz";
      toolkit-accessibility = false;
    };
  };
}
