{
  description = "Running github actions locally";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    flake-utils.url = "github:numtide/flake-utils";
    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, devshell, flake-utils, nixpkgs }:
    let
      systems = [
        flake-utils.lib.system.aarch64-darwin
        flake-utils.lib.system.x86_64-darwin
      ];
    in
    flake-utils.lib.eachSystem systems (system:
    let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          devshell.overlays.default
        ];
      };
      python-with-packages =
        pkgs.python39.withPackages (pyPkgs: [
          pyPkgs.deepdiff
          pyPkgs.fire
          pyPkgs.inquirer
          pyPkgs.jsonpatch
          pyPkgs.rich
          pyPkgs.clint
          pyPkgs.pip
          pyPkgs.bc-python-hcl2
        ]);
    in
    {
      devShell = pkgs.devshell.mkShell {
        motd = "";
        devshell.startup."git-hook-install".text = "git config core.hooksPath .githooks";
        devshell.packages = [
          pkgs.act
          
        ];
      };

      # Format this file using `nix fmt flake.nix`
      formatter = pkgs.nixpkgs-fmt;
    });
}
