{pkgs, ...}: {

    environment.systemPackages = with pkgs;[

        fastfetch

		#------- Console Utilities ------- #TODO may need to move to somewhere else idk 

        # toybox # problem bugs and cant use ls and etc | https://search.nixos.org/packages?channel=unstable&show=toybox 

        # lm_sensors      # Hardware monitoring tool
        # xorg.xrandr     # need for thest in for pcConfig [remove]

        lf  
        fd

        nixpkgs-fmt

        nvd           # Nix/NixOS package version diff tool

        #------- Console Utilities -------

        btop


        lazygit
    ];
}

