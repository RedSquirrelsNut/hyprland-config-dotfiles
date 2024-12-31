{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    go
    (python312Full.withPackages(ps: with ps; [ pygobject3 gobject-introspection pyqt6-sip]))
    # nodePackages_latest.nodejs
    # nodePackages_latest.pnpm
#    bun
    guile
    mitscheme
    lua
    # lua54Packages.lua
    # lua54Packages.luarocks
    zig
    numbat
  ];
}
