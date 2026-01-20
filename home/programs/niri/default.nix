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
    noctalia-shell = {
      enable = true;
    };

    programs.niri = {
      package = niri;
      enable = true;
      settings = {
        # ...
        spawn-at-startup = [
          {
            command = [
              "noctalia-shell"
            ];
          }
        ];
      };
    };
}

