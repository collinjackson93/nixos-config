{
  description = "Default flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    alejandra.url = "github:kamadorueda/alejandra/3.1.0";
    alejandra.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    alejandra,
    nixpkgs,
    ...
  } @ inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};

        modules = [
          {environment.systemPackages = [alejandra.defaultPackage.${system}];}
          ./configuration.nix
          ./modules/display.nix
          ./modules/locale.nix
          ./modules/packages.nix
          ./modules/user.nix
        ];
      };
    };
  };
}
