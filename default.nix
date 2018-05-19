{ nixpkgsPath ? <nixpkgs> }:

let
  pkgs = import nixpkgsPath {};

  yarn2nixSrc = pkgs.fetchFromGitHub {
    owner = "Profpatsch";
    repo = "yarn2nix";
    rev = "b46abcacdbc6f4f04107b71985c49bc13e5a2844";
    sha256 = "1wcg5gydrwikbvh730jgp9g5igdlbmp4jhbkczn62mxkw06icih0";
  };

  nixLib = pkgs.callPackage "${yarn2nixSrc}/nix-lib" {
    yarn2nix = import yarn2nixSrc { inherit nixpkgsPath; };
  };

in {
  pulp = import ./pulp { inherit pkgs nixLib; };
}
