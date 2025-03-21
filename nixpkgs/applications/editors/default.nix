{pkgs, ...}:{




    imports = [ 

       ./nvim.nix
       ./vscode.nix
    ];


    environment.systemPackages = with pkgs;[

        jetbrains.pycharm-community    
    ];
}