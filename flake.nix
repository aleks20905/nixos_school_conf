{

	description = "Nixos config flake";

	inputs = {

		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		home-manager.url = "github:nix-community/home-manager";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";

		nixos-facter-modules.url = "github:numtide/nixos-facter-modules";
		nixos-facter-modules.inputs.nixpkgs.follows = "nixpkgs";

		# spicetify-nix.url = "github:Gerg-L/spicetify-nix";
		# spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";

	};

	outputs = { self, nixpkgs, nixos-facter-modules, ... }@inputs:
	let

		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
	in {

		nixosConfigurations = {

			# default = nixpkgs.lib.nixosSystem {
			#   specialArgs = {inherit inputs;};
			#   modules = [ 
			#     ./configuration.nix
			#   ];
			# };

			# obezglaven = nixpkgs.lib.nixosSystem {
			# 	specialArgs = {inherit inputs;};
			# 	modules = [ 
			# 		./hosts/obezglaven/configuration.nix
			# 	];
			# };


			# laptop = nixpkgs.lib.nixosSystem {
			# 	specialArgs = {inherit inputs;};
			# 	modules = [ 
			# 		./hosts/laptop/configuration.nix
			# 	];
			# };


			pc = nixpkgs.lib.nixosSystem {
				specialArgs = {inherit inputs;};
				modules = [ 
					./hosts/pc/configuration.nix

					nixos-facter-modules.nixosModules.facter
          {
            config.facter.reportPath =
              if builtins.pathExists ./facter.json then
                ./facter.json
              else
                throw "Have you forgotten to run nixos-anywhere with `--generate-hardware-config nixos-facter ./facter.json`?";
          }

				];
			};


		};
	};
}