{ config, pkgs, lib, nixos-hardware, ... }:

{
  imports = [
    "${nixos-hardware}/lenovo/thinkpad/t420"
    ../tseries.nix
    ../encryptedzfs.nix
    ../common.nix
#    ../rc505.nix
  ];
  system.stateVersion = "22.05";

  networking.hostId = "f5836aae";
  networking.hostName = "thinknix420";
  # silence BIOS-related "errors" at boot shown before NixOS stage 1 output (default
  # is 4)
  boot.consoleLogLevel = 3;

}

