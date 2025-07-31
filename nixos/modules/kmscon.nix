{ pkgs, ... }:
{
  services.kmscon = {
    # better tty
    enable = true;
    fonts = [
      {
        name = "FiraCode Nerd Font";
        package = pkgs.nerd-fonts.fira-code;
      }
    ];
  };
}
