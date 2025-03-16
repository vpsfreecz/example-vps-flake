{ config, pkgs, lib, inputs, ... }:
{
  imports = [
    inputs.vpsadminos.nixosConfigurations.container
  ];
 
  environment.systemPackages = with pkgs; [
    vim
  ];
 
  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "yes";
  #users.extraUsers.root.openssh.authorizedKeys.keys =
  #  [ "..." ];
 
  systemd.extraConfig = ''
    DefaultTimeoutStartSec=900s
  '';
 
  time.timeZone = "Europe/Amsterdam";

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
 
  system.stateVersion = "24.11";
}
