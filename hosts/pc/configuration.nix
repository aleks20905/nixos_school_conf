# sudo nixos-rebuild switch  --flake  /home/student/Desktop/nixos#default

# sudo nixos-rebuild switch  --flake  https://github.com/nix-community/nixos-anywhere-examples.git

# sudo nixos-install --flake github:aleks20905/nixos_school_conf#pc --no-root-passwd --extra-config-file /mnt/etc/nixos/hardware-configuration.nix

# sudo nixos-rebuild switch --flake github:aleks20905/nixos_school_conf#pc --impure 

{ config, inputs, pkgs, lib, ... }:

{
  imports = [ 
    ../common # loads all .nix files in the directory, doesnt add any other folders etc  
    
    # ../common/desktops/plasma6/default.nix
    ../common/desktops/gnome

    # ../common/modules/amd.nix
    # ../common/modules/audio.nix
    # ../common/modules/bluetooth.nix







    /etc/nixos/hardware-configuration.nix
    # ./hardware-config.nix # import hardware config from hardware-config.nix
    ./nixpkg.nix # import nixpkgs from nixpkgs.nix 
    ./service.nix # import services from service.nix

    ./modules/testConfig.nix # when testing stuff can be put in side 
  ];
  
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users ={
    "student"  = import ./home.nix;
    };
  };




	# Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  swapDevices = lib.mkForce [ ];

	networking.hostName = "host-lab-166"; # Define your hostname.


	boot.kernelPackages = pkgs.linuxPackages_6_6;
 
  # addes partition manager 
  # programs.partition-manager.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };


}
