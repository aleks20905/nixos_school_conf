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
# { pkgs ? import <nixpkgs> {

#   config = {
#     allowUnfree = true;
#     cudaSupport = true;
#   };
# } }:
 
# pkgs.mkShell {

#   buildInputs = [
#     pkgs.python312
#   ];

#   env.LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
#     pkgs.stdenv.cc.cc.lib
#     pkgs.libz
#     pkgs.stdenv.cc
#     pkgs.binutils
#     pkgs.gnupg 
#     pkgs.glib
#   ];

# }
}