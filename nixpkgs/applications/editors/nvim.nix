{pkgs, ...}:{


    environment.systemPackages = with pkgs;[

        neovim
   
        ripgrep # needed 
    ];



}


