{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./modules/boot-settings.nix
    #./modules/game-settings.nix
    ./modules/locale.nix
    ./modules/network-settings.nix
    ./modules/services.nix
    ./modules/system-variables.nix
    ./modules/users.nix
    ./modules/virtualisation.nix
    ./modules/overlays.nix
    ./modules/flatpak.nix
    ./modules/system-packages.nix
    ./modules/kde.nix
    ./modules/kmscon.nix
  ];

  # system version
  system.stateVersion = "25.11"; # system version
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ]; # experimental features

  # hostname
  networking.hostName = "athena"; # hostname

  # security settings
  security = {
    rtkit.enable = true;
    sudo.enable = true;
  };

  # nu as default
  users.defaultUserShell = pkgs.nushell;
}
