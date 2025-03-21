{pkgs, ...}:{

	services.xserver.enable = true;
	services.xserver.displayManager.gdm.enable = true;
	services.xserver.desktopManager.gnome.enable = true;

	environment.systemPackages = with pkgs.gnomeExtensions; [
    blur-my-shell
    pop-shell
		docker
		clipboard-indicator
		desktop-icons-ng-ding
		appindicator
		dock-from-dash
    # ...
  ];


}