{ config, pkgs, lib, ... }:

let
  hwfork = fetchTarball
    "https://github.com/mcdonc/nixos-hardware/archive/pseries-additions.tar.gz";
in {
  imports = [
    (import "${hwfork}/lenovo/thinkpad/p52")
    ../common/pseries.nix
    ../common/encryptedzfs.nix
    ../common/configuration.nix
  ];

  # override optimus default offload mode to deal with external monitor
  hardware.nvidia.prime.offload.enable = lib.mkForce false;
  hardware.nvidia.prime.sync.enable = true;

  # silence ACPI "errors" at boot shown before NixOS stage 1 output (default is 4)
  boot.consoleLogLevel = 3;

  # why must I do this?  I have no idea.
  systemd.services.NetworkManager-wait-online.enable = false;

  # per-host settings
  networking.hostId = "e1e4a33b";
  networking.hostName = "thinknix52";
  networking.useDHCP = lib.mkForce true;
}

