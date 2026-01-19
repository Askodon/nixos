{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./modules/boot-settings.nix
    ./modules/locale.nix
    ./modules/network-settings.nix
    ./modules/users.nix
    ./modules/kmscon.nix
  ];

  system.stateVersion = "25.11";
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ]; # Experimental features

  # Hostname
  networking.hostName = "apollo";

  # Security settings
  security = {
    rtkit.enable = true;
    sudo.enable = true;
  };

  # System packages
  environment.systemPackages = with pkgs; [
    git
    zellij
    gum
    just
    nh
  ];

  # Services
  services.openssh.enable = true;

  # nu as default
  users.defaultUserShell = pkgs.nushell;
}
