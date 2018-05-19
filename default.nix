let

  nixpkgsPath = <nixpkgs>;
  pkgs = import nixpkgsPath {};

  yarn2nixSrc = pkgs.fetchFromGitHub {
    owner = "Profpatsch";
    repo = "yarn2nix";
    rev = "b46abcacdbc6f4f04107b71985c49bc13e5a2844";
    sha256 = "0fcdd55af43c14d81e08c14270498cbd0f20d7800cd1e1d51cb4786da7979747";
  };

  nixLib = pkgs.callPackage "${yarn2nixSrc}/nix-lib" {
    yarn2nix = import yarn2nixSrc { inherit nixpkgsPath; };
  };

in {

}
