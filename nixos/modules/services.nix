{ pkgs, lib, ... }:
{
  hardware.pulseaudio.enable = false;
  
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = lib.mkForce [ 
      pkgs.xdg-desktop-portal-gnome
      ]; 
    config = {
      common.default = [ "gnome" ];
    };
  };
  services = {
    # services list
    #flatpak.remotes = {
    #"flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    #};
    libinput.enable = true;
    tuned.enable = true;
    upower.enable = true;
    avahi.enable = false;
    openssh.enable = true;
    flatpak.enable = true;
    resolved.enable = true;
    kmscon = {
      # better tty
      enable = true;
      fonts = [
        {
          name = "FiraCode Nerd Font";
          package = pkgs.nerd-fonts.fira-code;
        }
      ];

    };
    gnome.gnome-keyring.enable = true;
    xserver = {
      enable = true;
      xkb.layout = "us,ru";
      xkb.variant = "";
      xkb.options = "grp:win_space_toggle";
      #deviceSection = ''Option "TearFree" "true"''; # For amdgpu.
      #videoDrivers = [ "amdgpu" ]; # amdgpu for home pc
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = true;
      pulse.enable = true;
      wireplumber = {
        enable = true;
        package = pkgs.wireplumber;
      };
    };
  };

}
