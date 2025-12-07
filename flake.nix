{
  description = "Pseudo boolean counter based on addmc";

  inputs = {
    self.submodules = true;
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs =
    { self, nixpkgs, ... }:
    let
      lib = nixpkgs.lib;

      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];
    in
    {
      formatter = lib.genAttrs systems (system: nixpkgs.legacyPackages.${system}.nixfmt-tree);
      packages = lib.genAttrs systems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.callPackage ./default.nix { };

          container = nixpkgs.legacyPackages.${system}.dockerTools.buildLayeredImage {
            name = "pbcount";
            contents = [
              self.packages.${system}.default
              pkgs.time
            ];
            config = {
              Entrypoint = [ "/bin/pbcount" ];
              Labels = {
                "org.opencontainers.image.source" = "https://github.com/uulm-janbaudisch/pbcount";
                "org.opencontainers.image.description" = "Pseudo boolean counter based on addmc";
              };
            };
          };
        }
      );
    };
}
