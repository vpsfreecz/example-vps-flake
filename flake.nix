{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
    vpsadminos.url = github:vpsfreecz/vpsadminos/staging;
  };
 
  outputs = { self, nixpkgs, vpsadminos }: {
    nixosConfigurations.vps = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix
      ];
    };
  };
}
