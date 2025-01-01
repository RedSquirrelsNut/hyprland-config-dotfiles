{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.redsquirrel = {
    isNormalUser = true;
    description = "redsquirrel";
    extraGroups = [ "networkmanager" "input" "wheel" "seat" "video" "audio" "tss" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      unzip
      zip
      p7zip
      neomutt
      matrix-commander-rs
      discord
      vesktop
      # element-desktop
      vscodium
      gimp
      firefox
      # lutris-unwrapped #TODO:Re-enable when fixed (https://github.com/NixOS/nixpkgs/issues/368119)
      # heroic-unwrapped
      wineWowPackages.waylandFull
      winetricks
      prismlauncher
      youtube-tui
      mangohud
      protonup
      obs-studio
      blockbench
      streamlink
      wiki-tui
      godot_4
      godot_4-export-templates
    ];
  };

  #Enable Steam
   programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
   };

   environment.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/redsquirrel/.steam/root/compatibilitytools.d";
   };

   programs.gamemode.enable = true; 
  
  # Change runtime directory size
  services.logind.extraConfig = "RuntimeDirectorySize=8G";

  console.useXkbConfig = true;
}
