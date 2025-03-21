{pkgs, ...}: {

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.student = {
        isNormalUser = true;
        description = "student";
        extraGroups = [ "networkmanager" "wheel" ];
    };


}