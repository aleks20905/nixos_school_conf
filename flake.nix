{

	description = "Nixos config flake";

	inputs = {

		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		home-manager.url = "github:nix-community/home-manager";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";

		# nixos-facter-modules.url = "github:numtide/nixos-facter-modules";
		# nixos-facter-modules.inputs.nixpkgs.follows = "nixpkgs";

		# spicetify-nix.url = "github:Gerg-L/spicetify-nix";
		# spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";

	};

	outputs = { self, nixpkgs,  ... }@inputs:
	let

		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
	in {

		nixosConfigurations = {



			pc = nixpkgs.lib.nixosSystem {
				specialArgs = {inherit inputs;};
				modules = [ 
					./hosts/pc/configuration.nix

	          # Include the facter module for automatic hardware detection.
          # nixos-facter-modules.nixosModules.facter

          # { config.facter.reportPath = "./facter.json";}
				];
			};


		};
	};
}