{ pkgs,  ... }:

{
  # Bootloader.
  #boot.loader.systemd-boot.enable = true;
  #boot.loader.systemd-boot.allow-insecure = true;
  #boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.device = "/dev/sdb";  # Adjust to your main disk
  boot.loader.grub.enable = true;
  boot.loader.timeout = 2;
  boot.initrd.enable = true;
  boot.initrd.systemd.enable = true;
  boot.consoleLogLevel = 3;
  boot.plymouth = {
    enable = true;
    font = "${pkgs.jetbrains-mono}/share/fonts/truetype/JetBrainsMono-Regular.ttf";
    themePackages = [ pkgs.catppuccin-plymouth ];
    theme = "catppuccin-macchiato";
  };
}
