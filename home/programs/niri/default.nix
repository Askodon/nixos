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
    "./config.kdl".source = ./config/niri/config.kdl;
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
