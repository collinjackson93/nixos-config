{
  description = "Default flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";

    alejandra.url = "github:kamadorueda/alejandra/3.1.0";
    alejandra.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    alejandra,
    nixpkgs,
    ...
  }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";

        modules = [
          {environment.systemPackages = [alejandra.defaultPackage.${system}];}
          ./configuration.nix
        ];
      };
    };
  };
}
