{ inputs, pkgs, ... }:

{
  # Enable Hyprland
  programs.hyprland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  environment.systemPackages = with pkgs; [
    pyprland
    hyprpicker
    hyprcursor
    hyprlock
    hypridle
    hyprpaper

    inputs.wezterm.packages.${pkgs.system}.default
    # inputs.ghostty.packages.${pkgs.system}.default
    alacritty
    ueberzugpp
    ytfzf
    libsixel
    w3m
    starship
    helix 
    
    gnumake
    
    qutebrowser
    zathura
    mpv
    imv
  ];
}
