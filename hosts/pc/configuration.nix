# sudo nixos-rebuild switch  --flake  /home/student/Desktop/nixos#default
{ config, inputs, ... }:

{
  imports = [ 
    ../common # loads all .nix files in the directory, doesnt add any other folders etc  
    
    # ../common/desktops/plasma6/default.nix
    ../common/desktops/gnome

    # ../common/modules/amd.nix
    # ../common/modules/audio.nix
    # ../common/modules/bluetooth.nix









    ./hardware-config.nix # import hardware config from hardware-config.nix
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
