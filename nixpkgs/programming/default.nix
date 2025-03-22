{pkgs, ...}:{

    imports = [ 

       ./c-dev.nix 
       ./go-dev.nix 
    ];

    environment.systemPackages = with pkgs; [

        #------- Programming stuff & Tools -------
        # godot_4

        sqlite

        python312
        python312Packages.pip
        python312Packages.virtualenv

        # lua

        # nodejs_22
        
        # tailwindcss # binery - https://github.com/tailwindlabs/tailwindcss/releases

        #------- Programming stuff & Tools -------

    ];

}