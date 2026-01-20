{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.zen-browser.homeModules.twilight
    inputs.noctalia.homeModules.default
    #./programs/hyprland/default.nix
    ./programs/shell/default.nix
    #./programs/foot/default.nix
    #./programs/waybar/default.nix
    #./programs/fuzzel/default.nix
    #./programs/dunst/default.nix
    ./programs/nvchad/default.nix
    ./programs/vesktop/default.nix
    #./programs/gtk-qt-theme/default.nix
    ./programs/nix-scripts/default.nix
  ];
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (pkgs.lib.getName pkg) [
      # allow unfree
      "vscode"
      "obsidian"
      "vivaldi"
      "davinci-resolve"
    ];

  programs.zen-browser.enable = true;
  programs.noctalia-shell = {
    enable = true;
  };

  home = {
    username = "askodon";
    homeDirectory = "/home/askodon";
    stateVersion = "25.11";
    enableNixpkgsReleaseCheck = false;
    packages = with pkgs; [
      # desktop
      #betterbird
      vscode
      mate.eom # Photo
      mate.atril # Pdf
      mate.engrampa # Archive manager
      #transmission_4-gtk # torrent
      mpv
      keepassxc
      #vivaldi
      obsidian
      nextcloud-client
      #antares
      #libreoffice
      #davinci-resolve
      ffmpeg
      #

      # gnome packages
      dconf-editor
      #

      #fonts
      nerd-fonts.fira-code
      nerd-fonts.roboto-mono
      font-awesome
      #

      # video and audio
      #obs-studio
      #handbrake
      #tenacity
      #

    ];
  };
}
