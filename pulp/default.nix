{ nixLib, pkgs
, src ? pkgs.fetchFromGitHub {
    owner = "purescript-contrib";
    repo = "pulp";
    rev = "v12.2.0";
    sha256 = "1wgd3i5kir3kbskwkkhrc5vjvaihidq3z41ly4a2hxqnknprpm48";
  }
, patches ? [
    (pkgs.fetchpatch {
      url = "https://github.com/purescript-contrib/pulp/pull/345.patch";
      sha256 = "034pwc86ahhzr68kjglimv3lwddwg3ga1air5kivcb8my2j8hj3w";
    })
  ]
}:

let
  bowerDeps = pkgs.runCommand "bower_components" {
    buildInputs = [ pkgs.git pkgs.nodePackages.bower ];
  } ''
    cp "${src}/bower.json" ./bower.json

    # Dereference symlinks -- bower doesn't like them
    cp --recursive --reflink=auto       \
       --dereference --no-preserve=mode \
       ${pkgs.callPackage ./bower-packages.nix {}} bc

    # Bower install in offline mode -- links together the fetched
    # bower packages.
    HOME=$PWD bower \
       --config.storage.packages=bc/packages \
       --config.storage.registry=bc/registry \
       --offline install

    mv bower_components $out
  '';

  template = nixLib.callTemplate ./npm-package.nix
    (nixLib.buildNodeDeps ./npm-deps.nix);

  nodeDeps = nixLib.linkNodeDeps {
    name = template.name;
    dependencies = template.nodeBuildInputs;
  };

  pulpBuild = pkgs.stdenv.mkDerivation {
    inherit (template) name version meta;

    inherit src;

    buildInputs = [ pkgs.nodejs pkgs.purescript ];

    inherit patches;

    postPatch = ''
      substituteInPlace src/Pulp/Constants.purs \
        --replace '"node"' '"${pkgs.nodejs}/bin/node"' \
        --replace '"bower"' '"${pkgs.nodePackages.bower}/bin/bower"' \
        --replace '"git"' '"${pkgs.git}/bin/git"' \
        --replace '"psc-package"' '"${pkgs.psc-package}/bin/psc-package"'
      # TODO: psa, what about purs?!
      ln -sT ${nodeDeps} ./node_modules
      ln -sT ${bowerDeps} ./bower_components
    '';

    buildPhase = ''
      npm run build
    '';

    installPhase = ''
      mkdir -p $out/{share/pulp,bin}
      mv ./pulp.js ./node_modules ./package.json $out/share/pulp

      cat > $out/bin/pulp <<EOF
      #!${pkgs.stdenv.shell}
      ${pkgs.nodejs}/bin/node $out/share/pulp/pulp.js "\$@"
      EOF
      chmod +x $out/bin/pulp
    '';

    doCheck = true;
    checkPhase = ''
      # https://github.com/purescript-contrib/pulp/issues/346
      # npm run test
    '';

  };

in pulpBuild
