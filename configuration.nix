#conf
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  #ONLY FOR HYPER-V! DELETE THIS IF YOUR USING ON HOME-PC|||
  boot.blacklistedKernelModules = [ "hyperv_fb" ];
  #|||||||||||||||||||||||||||||||||||||||||||||||||||||||||


  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Samara";

  # Select internationalisation properties.
  i18n.defaultLocale = "ru_RU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  #pantheon dekstop
  services.xserver.desktopManager.pantheon.enable = true;
  services.xserver.displayManager.lightdm.greeters.pantheon.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  programs.pantheon-tweaks.enable = true;
  services.flatpak.enable = true; #flatpak to tweaks)

  # hyprland
  #  programs.hyprland = {
  #  enable = true;
  #  xwayland.enable = true;
  #  };

    
  # Configure keymap in X11
  services.xserver = {
    enable = true;
    layout = "ru,us";
    xkbVariant = "";
  };

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.askodon = {
    isNormalUser = true;
    description = "askodon";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      betterbird
      vscode
      discord
      pkgs.papirus-icon-theme
      github-desktop
      pkgs.podman
      pkgs.kitty
      #pkgs.telegram-desktop
      #pkgs.steam
      pkgs.flatpak
      cinnamon.nemo-fileroller
    ];
    
  #fonts
  };
  fonts = {
    packages = with pkgs; [
      # icon fonts
      material-design-icons

      # normal fonts
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      rubik
      pkgs.jetbrains-mono
      # code font
      (nerdfonts.override {fonts = ["SourceCodePro"];})
    ];
  #fonts settings
  fontconfig.defaultFonts = {
      serif = [ "Noto Serif" "Noto Color Emoji" ];
      sansSerif = [ "Noto Sans" "Noto Color Emoji" ];
      monospace = [ "Sauce Code Pro Nerd Font" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };

#add swap file 
zramSwap.enable = true;

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  #zsh as default
  users.defaultUserShell = pkgs.zsh;

  #zsh config
  programs.zsh = {
  enable = true;
  enableAutosuggestions = true;
  ohMyZsh.enable = true;
  ohMyZsh.plugins = [ "git" ];
  ohMyZsh.theme = "frisk";
  syntaxHighlighting.enable = true;
};

  programs.zsh.shellAliases = {
    l = "ls -alh";
    ll = "ls -l";
    udal = "ssh askodon@194.113.34.20";
    boot = "sudo nixos-rebuild boot";
    upgrade = "sudo nixos-rebuild switch";
    trash = "sudo nix-collect-garbage -d";
};

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    git
    helix
    fastfetch
    zsh
    pkgs.oh-my-zsh
    pkgs.zsh-autosuggestions
    pkgs.btop
    qt5.qtwayland
    qt6.qmake
    qt6.qtwayland
    adwaita-qt
    adwaita-qt6
    home-manager
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;

  #ufw like?????
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; #system version

}