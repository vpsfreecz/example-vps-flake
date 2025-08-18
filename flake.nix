{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
    vpsadminos.url = github:vpsfreecz/vpsadminos/staging;
  };
 
  outputs = { self, nixpkgs, vpsadminos }: {
    nixosConfigurations.vps = nixpkgs.lib.nixosSystem {
      modules = [
        # For NixOS unstable
        vpsadminos.nixosConfigurations.containerUnstable

        # For NixOS stable (change also nixpkgs.url above)
        # vpsadminos.nixosConfigurations.containerStable

        ./configuration.nix
      ];
    };
  };
}
