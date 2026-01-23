{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.noctalia.homeModules.default
    inputs.niri.homeModules.niri
  ];

  home.packages = with pkgs; [
    tela-circle-icon-theme
    bibata-cursors
  ];
  
  home.file = {
    ".config/niri/config.kdl".source = ./config.kdl;
  };
  programs = {
    noctalia-shell = {
      enable = true;
    };
    niri = {
      enable = true;
    };
  };
}
