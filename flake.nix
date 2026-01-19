{
  description = "Nixos-conf flake";

  inputs = {
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-darwin = {
      url = "github:lnl7/nix-darwin/nix-darwin-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvchad4nix = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
    url = "github:0xc000022070/zen-browser-flake";
    inputs = {
      # IMPORTANT: To ensure compatibility with the latest Firefox version, use nixpkgs-unstable.
      nixpkgs.follows = "nixpkgs";
      home-manager.follows = "home-manager";
    };
  };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      self,
      hyprland,
      nix-darwin,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      extraSpecialArgs = {
        inherit system;
        inherit inputs;
      };
      specialArgs = {
        inherit system;
        inherit inputs;
      };
    in
    {
      nixosConfigurations = {
        artemis = lib.nixosSystem {
          inherit specialArgs;
          modules = [
            ./nixos/artemis.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                inherit extraSpecialArgs;
                useGlobalPkgs = true;
                useUserPackages = true;
                users.askodon = import ./home/artemis.nix;
                backupFileExtension = "hm-backup";
              };
            }
          ];
        };

        nixosConfigurations = {
        dionysus = lib.nixosSystem {
          inherit specialArgs;
          modules = [
            ./nixos/dionysus.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                inherit extraSpecialArgs;
                useGlobalPkgs = true;
                useUserPackages = true;
                users.askodon = import ./home/dionysus.nix;
                backupFileExtension = "hm-backup";
              };
            }
          ];
        };

        ares = lib.nixosSystem {
          inherit specialArgs;
          modules = [
            ./nixos/ares.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                inherit extraSpecialArgs;
                useGlobalPkgs = true;
                useUserPackages = true;
                users.askodon = import ./home/ares.nix;
                backupFileExtension = "hm-backup";
              };
            }
          ];
        };

        athena = lib.nixosSystem {
          inherit specialArgs;
          modules = [
            ./nixos/athena.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                inherit extraSpecialArgs;
                useGlobalPkgs = true;
                useUserPackages = true;
                #sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];
                users.askodon = import ./home/athena.nix;
                backupFileExtension = "hm-backup";
              };
            }
          ];
        };

        apollo = lib.nixosSystem {
          inherit specialArgs;
          modules = [ ./nixos/apollo.nix ];
        };
      };

      darwinConfigurations = {
        eros = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          specialArgs = { inherit inputs; };
          modules = [
            ./nixos/eros.nix
            home-manager.darwinModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.askodon = import ./home/eros.nix;
              };
            }
          ];
        };
      };
    };
};
}
