## Installation

1. Download and Install NixOS from the [official site](https://nixos.org/download).
2. Temporarily install ripgrep and fish using the command: `nix-shell -p ripgrep fish --run fish`. You can also use classic bash and grep for the next step without installing fish and ripgrep.
3. Change/add lines to match your device, swaps, partitions, peripherals, file systems, etc. in the configuration files. 

4. Enable `flake` support (more [here](https://nixos.wiki/wiki/Flakes#Enable_flakes_temporarily)) on your current system. Don't forget to run `sudo nixos-rebuild switch` after enabling `flake` in your `/etc/configuration.nix`.
5. Copy or move all files (with replacements) from the `home` directory to your `$HOME` directory in Linux.
6. Copy or move all files (with replacements and **sudo** permissions) from the `nixos` directory to `/etc/nixos/`. Ensure that `system.stateVersion = "your_version";` is correctly set to the release version of the initial installation of your system in the `configuration.nix` file. Also, for security reasons, ensure all files in the `/etc/nixos` directory are owned by **root**. If not, change ownership using the command: `sudo chown -R root:root /etc/nixos`.
7. Run the command `sudo nixos-rebuild switch --flake /etc/nixos#your-hostname --update-input nixpkgs --update-input rust-overlay --commit-lock-file --upgrade` or `nswitchu`. If you chose first command, replace `your-hostname` with your hostname before running the command; by default, hostname is set to `isitreal-desktop`.
8. Post-installation configuration:

 - Import GNOME settings along with the theme by executing the following command: `dconf load / < home/.config/gnome_settings_backup.dconf`. Additionally, you can use tools like **gnome-tweaks** or **themechanger** to fine-tune specific theme preferences to your liking.

 - Install dictionaries for spellchecking in Qutebrowser by using the similar command in **bash**: `$(find $(nix-store --query --outputs $(which qutebrowser)) -iname '*dictcli.py*' | head -1) install en-US hi-IN`.
  To obtain a list of all available dictionaries, run: `$(find $(nix-store --query --outputs $(which qutebrowser)) -iname '*dictcli.py*' | head -1) list` in **bash**. 
  For more information, visit [the Qutebrowser page on the nixos wiki](https://wiki.nixos.org/wiki/Qutebrowser).

 - Apply Catppuccin theme for websites in your browser (Brave, Firefox, Chromium):
   - Install the Stylus Extension from its [official website](https://add0n.com/stylus.html).
   - Open the extension's settings page and navigate to the Backup section.
   - Click "Import" and select the file `home/.config/stylus-catppuccin.json`.

  - Login to your accounts.

  - Customize graphical applications to suit your preferences.

  After this, you will have a complete system.

