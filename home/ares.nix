{ config, pkgs, ... }:
{
  imports = [
    ./programs/awesomeWM/default.nix
    ./programs/shell
    ./programs/gtk-qt-theme/default.nix
    ./programs/picom/default.nix
    ./programs/alacritty/default.nix
    ./programs/nvchad/default.nix
    ./programs/firefox/default.nix
    ./programs/nix-scripts/default.nix
  ];
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (pkgs.lib.getName pkg) [
      # allow unfree
      "obsidian"
      "vivaldi"
    ];

  home = {
    username = "askodon";
    homeDirectory = "/home/askodon";
    stateVersion = "25.11";
    enableNixpkgsReleaseCheck = false;
    packages = with pkgs; [
      # Desktop
      #betterbird
      mate.eom # Photo
      mate.atril # Pdf
      mate.engrampa # Archive manager
      transmission_4-gtk # Torrent
      mpv
      keepassxc
      vivaldi
      obsidian
      nextcloud-client
      antares
      libreoffice
      appimage-run
      zed-editor
      #

      # Gnome packages
      dconf-editor
      #

      #fonts
      nerd-fonts.fira-code
      nerd-fonts.roboto-mono
      font-awesome
      #

      # video and audio
      obs-studio
      #

    ];
  };
}
