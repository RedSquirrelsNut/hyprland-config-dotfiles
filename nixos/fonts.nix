{ pkgs, ... }:

{
  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.droid-sans-mono
    jetbrains-mono
    
    nerd-font-patcher
    noto-fonts-color-emoji
  ];
}
