{pkgs, ...}:{

    imports = [ 

       ./c-dev.nix 
       ./go-dev.nix 
    ];

    environment.systemPackages = with pkgs; [

        #------- Programming stuff & Tools -------
        # godot_4

        sqlite

        python314
        python314Packages.pip
        python314Packages.virtualenv

        # lua

        # nodejs_22
        
        # tailwindcss # binery - https://github.com/tailwindlabs/tailwindcss/releases

        #------- Programming stuff & Tools -------

    ];

}