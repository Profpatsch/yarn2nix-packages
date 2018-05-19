{  }:
  allDeps:
    {
      name = "pulp";
      version = "12.2.0";
      nodeBuildInputs = let
        a = allDeps;
      in [
        (a."browserify@^13.1.0")
        (a."purescript-psa@^0.5.0")
        (a."read@^1.0.7")
        (a."node-static@^0.7.9")
        (a."bower@^1.7.7")
        (a."minimatch@^3.0.3")
        (a."mocha@^3.1.2")
        (a."through@^2.3.8")
        (a."mold-source-map@^0.4.0")
        (a."mkdirp@^0.5.1")
        (a."string-stream@0.0.7")
        (a."co@^4.6.0")
        (a."temp@^0.8.1")
        (a."fs-promise@^0.5.0")
        (a."jshint@^2.8.0")
        (a."wordwrap@1.0.0")
        (a."semver@^5.1.0")
        (a."which@^1.2.1")
        (a."touch@^1.0.0")
        (a."concat-stream@^1.4.6")
        (a."watchpack@^1.0.1")
        (a."babel@^5.8.22")
        (a."psvm@^0.1.4")
        (a."chai@^3.4.1")
        (a."browserify-incremental@^3.0.1")
        (a."sorcery@^0.10.0")
        (a."glob@^7.1.1")
        (a."tree-kill@^1.0.0")
      ];
      meta = {
        description = "A build system for PureScript projects";
        license = "LGPL-3.0+";
        homepage = "https://github.com/bodil/pulp";
      };
    }
