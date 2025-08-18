{ config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
  ];
 
  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "yes";
  #users.extraUsers.root.openssh.authorizedKeys.keys =
  #  [ "..." ];
 
  systemd.settings.Manager = {
    DefaultTimeoutStartSec = "900s";
  };
 
  time.timeZone = "Europe/Amsterdam";

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
 
  system.stateVersion = "24.11";
}
