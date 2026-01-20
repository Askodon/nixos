{
  config,
  inputs,
  pkgs,
  pkgsUnstable,
  ...
}:
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
    ./modules/awesome.nix
    ./modules/system-packages.nix
    ./modules/kmscon.nix

  ];
  _module.args.pkgsUnstable = import inputs.nixpkgs-unstable {
    inherit (pkgs.stdenv.hostPlatform) system;
    inherit (config.nixpkgs) config;
  };

  system.stateVersion = "25.11";
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ]; # Experimental features

  # Unstable pkgs
  environment.systemPackages = [
    #pkgsUnstable.python311Packages.pyinstaller
    pkgs.amneziawg-go
  ];

  # Hostname in network
  networking.hostName = "ares";

  # Security settings
  security = {
    rtkit.enable = true;
    sudo.enable = true;
    polkit.enable = true;
  };

  # nu as default
  users.defaultUserShell = pkgs.nushell;
}
