{ fetchurl, fetchgit }:
  self:
    super:
      let
        registries = {
          yarn = n:
            v:
              "https://registry.yarnpkg.com/${n}/-/${n}-${v}.tgz";
          npm = n:
            v:
              "https://registry.npmjs.org/${n}/-/${n}-${v}.tgz";
        };
        sanitizePackageName = builtins.replaceStrings [
          "@"
          "/"
        ] [ "-" "-" ];
        nodeFilePackage = name:
          version:
            registry:
              sha1:
                deps:
                  super._buildNodePackage {
                    name = sanitizePackageName name;
                    inherit version;
                    src = fetchurl {
                      url = registry name version;
                      inherit sha1;
                    };
                    nodeBuildInputs = deps;
                  };
        nodeGitPackage = name:
          version:
            url:
              rev:
                sha256:
                  deps:
                    super._buildNodePackage {
                      name = sanitizePackageName name;
                      inherit version;
                      src = fetchgit {
                        inherit url rev sha256;
                      };
                      nodeBuildInputs = deps;
                    };
        identityRegistry = url:
          _:
            _:
              url;
        ir = identityRegistry;
        f = nodeFilePackage;
        g = nodeGitPackage;
        n = registries.npm;
        y = registries.yarn;
        s = self;
      in {
        "JSONStream@0.10.0" = f "JSONStream" "0.10.0" y "74349d0d89522b71f30f0a03ff9bd20ca6f12ac0" [
          (s."jsonparse@0.0.5")
          (s."through@>=2.2.7 <3")
        ];
        "JSONStream@1.3.2" = f "JSONStream" "1.3.2" y "c102371b6ec3a7cf3b847ca00c20bb0fce4c6dea" [
          (s."jsonparse@^1.2.0")
          (s."through@>=2.2.7 <3")
        ];
        "JSONStream@^0.10.0" = s."JSONStream@0.10.0";
        "JSONStream@^1.0.3" = s."JSONStream@1.3.2";
        "abbrev@1" = s."abbrev@1.1.1";
        "abbrev@1.1.1" = f "abbrev" "1.1.1" y "f8f2c887ad10bf67f634f005b6987fed3179aac8" [];
        "acorn-node@1.3.0" = f "acorn-node" "1.3.0" y "5f86d73346743810ef1269b901dbcbded020861b" [
          (s."acorn@^5.4.1")
          (s."xtend@^4.0.1")
        ];
        "acorn-node@^1.2.0" = s."acorn-node@1.3.0";
        "acorn@4.0.13" = f "acorn" "4.0.13" y "105495ae5361d697bd195c825192e1ad7f253787" [];
        "acorn@5.5.3" = f "acorn" "5.5.3" y "f473dd47e0277a08e28e9bec5aeeb04751f0b8c9" [];
        "acorn@^4.0.3" = s."acorn@4.0.13";
        "acorn@^5.2.1" = s."acorn@5.5.3";
        "acorn@^5.4.1" = s."acorn@5.5.3";
        "ajv@5.5.2" = f "ajv" "5.5.2" y "73b5eeca3fab653e3d3f9422b341ad42205dc965" [
          (s."co@^4.6.0")
          (s."fast-deep-equal@^1.0.0")
          (s."fast-json-stable-stringify@^2.0.0")
          (s."json-schema-traverse@^0.3.0")
        ];
        "ajv@^5.1.0" = s."ajv@5.5.2";
        "align-text@0.1.4" = f "align-text" "0.1.4" y "0cd90a561093f35d0a99256c22b7069433fad117" [
          (s."kind-of@^3.0.2")
          (s."longest@^1.0.1")
          (s."repeat-string@^1.5.2")
        ];
        "align-text@^0.1.1" = s."align-text@0.1.4";
        "align-text@^0.1.3" = s."align-text@0.1.4";
        "alter@0.2.0" = f "alter" "0.2.0" y "c7588808617572034aae62480af26b1d4d1cb3cd" [
          (s."stable@~0.1.3")
        ];
        "alter@~0.2.0" = s."alter@0.2.0";
        "amdefine@1.0.1" = f "amdefine" "1.0.1" y "4a5282ac164729e93619bcfd3ad151f817ce91f5" [];
        "amdefine@>=0.0.4" = s."amdefine@1.0.1";
        "ansi-regex@2.1.1" = f "ansi-regex" "2.1.1" y "c3b33ab5ee360d86e0e628f0468ae7ef27d654df" [];
        "ansi-regex@^2.0.0" = s."ansi-regex@2.1.1";
        "ansi-styles@2.2.1" = f "ansi-styles" "2.2.1" y "b432dd3358b634cf75e1e4664368240533c1ddbe" [];
        "ansi-styles@^2.2.1" = s."ansi-styles@2.2.1";
        "any-promise@1.3.0" = f "any-promise" "1.3.0" y "abc6afeedcea52e809cdc0376aed3ce39635d17f" [];
        "any-promise@^1.0.0" = s."any-promise@1.3.0";
        "anymatch@1.3.2" = f "anymatch" "1.3.2" y "553dcb8f91e3c889845dfdba34c77721b90b9d7a" [
          (s."micromatch@^2.1.5")
          (s."normalize-path@^2.0.0")
        ];
        "anymatch@2.0.0" = f "anymatch" "2.0.0" y "bcb24b4f37934d9aa7ac17b4adaf89e7c76ef2eb" [
          (s."micromatch@^3.1.4")
          (s."normalize-path@^2.1.1")
        ];
        "anymatch@^1.3.0" = s."anymatch@1.3.2";
        "anymatch@^2.0.0" = s."anymatch@2.0.0";
        "aproba@1.2.0" = f "aproba" "1.2.0" y "6802e6264efd18c790a1b0d517f0f2627bf2c94a" [];
        "aproba@^1.0.3" = s."aproba@1.2.0";
        "are-we-there-yet@1.1.4" = f "are-we-there-yet" "1.1.4" y "bb5dca382bb94f05e15194373d16fd3ba1ca110d" [
          (s."delegates@^1.0.0")
          (s."readable-stream@^2.0.6")
        ];
        "are-we-there-yet@~1.1.2" = s."are-we-there-yet@1.1.4";
        "arr-diff@2.0.0" = f "arr-diff" "2.0.0" y "8f3b827f955a8bd669697e4a4256ac3ceae356cf" [
          (s."arr-flatten@^1.0.1")
        ];
        "arr-diff@4.0.0" = f "arr-diff" "4.0.0" y "d6461074febfec71e7e15235761a329a5dc7c520" [];
        "arr-diff@^2.0.0" = s."arr-diff@2.0.0";
        "arr-diff@^4.0.0" = s."arr-diff@4.0.0";
        "arr-flatten@1.1.0" = f "arr-flatten" "1.1.0" y "36048bbff4e7b47e136644316c99669ea5ae91f1" [];
        "arr-flatten@^1.0.1" = s."arr-flatten@1.1.0";
        "arr-flatten@^1.1.0" = s."arr-flatten@1.1.0";
        "arr-union@3.1.0" = f "arr-union" "3.1.0" y "e39b09aea9def866a8f206e288af63919bae39c4" [];
        "arr-union@^3.1.0" = s."arr-union@3.1.0";
        "array-filter@0.0.1" = f "array-filter" "0.0.1" y "7da8cf2e26628ed732803581fd21f67cacd2eeec" [];
        "array-filter@~0.0.0" = s."array-filter@0.0.1";
        "array-find-index@1.0.2" = f "array-find-index" "1.0.2" y "df010aa1287e164bbda6f9723b0a96a1ec4187a1" [];
        "array-find-index@^1.0.1" = s."array-find-index@1.0.2";
        "array-map@0.0.0" = f "array-map" "0.0.0" y "88a2bab73d1cf7bcd5c1b118a003f66f665fa662" [];
        "array-map@~0.0.0" = s."array-map@0.0.0";
        "array-reduce@0.0.0" = f "array-reduce" "0.0.0" y "173899d3ffd1c7d9383e4479525dbe278cab5f2b" [];
        "array-reduce@~0.0.0" = s."array-reduce@0.0.0";
        "array-unique@0.2.1" = f "array-unique" "0.2.1" y "a1d97ccafcbc2625cc70fadceb36a50c58b01a53" [];
        "array-unique@0.3.2" = f "array-unique" "0.3.2" y "a894b75d4bc4f6cd679ef3244a9fd8f46ae2d428" [];
        "array-unique@^0.2.1" = s."array-unique@0.2.1";
        "array-unique@^0.3.2" = s."array-unique@0.3.2";
        "asn1.js@4.10.1" = f "asn1.js" "4.10.1" y "b9c2bf5805f1e64aadeed6df3a2bfafb5a73f5a0" [
          (s."bn.js@^4.0.0")
          (s."inherits@^2.0.1")
          (s."minimalistic-assert@^1.0.0")
        ];
        "asn1.js@^4.0.0" = s."asn1.js@4.10.1";
        "asn1@0.2.3" = f "asn1" "0.2.3" y "dac8787713c9966849fc8180777ebe9c1ddf3b86" [];
        "asn1@~0.2.3" = s."asn1@0.2.3";
        "assert-plus@1.0.0" = f "assert-plus" "1.0.0" y "f12e0f3c5d77b0b1cdd9146942e4e96c1e4dd525" [];
        "assert-plus@^1.0.0" = s."assert-plus@1.0.0";
        "assert@1.4.1" = f "assert" "1.4.1" y "99912d591836b5a6f5b345c0f07eefc08fc65d91" [
          (s."util@0.10.3")
        ];
        "assert@^1.4.0" = s."assert@1.4.1";
        "assertion-error@1.1.0" = f "assertion-error" "1.1.0" y "e60b6b0e8f301bd97e5375215bda406c85118c0b" [];
        "assertion-error@^1.0.1" = s."assertion-error@1.1.0";
        "assign-symbols@1.0.0" = f "assign-symbols" "1.0.0" y "59667f41fadd4f20ccbc2bb96b8d4f7f78ec0367" [];
        "assign-symbols@^1.0.0" = s."assign-symbols@1.0.0";
        "ast-traverse@0.1.1" = f "ast-traverse" "0.1.1" y "69cf2b8386f19dcda1bb1e05d68fe359d8897de6" [];
        "ast-traverse@~0.1.1" = s."ast-traverse@0.1.1";
        "ast-types@0.8.12" = f "ast-types" "0.8.12" y "a0d90e4351bb887716c83fd637ebf818af4adfcc" [];
        "ast-types@0.8.15" = f "ast-types" "0.8.15" y "8eef0827f04dff0ec8857ba925abe3fea6194e52" [];
        "ast-types@0.9.6" = f "ast-types" "0.9.6" y "102c9e9e9005d3e7e3829bf0c4fa24ee862ee9b9" [];
        "astw@2.2.0" = f "astw" "2.2.0" y "7bd41784d32493987aeb239b6b4e1c57a873b917" [
          (s."acorn@^4.0.3")
        ];
        "astw@^2.0.0" = s."astw@2.2.0";
        "async-each@1.0.1" = f "async-each" "1.0.1" y "19d386a1d9edc6e7c1c85d388aedbcc56d33602d" [];
        "async-each@^1.0.0" = s."async-each@1.0.1";
        "async@1.5.2" = f "async" "1.5.2" y "ec6a61ae56480c0c3cb241c95618e20892f9672a" [];
        "async@^1.5.2" = s."async@1.5.2";
        "asynckit@0.4.0" = f "asynckit" "0.4.0" y "c79ed97f7f34cb8f2ba1bc9790bcc366474b4b79" [];
        "asynckit@^0.4.0" = s."asynckit@0.4.0";
        "atob@2.1.1" = f "atob" "2.1.1" y "ae2d5a729477f289d60dd7f96a6314a22dd6c22a" [];
        "atob@^2.0.0" = s."atob@2.1.1";
        "aws-sign2@0.7.0" = f "aws-sign2" "0.7.0" y "b46e890934a9591f2d2f6f86d7e6a9f1b3fe76a8" [];
        "aws-sign2@~0.7.0" = s."aws-sign2@0.7.0";
        "aws4@1.7.0" = f "aws4" "1.7.0" y "d4d0e9b9dbfca77bf08eeb0a8a471550fe39e289" [];
        "aws4@^1.6.0" = s."aws4@1.7.0";
        "babel-core@5.8.38" = f "babel-core" "5.8.38" y "1fcaee79d7e61b750b00b8e54f6dfc9d0af86558" [
          (s."babel-plugin-constant-folding@^1.0.1")
          (s."babel-plugin-dead-code-elimination@^1.0.2")
          (s."babel-plugin-eval@^1.0.1")
          (s."babel-plugin-inline-environment-variables@^1.0.1")
          (s."babel-plugin-jscript@^1.0.4")
          (s."babel-plugin-member-expression-literals@^1.0.1")
          (s."babel-plugin-property-literals@^1.0.1")
          (s."babel-plugin-proto-to-assign@^1.0.3")
          (s."babel-plugin-react-constant-elements@^1.0.3")
          (s."babel-plugin-react-display-name@^1.0.3")
          (s."babel-plugin-remove-console@^1.0.1")
          (s."babel-plugin-remove-debugger@^1.0.1")
          (s."babel-plugin-runtime@^1.0.7")
          (s."babel-plugin-undeclared-variables-check@^1.0.2")
          (s."babel-plugin-undefined-to-void@^1.1.6")
          (s."babylon@^5.8.38")
          (s."bluebird@^2.9.33")
          (s."chalk@^1.0.0")
          (s."convert-source-map@^1.1.0")
          (s."core-js@^1.0.0")
          (s."debug@^2.1.1")
          (s."detect-indent@^3.0.0")
          (s."esutils@^2.0.0")
          (s."fs-readdir-recursive@^0.1.0")
          (s."globals@^6.4.0")
          (s."home-or-tmp@^1.0.0")
          (s."is-integer@^1.0.4")
          (s."js-tokens@1.0.1")
          (s."json5@^0.4.0")
          (s."lodash@^3.10.0")
          (s."minimatch@^2.0.3")
          (s."output-file-sync@^1.1.0")
          (s."path-exists@^1.0.0")
          (s."path-is-absolute@^1.0.0")
          (s."private@^0.1.6")
          (s."regenerator@0.8.40")
          (s."regexpu@^1.3.0")
          (s."repeating@^1.1.2")
          (s."resolve@^1.1.6")
          (s."shebang-regex@^1.0.0")
          (s."slash@^1.0.0")
          (s."source-map@^0.5.0")
          (s."source-map-support@^0.2.10")
          (s."to-fast-properties@^1.0.0")
          (s."trim-right@^1.0.0")
          (s."try-resolve@^1.0.0")
        ];
        "babel-core@^5.6.21" = s."babel-core@5.8.38";
        "babel-plugin-constant-folding@1.0.1" = f "babel-plugin-constant-folding" "1.0.1" y "8361d364c98e449c3692bdba51eff0844290aa8e" [];
        "babel-plugin-constant-folding@^1.0.1" = s."babel-plugin-constant-folding@1.0.1";
        "babel-plugin-dead-code-elimination@1.0.2" = f "babel-plugin-dead-code-elimination" "1.0.2" y "5f7c451274dcd7cccdbfbb3e0b85dd28121f0f65" [];
        "babel-plugin-dead-code-elimination@^1.0.2" = s."babel-plugin-dead-code-elimination@1.0.2";
        "babel-plugin-eval@1.0.1" = f "babel-plugin-eval" "1.0.1" y "a2faed25ce6be69ade4bfec263f70169195950da" [];
        "babel-plugin-eval@^1.0.1" = s."babel-plugin-eval@1.0.1";
        "babel-plugin-inline-environment-variables@1.0.1" = f "babel-plugin-inline-environment-variables" "1.0.1" y "1f58ce91207ad6a826a8bf645fafe68ff5fe3ffe" [];
        "babel-plugin-inline-environment-variables@^1.0.1" = s."babel-plugin-inline-environment-variables@1.0.1";
        "babel-plugin-jscript@1.0.4" = f "babel-plugin-jscript" "1.0.4" y "8f342c38276e87a47d5fa0a8bd3d5eb6ccad8fcc" [];
        "babel-plugin-jscript@^1.0.4" = s."babel-plugin-jscript@1.0.4";
        "babel-plugin-member-expression-literals@1.0.1" = f "babel-plugin-member-expression-literals" "1.0.1" y "cc5edb0faa8dc927170e74d6d1c02440021624d3" [];
        "babel-plugin-member-expression-literals@^1.0.1" = s."babel-plugin-member-expression-literals@1.0.1";
        "babel-plugin-property-literals@1.0.1" = f "babel-plugin-property-literals" "1.0.1" y "0252301900192980b1c118efea48ce93aab83336" [];
        "babel-plugin-property-literals@^1.0.1" = s."babel-plugin-property-literals@1.0.1";
        "babel-plugin-proto-to-assign@1.0.4" = f "babel-plugin-proto-to-assign" "1.0.4" y "c49e7afd02f577bc4da05ea2df002250cf7cd123" [
          (s."lodash@^3.9.3")
        ];
        "babel-plugin-proto-to-assign@^1.0.3" = s."babel-plugin-proto-to-assign@1.0.4";
        "babel-plugin-react-constant-elements@1.0.3" = f "babel-plugin-react-constant-elements" "1.0.3" y "946736e8378429cbc349dcff62f51c143b34e35a" [];
        "babel-plugin-react-constant-elements@^1.0.3" = s."babel-plugin-react-constant-elements@1.0.3";
        "babel-plugin-react-display-name@1.0.3" = f "babel-plugin-react-display-name" "1.0.3" y "754fe38926e8424a4e7b15ab6ea6139dee0514fc" [];
        "babel-plugin-react-display-name@^1.0.3" = s."babel-plugin-react-display-name@1.0.3";
        "babel-plugin-remove-console@1.0.1" = f "babel-plugin-remove-console" "1.0.1" y "d8f24556c3a05005d42aaaafd27787f53ff013a7" [];
        "babel-plugin-remove-console@^1.0.1" = s."babel-plugin-remove-console@1.0.1";
        "babel-plugin-remove-debugger@1.0.1" = f "babel-plugin-remove-debugger" "1.0.1" y "fd2ea3cd61a428ad1f3b9c89882ff4293e8c14c7" [];
        "babel-plugin-remove-debugger@^1.0.1" = s."babel-plugin-remove-debugger@1.0.1";
        "babel-plugin-runtime@1.0.7" = f "babel-plugin-runtime" "1.0.7" y "bf7c7d966dd56ecd5c17fa1cb253c9acb7e54aaf" [];
        "babel-plugin-runtime@^1.0.7" = s."babel-plugin-runtime@1.0.7";
        "babel-plugin-undeclared-variables-check@1.0.2" = f "babel-plugin-undeclared-variables-check" "1.0.2" y "5cf1aa539d813ff64e99641290af620965f65dee" [
          (s."leven@^1.0.2")
        ];
        "babel-plugin-undeclared-variables-check@^1.0.2" = s."babel-plugin-undeclared-variables-check@1.0.2";
        "babel-plugin-undefined-to-void@1.1.6" = f "babel-plugin-undefined-to-void" "1.1.6" y "7f578ef8b78dfae6003385d8417a61eda06e2f81" [];
        "babel-plugin-undefined-to-void@^1.1.6" = s."babel-plugin-undefined-to-void@1.1.6";
        "babel@5.8.38" = f "babel" "5.8.38" (ir "http://registry.npmjs.org/babel/-/babel-5.8.38.tgz") "dfb087c22894917c576fb67ce9cf328d458629fb" [
          (s."babel-core@^5.6.21")
          (s."chokidar@^1.0.0")
          (s."commander@^2.6.0")
          (s."convert-source-map@^1.1.0")
          (s."fs-readdir-recursive@^0.1.0")
          (s."glob@^5.0.5")
          (s."lodash@^3.2.0")
          (s."output-file-sync@^1.1.0")
          (s."path-exists@^1.0.0")
          (s."path-is-absolute@^1.0.0")
          (s."slash@^1.0.0")
          (s."source-map@^0.5.0")
        ];
        "babel@^5.8.22" = s."babel@5.8.38";
        "babylon@5.8.38" = f "babylon" "5.8.38" y "ec9b120b11bf6ccd4173a18bf217e60b79859ffd" [];
        "babylon@^5.8.38" = s."babylon@5.8.38";
        "balanced-match@1.0.0" = f "balanced-match" "1.0.0" y "89b4d199ab2bee49de164ea02b89ce462d71b767" [];
        "balanced-match@^1.0.0" = s."balanced-match@1.0.0";
        "base64-js@1.3.0" = f "base64-js" "1.3.0" y "cab1e6118f051095e58b5281aea8c1cd22bfc0e3" [];
        "base64-js@^1.0.2" = s."base64-js@1.3.0";
        "base@0.11.2" = f "base" "0.11.2" y "7bde5ced145b6d551a90db87f83c558b4eb48a8f" [
          (s."cache-base@^1.0.1")
          (s."class-utils@^0.3.5")
          (s."component-emitter@^1.2.1")
          (s."define-property@^1.0.0")
          (s."isobject@^3.0.1")
          (s."mixin-deep@^1.2.0")
          (s."pascalcase@^0.1.1")
        ];
        "base@^0.11.1" = s."base@0.11.2";
        "bcrypt-pbkdf@1.0.1" = f "bcrypt-pbkdf" "1.0.1" y "63bc5dcb61331b92bc05fd528953c33462a06f8d" [
          (s."tweetnacl@^0.14.3")
        ];
        "bcrypt-pbkdf@^1.0.0" = s."bcrypt-pbkdf@1.0.1";
        "binary-extensions@1.11.0" = f "binary-extensions" "1.11.0" y "46aa1751fb6a2f93ee5e689bb1087d4b14c6c205" [];
        "binary-extensions@^1.0.0" = s."binary-extensions@1.11.0";
        "block-stream@*" = s."block-stream@0.0.9";
        "block-stream@0.0.9" = f "block-stream" "0.0.9" y "13ebfe778a03205cfe03751481ebb4b3300c126a" [
          (s."inherits@~2.0.0")
        ];
        "bluebird@2.11.0" = f "bluebird" "2.11.0" y "534b9033c022c9579c56ba3b3e5a5caafbb650e1" [];
        "bluebird@3.5.1" = f "bluebird" "3.5.1" y "d9551f9de98f1fcda1e683d17ee91a0602ee2eb9" [];
        "bluebird@^2.9.33" = s."bluebird@2.11.0";
        "bluebird@^2.9.34" = s."bluebird@2.11.0";
        "bluebird@^3.5.0" = s."bluebird@3.5.1";
        "bn.js@4.11.8" = f "bn.js" "4.11.8" y "2cde09eb5ee341f484746bb0309b3253b1b1442f" [];
        "bn.js@^4.0.0" = s."bn.js@4.11.8";
        "bn.js@^4.1.0" = s."bn.js@4.11.8";
        "bn.js@^4.1.1" = s."bn.js@4.11.8";
        "bn.js@^4.4.0" = s."bn.js@4.11.8";
        "boom@4.3.1" = f "boom" "4.3.1" y "4f8a3005cb4a7e3889f749030fd25b96e01d2e31" [
          (s."hoek@4.x.x")
        ];
        "boom@4.x.x" = s."boom@4.3.1";
        "boom@5.2.0" = f "boom" "5.2.0" y "5dd9da6ee3a5f302077436290cb717d3f4a54e02" [
          (s."hoek@4.x.x")
        ];
        "boom@5.x.x" = s."boom@5.2.0";
        "bower@1.8.4" = f "bower" "1.8.4" y "e7876a076deb8137f7d06525dc5e8c66db82f28a" [];
        "bower@^1.7.7" = s."bower@1.8.4";
        "brace-expansion@1.1.11" = f "brace-expansion" "1.1.11" y "3c7fcbf529d87226f3d2f52b966ff5271eb441dd" [
          (s."balanced-match@^1.0.0")
          (s."concat-map@0.0.1")
        ];
        "brace-expansion@^1.0.0" = s."brace-expansion@1.1.11";
        "brace-expansion@^1.1.7" = s."brace-expansion@1.1.11";
        "braces@1.8.5" = f "braces" "1.8.5" y "ba77962e12dff969d6b76711e914b737857bf6a7" [
          (s."expand-range@^1.8.1")
          (s."preserve@^0.2.0")
          (s."repeat-element@^1.1.2")
        ];
        "braces@2.3.2" = f "braces" "2.3.2" y "5979fd3f14cd531565e5fa2df1abfff1dfaee729" [
          (s."arr-flatten@^1.1.0")
          (s."array-unique@^0.3.2")
          (s."extend-shallow@^2.0.1")
          (s."fill-range@^4.0.0")
          (s."isobject@^3.0.1")
          (s."repeat-element@^1.1.2")
          (s."snapdragon@^0.8.1")
          (s."snapdragon-node@^2.0.1")
          (s."split-string@^3.0.2")
          (s."to-regex@^3.0.1")
        ];
        "braces@^1.8.2" = s."braces@1.8.5";
        "braces@^2.3.0" = s."braces@2.3.2";
        "braces@^2.3.1" = s."braces@2.3.2";
        "breakable@1.0.0" = f "breakable" "1.0.0" y "784a797915a38ead27bad456b5572cb4bbaa78c1" [];
        "breakable@~1.0.0" = s."breakable@1.0.0";
        "brorand@1.1.0" = f "brorand" "1.1.0" y "12c25efe40a45e3c323eb8675a0a0ce57b22371f" [];
        "brorand@^1.0.1" = s."brorand@1.1.0";
        "browser-pack@6.1.0" = f "browser-pack" "6.1.0" y "c34ba10d0b9ce162b5af227c7131c92c2ecd5774" [
          (s."JSONStream@^1.0.3")
          (s."combine-source-map@~0.8.0")
          (s."defined@^1.0.0")
          (s."safe-buffer@^5.1.1")
          (s."through2@^2.0.0")
          (s."umd@^3.0.0")
        ];
        "browser-pack@^6.0.1" = s."browser-pack@6.1.0";
        "browser-resolve@1.11.2" = f "browser-resolve" "1.11.2" y "8ff09b0a2c421718a1051c260b32e48f442938ce" [
          (s."resolve@1.1.7")
        ];
        "browser-resolve@^1.11.0" = s."browser-resolve@1.11.2";
        "browser-resolve@^1.7.0" = s."browser-resolve@1.11.2";
        "browser-stdout@1.3.0" = f "browser-stdout" "1.3.0" y "f351d32969d32fa5d7a5567154263d928ae3bd1f" [];
        "browserify-aes@1.2.0" = f "browserify-aes" "1.2.0" y "326734642f403dabc3003209853bb70ad428ef48" [
          (s."buffer-xor@^1.0.3")
          (s."cipher-base@^1.0.0")
          (s."create-hash@^1.1.0")
          (s."evp_bytestokey@^1.0.3")
          (s."inherits@^2.0.1")
          (s."safe-buffer@^5.0.1")
        ];
        "browserify-aes@^1.0.0" = s."browserify-aes@1.2.0";
        "browserify-aes@^1.0.4" = s."browserify-aes@1.2.0";
        "browserify-cache-api@3.0.1" = f "browserify-cache-api" "3.0.1" y "96247e853f068fd6e0d45cc73f0bb2cd9778ef02" [
          (s."async@^1.5.2")
          (s."through2@^2.0.0")
          (s."xtend@^4.0.0")
        ];
        "browserify-cache-api@^3.0.0" = s."browserify-cache-api@3.0.1";
        "browserify-cipher@1.0.1" = f "browserify-cipher" "1.0.1" y "8d6474c1b870bfdabcd3bcfcc1934a10e94f15f0" [
          (s."browserify-aes@^1.0.4")
          (s."browserify-des@^1.0.0")
          (s."evp_bytestokey@^1.0.0")
        ];
        "browserify-cipher@^1.0.0" = s."browserify-cipher@1.0.1";
        "browserify-des@1.0.1" = f "browserify-des" "1.0.1" y "3343124db6d7ad53e26a8826318712bdc8450f9c" [
          (s."cipher-base@^1.0.1")
          (s."des.js@^1.0.0")
          (s."inherits@^2.0.1")
        ];
        "browserify-des@^1.0.0" = s."browserify-des@1.0.1";
        "browserify-incremental@3.1.1" = f "browserify-incremental" "3.1.1" y "0713cb7587247a632a9f08cf1bd169b878b62a8a" [
          (s."JSONStream@^0.10.0")
          (s."browserify-cache-api@^3.0.0")
          (s."through2@^2.0.0")
          (s."xtend@^4.0.0")
        ];
        "browserify-incremental@^3.0.1" = s."browserify-incremental@3.1.1";
        "browserify-rsa@4.0.1" = f "browserify-rsa" "4.0.1" y "21e0abfaf6f2029cf2fafb133567a701d4135524" [
          (s."bn.js@^4.1.0")
          (s."randombytes@^2.0.1")
        ];
        "browserify-rsa@^4.0.0" = s."browserify-rsa@4.0.1";
        "browserify-sign@4.0.4" = f "browserify-sign" "4.0.4" y "aa4eb68e5d7b658baa6bf6a57e630cbd7a93d298" [
          (s."bn.js@^4.1.1")
          (s."browserify-rsa@^4.0.0")
          (s."create-hash@^1.1.0")
          (s."create-hmac@^1.1.2")
          (s."elliptic@^6.0.0")
          (s."inherits@^2.0.1")
          (s."parse-asn1@^5.0.0")
        ];
        "browserify-sign@^4.0.0" = s."browserify-sign@4.0.4";
        "browserify-zlib@0.1.4" = f "browserify-zlib" "0.1.4" y "bb35f8a519f600e0fa6b8485241c979d0141fb2d" [
          (s."pako@~0.2.0")
        ];
        "browserify-zlib@~0.1.2" = s."browserify-zlib@0.1.4";
        "browserify@13.3.0" = f "browserify" "13.3.0" y "b5a9c9020243f0c70e4675bec8223bc627e415ce" [
          (s."JSONStream@^1.0.3")
          (s."assert@^1.4.0")
          (s."browser-pack@^6.0.1")
          (s."browser-resolve@^1.11.0")
          (s."browserify-zlib@~0.1.2")
          (s."buffer@^4.1.0")
          (s."cached-path-relative@^1.0.0")
          (s."concat-stream@~1.5.1")
          (s."console-browserify@^1.1.0")
          (s."constants-browserify@~1.0.0")
          (s."crypto-browserify@^3.0.0")
          (s."defined@^1.0.0")
          (s."deps-sort@^2.0.0")
          (s."domain-browser@~1.1.0")
          (s."duplexer2@~0.1.2")
          (s."events@~1.1.0")
          (s."glob@^7.1.0")
          (s."has@^1.0.0")
          (s."htmlescape@^1.1.0")
          (s."https-browserify@~0.0.0")
          (s."inherits@~2.0.1")
          (s."insert-module-globals@^7.0.0")
          (s."labeled-stream-splicer@^2.0.0")
          (s."module-deps@^4.0.8")
          (s."os-browserify@~0.1.1")
          (s."parents@^1.0.1")
          (s."path-browserify@~0.0.0")
          (s."process@~0.11.0")
          (s."punycode@^1.3.2")
          (s."querystring-es3@~0.2.0")
          (s."read-only-stream@^2.0.0")
          (s."readable-stream@^2.0.2")
          (s."resolve@^1.1.4")
          (s."shasum@^1.0.0")
          (s."shell-quote@^1.6.1")
          (s."stream-browserify@^2.0.0")
          (s."stream-http@^2.0.0")
          (s."string_decoder@~0.10.0")
          (s."subarg@^1.0.0")
          (s."syntax-error@^1.1.1")
          (s."through2@^2.0.0")
          (s."timers-browserify@^1.0.1")
          (s."tty-browserify@~0.0.0")
          (s."url@~0.11.0")
          (s."util@~0.10.1")
          (s."vm-browserify@~0.0.1")
          (s."xtend@^4.0.0")
        ];
        "browserify@^13.1.0" = s."browserify@13.3.0";
        "buffer-crc32@0.2.13" = f "buffer-crc32" "0.2.13" y "0d333e3f00eac50aa1454abd30ef8c2a5d9a7242" [];
        "buffer-crc32@^0.2.5" = s."buffer-crc32@0.2.13";
        "buffer-from@1.0.0" = f "buffer-from" "1.0.0" y "4cb8832d23612589b0406e9e2956c17f06fdf531" [];
        "buffer-from@^1.0.0" = s."buffer-from@1.0.0";
        "buffer-xor@1.0.3" = f "buffer-xor" "1.0.3" y "26e61ed1422fb70dd42e6e36729ed51d855fe8d9" [];
        "buffer-xor@^1.0.3" = s."buffer-xor@1.0.3";
        "buffer@4.9.1" = f "buffer" "4.9.1" y "6d1bb601b07a4efced97094132093027c95bc298" [
          (s."base64-js@^1.0.2")
          (s."ieee754@^1.1.4")
          (s."isarray@^1.0.0")
        ];
        "buffer@^4.1.0" = s."buffer@4.9.1";
        "builtin-modules@1.1.1" = f "builtin-modules" "1.1.1" y "270f076c5a72c02f5b65a47df94c5fe3a278892f" [];
        "builtin-modules@^1.0.0" = s."builtin-modules@1.1.1";
        "builtin-status-codes@3.0.0" = f "builtin-status-codes" "3.0.0" y "85982878e21b98e1c66425e03d0174788f569ee8" [];
        "builtin-status-codes@^3.0.0" = s."builtin-status-codes@3.0.0";
        "cache-base@1.0.1" = f "cache-base" "1.0.1" y "0a7f46416831c8b662ee36fe4e7c59d76f666ab2" [
          (s."collection-visit@^1.0.0")
          (s."component-emitter@^1.2.1")
          (s."get-value@^2.0.6")
          (s."has-value@^1.0.0")
          (s."isobject@^3.0.1")
          (s."set-value@^2.0.0")
          (s."to-object-path@^0.3.0")
          (s."union-value@^1.0.0")
          (s."unset-value@^1.0.0")
        ];
        "cache-base@^1.0.1" = s."cache-base@1.0.1";
        "cached-path-relative@1.0.1" = f "cached-path-relative" "1.0.1" y "d09c4b52800aa4c078e2dd81a869aac90d2e54e7" [];
        "cached-path-relative@^1.0.0" = s."cached-path-relative@1.0.1";
        "camelcase-keys@2.1.0" = f "camelcase-keys" "2.1.0" y "308beeaffdf28119051efa1d932213c91b8f92e7" [
          (s."camelcase@^2.0.0")
          (s."map-obj@^1.0.0")
        ];
        "camelcase-keys@^2.0.0" = s."camelcase-keys@2.1.0";
        "camelcase@1.2.1" = f "camelcase" "1.2.1" y "9bb5304d2e0b56698b2c758b08a3eaa9daa58a39" [];
        "camelcase@2.1.1" = f "camelcase" "2.1.1" y "7c1d16d679a1bbe59ca02cacecfb011e201f5a1f" [];
        "camelcase@^1.2.1" = s."camelcase@1.2.1";
        "camelcase@^2.0.0" = s."camelcase@2.1.1";
        "capture-stack-trace@1.0.0" = f "capture-stack-trace" "1.0.0" y "4a6fa07399c26bba47f0b2496b4d0fb408c5550d" [];
        "capture-stack-trace@^1.0.0" = s."capture-stack-trace@1.0.0";
        "caseless@0.12.0" = f "caseless" "0.12.0" y "1b681c21ff84033c826543090689420d187151dc" [];
        "caseless@~0.12.0" = s."caseless@0.12.0";
        "center-align@0.1.3" = f "center-align" "0.1.3" y "aa0d32629b6ee972200411cbd4461c907bc2b7ad" [
          (s."align-text@^0.1.3")
          (s."lazy-cache@^1.0.3")
        ];
        "center-align@^0.1.1" = s."center-align@0.1.3";
        "chai@3.5.0" = f "chai" "3.5.0" y "4d02637b067fe958bdbfdd3a40ec56fef7373247" [
          (s."assertion-error@^1.0.1")
          (s."deep-eql@^0.1.3")
          (s."type-detect@^1.0.0")
        ];
        "chai@^3.4.1" = s."chai@3.5.0";
        "chalk@1.1.3" = f "chalk" "1.1.3" y "a8115c55e4a702fe4d150abd3872822a7e09fc98" [
          (s."ansi-styles@^2.2.1")
          (s."escape-string-regexp@^1.0.2")
          (s."has-ansi@^2.0.0")
          (s."strip-ansi@^3.0.0")
          (s."supports-color@^2.0.0")
        ];
        "chalk@^1.0.0" = s."chalk@1.1.3";
        "chokidar@1.7.0" = f "chokidar" "1.7.0" y "798e689778151c8076b4b360e5edd28cda2bb468" [
          (s."anymatch@^1.3.0")
          (s."async-each@^1.0.0")
          (s."glob-parent@^2.0.0")
          (s."inherits@^2.0.1")
          (s."is-binary-path@^1.0.0")
          (s."is-glob@^2.0.0")
          (s."path-is-absolute@^1.0.0")
          (s."readdirp@^2.0.0")
          (s."fsevents@^1.0.0")
        ];
        "chokidar@2.0.3" = f "chokidar" "2.0.3" y "dcbd4f6cbb2a55b4799ba8a840ac527e5f4b1176" [
          (s."anymatch@^2.0.0")
          (s."async-each@^1.0.0")
          (s."braces@^2.3.0")
          (s."glob-parent@^3.1.0")
          (s."inherits@^2.0.1")
          (s."is-binary-path@^1.0.0")
          (s."is-glob@^4.0.0")
          (s."normalize-path@^2.1.1")
          (s."path-is-absolute@^1.0.0")
          (s."readdirp@^2.0.0")
          (s."upath@^1.0.0")
          (s."fsevents@^1.1.2")
        ];
        "chokidar@^1.0.0" = s."chokidar@1.7.0";
        "chokidar@^2.0.2" = s."chokidar@2.0.3";
        "chownr@1.0.1" = f "chownr" "1.0.1" y "e2a75042a9551908bebd25b8523d5f9769d79181" [];
        "chownr@^1.0.1" = s."chownr@1.0.1";
        "cipher-base@1.0.4" = f "cipher-base" "1.0.4" y "8760e4ecc272f4c363532f926d874aae2c1397de" [
          (s."inherits@^2.0.1")
          (s."safe-buffer@^5.0.1")
        ];
        "cipher-base@^1.0.0" = s."cipher-base@1.0.4";
        "cipher-base@^1.0.1" = s."cipher-base@1.0.4";
        "cipher-base@^1.0.3" = s."cipher-base@1.0.4";
        "class-utils@0.3.6" = f "class-utils" "0.3.6" y "f93369ae8b9a7ce02fd41faad0ca83033190c463" [
          (s."arr-union@^3.1.0")
          (s."define-property@^0.2.5")
          (s."isobject@^3.0.0")
          (s."static-extend@^0.1.1")
        ];
        "class-utils@^0.3.5" = s."class-utils@0.3.6";
        "cli@1.0.1" = f "cli" "1.0.1" y "22817534f24bfa4950c34d532d48ecbc621b8c14" [
          (s."exit@0.1.2")
          (s."glob@^7.1.1")
        ];
        "cli@~1.0.0" = s."cli@1.0.1";
        "cliparse@0.2.8" = f "cliparse" "0.2.8" y "a50f96349e12cac4a009606b212f7a55c67d10af" [
          (s."bluebird@^3.5.0")
          (s."lodash@^4.17.4")
          (s."minimist@^1.2.0")
        ];
        "cliparse@^0.2.6" = s."cliparse@0.2.8";
        "cliui@2.1.0" = f "cliui" "2.1.0" y "4b475760ff80264c762c3a1719032e91c7fea0d1" [
          (s."center-align@^0.1.1")
          (s."right-align@^0.1.1")
          (s."wordwrap@0.0.2")
        ];
        "cliui@^2.1.0" = s."cliui@2.1.0";
        "co@4.6.0" = f "co" "4.6.0" y "6ea6bdf3d853ae54ccb8e47bfa0bf3f9031fb184" [];
        "co@^4.6.0" = s."co@4.6.0";
        "code-point-at@1.1.0" = f "code-point-at" "1.1.0" y "0d070b4d043a5bea33a2f1a40e2edb3d9a4ccf77" [];
        "code-point-at@^1.0.0" = s."code-point-at@1.1.0";
        "collection-visit@1.0.0" = f "collection-visit" "1.0.0" y "4bc0373c164bc3291b4d368c829cf1a80a59dca0" [
          (s."map-visit@^1.0.0")
          (s."object-visit@^1.0.0")
        ];
        "collection-visit@^1.0.0" = s."collection-visit@1.0.0";
        "colors@1.2.3" = f "colors" "1.2.3" y "1b152a9c4f6c9f74bc4bb96233ad0b7983b79744" [];
        "colors@>=0.6.0" = s."colors@1.2.3";
        "combine-source-map@0.8.0" = f "combine-source-map" "0.8.0" y "a58d0df042c186fcf822a8e8015f5450d2d79a8b" [
          (s."convert-source-map@~1.1.0")
          (s."inline-source-map@~0.6.0")
          (s."lodash.memoize@~3.0.3")
          (s."source-map@~0.5.3")
        ];
        "combine-source-map@^0.8.0" = s."combine-source-map@0.8.0";
        "combine-source-map@~0.8.0" = s."combine-source-map@0.8.0";
        "combined-stream@1.0.6" = f "combined-stream" "1.0.6" y "723e7df6e801ac5613113a7e445a9b69cb632818" [
          (s."delayed-stream@~1.0.0")
        ];
        "combined-stream@~1.0.5" = s."combined-stream@1.0.6";
        "commander@2.15.1" = f "commander" "2.15.1" y "df46e867d0fc2aec66a34662b406a9ccafff5b0f" [];
        "commander@2.9.0" = f "commander" "2.9.0" y "9c99094176e12240cb22d6c5146098400fe0f7d4" [
          (s."graceful-readlink@>= 1.0.0")
        ];
        "commander@^2.5.0" = s."commander@2.15.1";
        "commander@^2.6.0" = s."commander@2.15.1";
        "commoner@0.10.8" = f "commoner" "0.10.8" y "34fc3672cd24393e8bb47e70caa0293811f4f2c5" [
          (s."commander@^2.5.0")
          (s."detective@^4.3.1")
          (s."glob@^5.0.15")
          (s."graceful-fs@^4.1.2")
          (s."iconv-lite@^0.4.5")
          (s."mkdirp@^0.5.0")
          (s."private@^0.1.6")
          (s."q@^1.1.2")
          (s."recast@^0.11.17")
        ];
        "commoner@~0.10.3" = s."commoner@0.10.8";
        "component-emitter@1.2.1" = f "component-emitter" "1.2.1" y "137918d6d78283f7df7a6b7c5a63e140e69425e6" [];
        "component-emitter@^1.2.1" = s."component-emitter@1.2.1";
        "concat-map@0.0.1" = f "concat-map" "0.0.1" y "d8a96bd77fd68df7793a73036a3ba0d5405d477b" [];
        "concat-stream@1.5.2" = f "concat-stream" "1.5.2" y "708978624d856af41a5a741defdd261da752c266" [
          (s."inherits@~2.0.1")
          (s."readable-stream@~2.0.0")
          (s."typedarray@~0.0.5")
        ];
        "concat-stream@1.6.2" = f "concat-stream" "1.6.2" y "904bdf194cd3122fc675c77fc4ac3d4ff0fd1a34" [
          (s."buffer-from@^1.0.0")
          (s."inherits@^2.0.3")
          (s."readable-stream@^2.2.2")
          (s."typedarray@^0.0.6")
        ];
        "concat-stream@^1.4.6" = s."concat-stream@1.6.2";
        "concat-stream@^1.6.1" = s."concat-stream@1.6.2";
        "concat-stream@~1.5.0" = s."concat-stream@1.5.2";
        "concat-stream@~1.5.1" = s."concat-stream@1.5.2";
        "console-browserify@1.1.0" = f "console-browserify" "1.1.0" y "f0241c45730a9fc6323b206dbf38edc741d0bb10" [
          (s."date-now@^0.1.4")
        ];
        "console-browserify@1.1.x" = s."console-browserify@1.1.0";
        "console-browserify@^1.1.0" = s."console-browserify@1.1.0";
        "console-control-strings@1.1.0" = f "console-control-strings" "1.1.0" y "3d7cf4464db6446ea644bf4b39507f9851008e8e" [];
        "console-control-strings@^1.0.0" = s."console-control-strings@1.1.0";
        "console-control-strings@~1.1.0" = s."console-control-strings@1.1.0";
        "constants-browserify@1.0.0" = f "constants-browserify" "1.0.0" y "c20b96d8c617748aaf1c16021760cd27fcb8cb75" [];
        "constants-browserify@~1.0.0" = s."constants-browserify@1.0.0";
        "convert-source-map@1.1.3" = f "convert-source-map" "1.1.3" y "4829c877e9fe49b3161f3bf3673888e204699860" [];
        "convert-source-map@1.5.1" = f "convert-source-map" "1.5.1" y "b8278097b9bc229365de5c62cf5fcaed8b5599e5" [];
        "convert-source-map@^1.1.0" = s."convert-source-map@1.5.1";
        "convert-source-map@~1.1.0" = s."convert-source-map@1.1.3";
        "copy-descriptor@0.1.1" = f "copy-descriptor" "0.1.1" y "676f6eb3c39997c2ee1ac3a924fd6124748f578d" [];
        "copy-descriptor@^0.1.0" = s."copy-descriptor@0.1.1";
        "core-js@1.2.7" = f "core-js" "1.2.7" y "652294c14651db28fa93bd2d5ff2983a4f08c636" [];
        "core-js@^1.0.0" = s."core-js@1.2.7";
        "core-util-is@1.0.2" = f "core-util-is" "1.0.2" y "b5fd54220aa2bc5ab57aab7140c940754503c1a7" [];
        "core-util-is@~1.0.0" = s."core-util-is@1.0.2";
        "create-ecdh@4.0.1" = f "create-ecdh" "4.0.1" y "44223dfed533193ba5ba54e0df5709b89acf1f82" [
          (s."bn.js@^4.1.0")
          (s."elliptic@^6.0.0")
        ];
        "create-ecdh@^4.0.0" = s."create-ecdh@4.0.1";
        "create-error-class@2.0.1" = f "create-error-class" "2.0.1" y "a8759ed5c8d214a461e81d18e70aacb33dd63c9c" [
          (s."capture-stack-trace@^1.0.0")
          (s."inherits@^2.0.1")
        ];
        "create-error-class@^2.0.0" = s."create-error-class@2.0.1";
        "create-hash@1.2.0" = f "create-hash" "1.2.0" y "889078af11a63756bcfb59bd221996be3a9ef196" [
          (s."cipher-base@^1.0.1")
          (s."inherits@^2.0.1")
          (s."md5.js@^1.3.4")
          (s."ripemd160@^2.0.1")
          (s."sha.js@^2.4.0")
        ];
        "create-hash@^1.1.0" = s."create-hash@1.2.0";
        "create-hash@^1.1.2" = s."create-hash@1.2.0";
        "create-hmac@1.1.7" = f "create-hmac" "1.1.7" y "69170c78b3ab957147b2b8b04572e47ead2243ff" [
          (s."cipher-base@^1.0.3")
          (s."create-hash@^1.1.0")
          (s."inherits@^2.0.1")
          (s."ripemd160@^2.0.0")
          (s."safe-buffer@^5.0.1")
          (s."sha.js@^2.4.8")
        ];
        "create-hmac@^1.1.0" = s."create-hmac@1.1.7";
        "create-hmac@^1.1.2" = s."create-hmac@1.1.7";
        "create-hmac@^1.1.4" = s."create-hmac@1.1.7";
        "cryptiles@3.1.2" = f "cryptiles" "3.1.2" y "a89fbb220f5ce25ec56e8c4aa8a4fd7b5b0d29fe" [
          (s."boom@5.x.x")
        ];
        "cryptiles@3.x.x" = s."cryptiles@3.1.2";
        "crypto-browserify@3.12.0" = f "crypto-browserify" "3.12.0" y "396cf9f3137f03e4b8e532c58f698254e00f80ec" [
          (s."browserify-cipher@^1.0.0")
          (s."browserify-sign@^4.0.0")
          (s."create-ecdh@^4.0.0")
          (s."create-hash@^1.1.0")
          (s."create-hmac@^1.1.0")
          (s."diffie-hellman@^5.0.0")
          (s."inherits@^2.0.1")
          (s."pbkdf2@^3.0.3")
          (s."public-encrypt@^4.0.0")
          (s."randombytes@^2.0.0")
          (s."randomfill@^1.0.3")
        ];
        "crypto-browserify@^3.0.0" = s."crypto-browserify@3.12.0";
        "currently-unhandled@0.4.1" = f "currently-unhandled" "0.4.1" y "988df33feab191ef799a61369dd76c17adf957ea" [
          (s."array-find-index@^1.0.1")
        ];
        "currently-unhandled@^0.4.1" = s."currently-unhandled@0.4.1";
        "dashdash@1.14.1" = f "dashdash" "1.14.1" y "853cfa0f7cbe2fed5de20326b8dd581035f6e2f0" [
          (s."assert-plus@^1.0.0")
        ];
        "dashdash@^1.12.0" = s."dashdash@1.14.1";
        "date-now@0.1.4" = f "date-now" "0.1.4" y "eaf439fd4d4848ad74e5cc7dbef200672b9e345b" [];
        "date-now@^0.1.4" = s."date-now@0.1.4";
        "debug@2.6.8" = f "debug" "2.6.8" y "e731531ca2ede27d188222427da17821d68ff4fc" [
          (s."ms@2.0.0")
        ];
        "debug@2.6.9" = f "debug" "2.6.9" y "5d128515df134ff327e90a4c93f4e077a536341f" [
          (s."ms@2.0.0")
        ];
        "debug@^2.1.1" = s."debug@2.6.9";
        "debug@^2.1.2" = s."debug@2.6.9";
        "debug@^2.1.3" = s."debug@2.6.9";
        "debug@^2.2.0" = s."debug@2.6.9";
        "debug@^2.3.3" = s."debug@2.6.9";
        "decamelize@1.2.0" = f "decamelize" "1.2.0" y "f6534d15148269b20352e7bee26f501f9a191290" [];
        "decamelize@^1.0.0" = s."decamelize@1.2.0";
        "decamelize@^1.1.2" = s."decamelize@1.2.0";
        "decode-uri-component@0.2.0" = f "decode-uri-component" "0.2.0" y "eb3913333458775cb84cd1a1fae062106bb87545" [];
        "decode-uri-component@^0.2.0" = s."decode-uri-component@0.2.0";
        "deep-eql@0.1.3" = f "deep-eql" "0.1.3" y "ef558acab8de25206cd713906d74e56930eb69f2" [
          (s."type-detect@0.1.1")
        ];
        "deep-eql@^0.1.3" = s."deep-eql@0.1.3";
        "deep-extend@0.5.1" = f "deep-extend" "0.5.1" y "b894a9dd90d3023fbf1c55a394fb858eb2066f1f" [];
        "deep-extend@^0.5.1" = s."deep-extend@0.5.1";
        "define-property@0.2.5" = f "define-property" "0.2.5" y "c35b1ef918ec3c990f9a5bc57be04aacec5c8116" [
          (s."is-descriptor@^0.1.0")
        ];
        "define-property@1.0.0" = f "define-property" "1.0.0" y "769ebaaf3f4a63aad3af9e8d304c9bbe79bfb0e6" [
          (s."is-descriptor@^1.0.0")
        ];
        "define-property@2.0.2" = f "define-property" "2.0.2" y "d459689e8d654ba77e02a817f8710d702cb16e9d" [
          (s."is-descriptor@^1.0.2")
          (s."isobject@^3.0.1")
        ];
        "define-property@^0.2.5" = s."define-property@0.2.5";
        "define-property@^1.0.0" = s."define-property@1.0.0";
        "define-property@^2.0.2" = s."define-property@2.0.2";
        "defined@1.0.0" = f "defined" "1.0.0" y "c98d9bcef75674188e110969151199e39b1fa693" [];
        "defined@^1.0.0" = s."defined@1.0.0";
        "defs@1.1.1" = f "defs" "1.1.1" y "b22609f2c7a11ba7a3db116805c139b1caffa9d2" [
          (s."alter@~0.2.0")
          (s."ast-traverse@~0.1.1")
          (s."breakable@~1.0.0")
          (s."esprima-fb@~15001.1001.0-dev-harmony-fb")
          (s."simple-fmt@~0.1.0")
          (s."simple-is@~0.2.0")
          (s."stringmap@~0.2.2")
          (s."stringset@~0.2.1")
          (s."tryor@~0.1.2")
          (s."yargs@~3.27.0")
        ];
        "defs@~1.1.0" = s."defs@1.1.1";
        "delayed-stream@1.0.0" = f "delayed-stream" "1.0.0" y "df3ae199acadfb7d440aaae0b29e2272b24ec619" [];
        "delayed-stream@~1.0.0" = s."delayed-stream@1.0.0";
        "delegates@1.0.0" = f "delegates" "1.0.0" y "84c6e159b81904fdca59a0ef44cd870d31250f9a" [];
        "delegates@^1.0.0" = s."delegates@1.0.0";
        "deps-sort@2.0.0" = f "deps-sort" "2.0.0" y "091724902e84658260eb910748cccd1af6e21fb5" [
          (s."JSONStream@^1.0.3")
          (s."shasum@^1.0.0")
          (s."subarg@^1.0.0")
          (s."through2@^2.0.0")
        ];
        "deps-sort@^2.0.0" = s."deps-sort@2.0.0";
        "des.js@1.0.0" = f "des.js" "1.0.0" y "c074d2e2aa6a8a9a07dbd61f9a15c2cd83ec8ecc" [
          (s."inherits@^2.0.1")
          (s."minimalistic-assert@^1.0.0")
        ];
        "des.js@^1.0.0" = s."des.js@1.0.0";
        "detect-indent@3.0.1" = f "detect-indent" "3.0.1" y "9dc5e5ddbceef8325764b9451b02bc6d54084f75" [
          (s."get-stdin@^4.0.1")
          (s."minimist@^1.1.0")
          (s."repeating@^1.1.0")
        ];
        "detect-indent@^3.0.0" = s."detect-indent@3.0.1";
        "detect-libc@1.0.3" = f "detect-libc" "1.0.3" y "fa137c4bd698edf55cd5cd02ac559f91a4c4ba9b" [];
        "detect-libc@^1.0.2" = s."detect-libc@1.0.3";
        "detective@4.7.1" = f "detective" "4.7.1" y "0eca7314338442febb6d65da54c10bb1c82b246e" [
          (s."acorn@^5.2.1")
          (s."defined@^1.0.0")
        ];
        "detective@^4.0.0" = s."detective@4.7.1";
        "detective@^4.3.1" = s."detective@4.7.1";
        "diff@3.2.0" = f "diff" "3.2.0" y "c9ce393a4b7cbd0b058a725c93df299027868ff9" [];
        "diffie-hellman@5.0.3" = f "diffie-hellman" "5.0.3" y "40e8ee98f55a2149607146921c63e1ae5f3d2875" [
          (s."bn.js@^4.1.0")
          (s."miller-rabin@^4.0.0")
          (s."randombytes@^2.0.0")
        ];
        "diffie-hellman@^5.0.0" = s."diffie-hellman@5.0.3";
        "dom-serializer@0" = s."dom-serializer@0.1.0";
        "dom-serializer@0.1.0" = f "dom-serializer" "0.1.0" y "073c697546ce0780ce23be4a28e293e40bc30c82" [
          (s."domelementtype@~1.1.1")
          (s."entities@~1.1.1")
        ];
        "domain-browser@1.1.7" = f "domain-browser" "1.1.7" y "867aa4b093faa05f1de08c06f4d7b21fdf8698bc" [];
        "domain-browser@~1.1.0" = s."domain-browser@1.1.7";
        "domelementtype@1" = s."domelementtype@1.3.0";
        "domelementtype@1.1.3" = f "domelementtype" "1.1.3" y "bd28773e2642881aec51544924299c5cd822185b" [];
        "domelementtype@1.3.0" = f "domelementtype" "1.3.0" y "b17aed82e8ab59e52dd9c19b1756e0fc187204c2" [];
        "domelementtype@~1.1.1" = s."domelementtype@1.1.3";
        "domhandler@2.3" = s."domhandler@2.3.0";
        "domhandler@2.3.0" = f "domhandler" "2.3.0" y "2de59a0822d5027fabff6f032c2b25a2a8abe738" [
          (s."domelementtype@1")
        ];
        "domutils@1.5" = s."domutils@1.5.1";
        "domutils@1.5.1" = f "domutils" "1.5.1" y "dcd8488a26f563d61079e48c9f7b7e32373682cf" [
          (s."dom-serializer@0")
          (s."domelementtype@1")
        ];
        "duplexer2@0.1.4" = f "duplexer2" "0.1.4" y "8b12dab878c0d69e3e7891051662a32fc6bddcc1" [
          (s."readable-stream@^2.0.2")
        ];
        "duplexer2@^0.1.2" = s."duplexer2@0.1.4";
        "duplexer2@~0.1.0" = s."duplexer2@0.1.4";
        "duplexer2@~0.1.2" = s."duplexer2@0.1.4";
        "duplexify@3.5.4" = f "duplexify" "3.5.4" y "4bb46c1796eabebeec4ca9a2e66b808cb7a3d8b4" [
          (s."end-of-stream@^1.0.0")
          (s."inherits@^2.0.1")
          (s."readable-stream@^2.0.0")
          (s."stream-shift@^1.0.0")
        ];
        "duplexify@^3.2.0" = s."duplexify@3.5.4";
        "ecc-jsbn@0.1.1" = f "ecc-jsbn" "0.1.1" y "0fc73a9ed5f0d53c38193398523ef7e543777505" [
          (s."jsbn@~0.1.0")
        ];
        "ecc-jsbn@~0.1.1" = s."ecc-jsbn@0.1.1";
        "elliptic@6.4.0" = f "elliptic" "6.4.0" y "cac9af8762c85836187003c8dfe193e5e2eae5df" [
          (s."bn.js@^4.4.0")
          (s."brorand@^1.0.1")
          (s."hash.js@^1.0.0")
          (s."hmac-drbg@^1.0.0")
          (s."inherits@^2.0.1")
          (s."minimalistic-assert@^1.0.0")
          (s."minimalistic-crypto-utils@^1.0.0")
        ];
        "elliptic@^6.0.0" = s."elliptic@6.4.0";
        "end-of-stream@1.4.1" = f "end-of-stream" "1.4.1" y "ed29634d19baba463b6ce6b80a37213eab71ec43" [
          (s."once@^1.4.0")
        ];
        "end-of-stream@^1.0.0" = s."end-of-stream@1.4.1";
        "entities@1.0" = s."entities@1.0.0";
        "entities@1.0.0" = f "entities" "1.0.0" y "b2987aa3821347fcde642b24fdfc9e4fb712bf26" [];
        "entities@1.1.1" = f "entities" "1.1.1" y "6e5c2d0a5621b5dadaecef80b90edfb5cd7772f0" [];
        "entities@~1.1.1" = s."entities@1.1.1";
        "error-ex@1.3.1" = f "error-ex" "1.3.1" y "f855a86ce61adc4e8621c3cda21e7a7612c3a8dc" [
          (s."is-arrayish@^0.2.1")
        ];
        "error-ex@^1.2.0" = s."error-ex@1.3.1";
        "es6-promise@3.3.1" = f "es6-promise" "3.3.1" y "a08cdde84ccdbf34d027a1451bc91d4bcd28a613" [];
        "es6-promise@^3.1.2" = s."es6-promise@3.3.1";
        "escape-string-regexp@1.0.5" = f "escape-string-regexp" "1.0.5" y "1b61c0562190a8dff6ae3bb2cf0200ca130b86d4" [];
        "escape-string-regexp@^1.0.2" = s."escape-string-regexp@1.0.5";
        "esprima-fb@15001.1001.0-dev-harmony-fb" = f "esprima-fb" "15001.1001.0-dev-harmony-fb" y "43beb57ec26e8cf237d3dd8b33e42533577f2659" [];
        "esprima-fb@~15001.1001.0-dev-harmony-fb" = s."esprima-fb@15001.1001.0-dev-harmony-fb";
        "esprima@2.7.3" = f "esprima" "2.7.3" y "96e3b70d5779f6ad49cd032673d1c312767ba581" [];
        "esprima@3.1.3" = f "esprima" "3.1.3" y "fdca51cee6133895e3c88d535ce49dbff62a4633" [];
        "esprima@^2.6.0" = s."esprima@2.7.3";
        "esprima@~3.1.0" = s."esprima@3.1.3";
        "esutils@2.0.2" = f "esutils" "2.0.2" y "0abf4f1caa5bcb1f7a9d8acc6dea4faaa04bac9b" [];
        "esutils@^2.0.0" = s."esutils@2.0.2";
        "events@1.1.1" = f "events" "1.1.1" y "9ebdb7635ad099c70dcc4c2a1f5004288e8bd924" [];
        "events@~1.1.0" = s."events@1.1.1";
        "evp_bytestokey@1.0.3" = f "evp_bytestokey" "1.0.3" y "7fcbdb198dc71959432efe13842684e0525acb02" [
          (s."md5.js@^1.3.4")
          (s."safe-buffer@^5.1.1")
        ];
        "evp_bytestokey@^1.0.0" = s."evp_bytestokey@1.0.3";
        "evp_bytestokey@^1.0.3" = s."evp_bytestokey@1.0.3";
        "exit@0.1.2" = f "exit" "0.1.2" y "0632638f8d877cc82107d30a0fff1a17cba1cd0c" [];
        "exit@0.1.x" = s."exit@0.1.2";
        "expand-brackets@0.1.5" = f "expand-brackets" "0.1.5" y "df07284e342a807cd733ac5af72411e581d1177b" [
          (s."is-posix-bracket@^0.1.0")
        ];
        "expand-brackets@2.1.4" = f "expand-brackets" "2.1.4" y "b77735e315ce30f6b6eff0f83b04151a22449622" [
          (s."debug@^2.3.3")
          (s."define-property@^0.2.5")
          (s."extend-shallow@^2.0.1")
          (s."posix-character-classes@^0.1.0")
          (s."regex-not@^1.0.0")
          (s."snapdragon@^0.8.1")
          (s."to-regex@^3.0.1")
        ];
        "expand-brackets@^0.1.4" = s."expand-brackets@0.1.5";
        "expand-brackets@^2.1.4" = s."expand-brackets@2.1.4";
        "expand-range@1.8.2" = f "expand-range" "1.8.2" y "a299effd335fe2721ebae8e257ec79644fc85337" [
          (s."fill-range@^2.1.0")
        ];
        "expand-range@^1.8.1" = s."expand-range@1.8.2";
        "extend-shallow@2.0.1" = f "extend-shallow" "2.0.1" y "51af7d614ad9a9f610ea1bafbb989d6b1c56890f" [
          (s."is-extendable@^0.1.0")
        ];
        "extend-shallow@3.0.2" = f "extend-shallow" "3.0.2" y "26a71aaf073b39fb2127172746131c2704028db8" [
          (s."assign-symbols@^1.0.0")
          (s."is-extendable@^1.0.1")
        ];
        "extend-shallow@^2.0.1" = s."extend-shallow@2.0.1";
        "extend-shallow@^3.0.0" = s."extend-shallow@3.0.2";
        "extend-shallow@^3.0.2" = s."extend-shallow@3.0.2";
        "extend@3.0.1" = f "extend" "3.0.1" y "a755ea7bc1adfcc5a31ce7e762dbaadc5e636444" [];
        "extend@~3.0.1" = s."extend@3.0.1";
        "extglob@0.3.2" = f "extglob" "0.3.2" y "2e18ff3d2f49ab2765cec9023f011daa8d8349a1" [
          (s."is-extglob@^1.0.0")
        ];
        "extglob@2.0.4" = f "extglob" "2.0.4" y "ad00fe4dc612a9232e8718711dc5cb5ab0285543" [
          (s."array-unique@^0.3.2")
          (s."define-property@^1.0.0")
          (s."expand-brackets@^2.1.4")
          (s."extend-shallow@^2.0.1")
          (s."fragment-cache@^0.2.1")
          (s."regex-not@^1.0.0")
          (s."snapdragon@^0.8.1")
          (s."to-regex@^3.0.1")
        ];
        "extglob@^0.3.1" = s."extglob@0.3.2";
        "extglob@^2.0.4" = s."extglob@2.0.4";
        "extsprintf@1.3.0" = f "extsprintf" "1.3.0" y "96918440e3041a7a414f8c52e3c574eb3c3e1e05" [];
        "extsprintf@1.4.0" = f "extsprintf" "1.4.0" y "e2689f8f356fad62cca65a3a91c5df5f9551692f" [];
        "extsprintf@^1.2.0" = s."extsprintf@1.4.0";
        "fast-deep-equal@1.1.0" = f "fast-deep-equal" "1.1.0" y "c053477817c86b51daa853c81e059b733d023614" [];
        "fast-deep-equal@^1.0.0" = s."fast-deep-equal@1.1.0";
        "fast-json-stable-stringify@2.0.0" = f "fast-json-stable-stringify" "2.0.0" y "d5142c0caee6b1189f87d3a76111064f86c8bbf2" [];
        "fast-json-stable-stringify@^2.0.0" = s."fast-json-stable-stringify@2.0.0";
        "filename-regex@2.0.1" = f "filename-regex" "2.0.1" y "c1c4b9bee3e09725ddb106b75c1e301fe2f18b26" [];
        "filename-regex@^2.0.0" = s."filename-regex@2.0.1";
        "fill-range@2.2.3" = f "fill-range" "2.2.3" y "50b77dfd7e469bc7492470963699fe7a8485a723" [
          (s."is-number@^2.1.0")
          (s."isobject@^2.0.0")
          (s."randomatic@^1.1.3")
          (s."repeat-element@^1.1.2")
          (s."repeat-string@^1.5.2")
        ];
        "fill-range@4.0.0" = f "fill-range" "4.0.0" y "d544811d428f98eb06a63dc402d2403c328c38f7" [
          (s."extend-shallow@^2.0.1")
          (s."is-number@^3.0.0")
          (s."repeat-string@^1.6.1")
          (s."to-regex-range@^2.1.0")
        ];
        "fill-range@^2.1.0" = s."fill-range@2.2.3";
        "fill-range@^4.0.0" = s."fill-range@4.0.0";
        "find-up@1.1.2" = f "find-up" "1.1.2" y "6b2e9822b1a2ce0a60ab64d610eccad53cb24d0f" [
          (s."path-exists@^2.0.0")
          (s."pinkie-promise@^2.0.0")
        ];
        "find-up@^1.0.0" = s."find-up@1.1.2";
        "for-in@1.0.2" = f "for-in" "1.0.2" y "81068d295a8142ec0ac726c6e2200c30fb6d5e80" [];
        "for-in@^1.0.1" = s."for-in@1.0.2";
        "for-in@^1.0.2" = s."for-in@1.0.2";
        "for-own@0.1.5" = f "for-own" "0.1.5" y "5265c681a4f294dabbf17c9509b6763aa84510ce" [
          (s."for-in@^1.0.1")
        ];
        "for-own@^0.1.4" = s."for-own@0.1.5";
        "forever-agent@0.6.1" = f "forever-agent" "0.6.1" y "fbc71f0c41adeb37f96c577ad1ed42d8fdacca91" [];
        "forever-agent@~0.6.1" = s."forever-agent@0.6.1";
        "form-data@2.3.2" = f "form-data" "2.3.2" y "4970498be604c20c005d4f5c23aecd21d6b49099" [
          (s."asynckit@^0.4.0")
          (s."combined-stream@1.0.6")
          (s."mime-types@^2.1.12")
        ];
        "form-data@~2.3.1" = s."form-data@2.3.2";
        "fragment-cache@0.2.1" = f "fragment-cache" "0.2.1" y "4290fad27f13e89be7f33799c6bc5a0abfff0d19" [
          (s."map-cache@^0.2.2")
        ];
        "fragment-cache@^0.2.1" = s."fragment-cache@0.2.1";
        "fs-extra@0.26.7" = f "fs-extra" "0.26.7" y "9ae1fdd94897798edab76d0918cf42d0c3184fa9" [
          (s."graceful-fs@^4.1.2")
          (s."jsonfile@^2.1.0")
          (s."klaw@^1.0.0")
          (s."path-is-absolute@^1.0.0")
          (s."rimraf@^2.2.8")
        ];
        "fs-extra@^0.26.5" = s."fs-extra@0.26.7";
        "fs-minipass@1.2.5" = f "fs-minipass" "1.2.5" y "06c277218454ec288df77ada54a03b8702aacb9d" [
          (s."minipass@^2.2.1")
        ];
        "fs-minipass@^1.2.5" = s."fs-minipass@1.2.5";
        "fs-promise@0.5.0" = f "fs-promise" "0.5.0" y "4347d6bf624655a7061a4319213c393276ad3ef3" [
          (s."any-promise@^1.0.0")
          (s."fs-extra@^0.26.5")
          (s."mz@^2.3.1")
          (s."thenify-all@^1.6.0")
        ];
        "fs-promise@^0.5.0" = s."fs-promise@0.5.0";
        "fs-readdir-recursive@0.1.2" = f "fs-readdir-recursive" "0.1.2" y "315b4fb8c1ca5b8c47defef319d073dad3568059" [];
        "fs-readdir-recursive@^0.1.0" = s."fs-readdir-recursive@0.1.2";
        "fs.realpath@1.0.0" = f "fs.realpath" "1.0.0" y "1504ad2523158caa40db4a2787cb01411994ea4f" [];
        "fs.realpath@^1.0.0" = s."fs.realpath@1.0.0";
        "fsevents@1.2.3" = f "fsevents" "1.2.3" y "08292982e7059f6674c93d8b829c1e8604979ac0" [
          (s."nan@^2.9.2")
          (s."node-pre-gyp@^0.9.0")
        ];
        "fsevents@^1.0.0" = s."fsevents@1.2.3";
        "fsevents@^1.1.2" = s."fsevents@1.2.3";
        "fstream@1.0.11" = f "fstream" "1.0.11" y "5c1fb1f117477114f0632a0eb4b71b3cb0fd3171" [
          (s."graceful-fs@^4.1.2")
          (s."inherits@~2.0.0")
          (s."mkdirp@>=0.5 0")
          (s."rimraf@2")
        ];
        "fstream@^1.0.2" = s."fstream@1.0.11";
        "function-bind@1.1.1" = f "function-bind" "1.1.1" y "a56899d3ea3c9bab874bb9773b7c5ede92f4895d" [];
        "function-bind@^1.0.2" = s."function-bind@1.1.1";
        "gauge@2.7.4" = f "gauge" "2.7.4" y "2c03405c7538c39d7eb37b317022e325fb018bf7" [
          (s."aproba@^1.0.3")
          (s."console-control-strings@^1.0.0")
          (s."has-unicode@^2.0.0")
          (s."object-assign@^4.1.0")
          (s."signal-exit@^3.0.0")
          (s."string-width@^1.0.1")
          (s."strip-ansi@^3.0.1")
          (s."wide-align@^1.1.0")
        ];
        "gauge@~2.7.3" = s."gauge@2.7.4";
        "get-stdin@4.0.1" = f "get-stdin" "4.0.1" y "b968c6b0a04384324902e8bf1a5df32579a450fe" [];
        "get-stdin@^4.0.1" = s."get-stdin@4.0.1";
        "get-value@2.0.6" = f "get-value" "2.0.6" y "dc15ca1c672387ca76bd37ac0a395ba2042a2c28" [];
        "get-value@^2.0.3" = s."get-value@2.0.6";
        "get-value@^2.0.6" = s."get-value@2.0.6";
        "getpass@0.1.7" = f "getpass" "0.1.7" y "5eff8e3e684d569ae4cb2b1282604e8ba62149fa" [
          (s."assert-plus@^1.0.0")
        ];
        "getpass@^0.1.1" = s."getpass@0.1.7";
        "glob-base@0.3.0" = f "glob-base" "0.3.0" y "dbb164f6221b1c0b1ccf82aea328b497df0ea3c4" [
          (s."glob-parent@^2.0.0")
          (s."is-glob@^2.0.0")
        ];
        "glob-base@^0.3.0" = s."glob-base@0.3.0";
        "glob-parent@2.0.0" = f "glob-parent" "2.0.0" y "81383d72db054fcccf5336daa902f182f6edbb28" [
          (s."is-glob@^2.0.0")
        ];
        "glob-parent@3.1.0" = f "glob-parent" "3.1.0" y "9e6af6299d8d3bd2bd40430832bd113df906c5ae" [
          (s."is-glob@^3.1.0")
          (s."path-dirname@^1.0.0")
        ];
        "glob-parent@^2.0.0" = s."glob-parent@2.0.0";
        "glob-parent@^3.1.0" = s."glob-parent@3.1.0";
        "glob@5.0.15" = f "glob" "5.0.15" y "1bc936b9e02f4a603fcc222ecf7633d30b8b93b1" [
          (s."inflight@^1.0.4")
          (s."inherits@2")
          (s."minimatch@2 || 3")
          (s."once@^1.3.0")
          (s."path-is-absolute@^1.0.0")
        ];
        "glob@7.1.1" = f "glob" "7.1.1" y "805211df04faaf1c63a3600306cdf5ade50b2ec8" [
          (s."fs.realpath@^1.0.0")
          (s."inflight@^1.0.4")
          (s."inherits@2")
          (s."minimatch@^3.0.2")
          (s."once@^1.3.0")
          (s."path-is-absolute@^1.0.0")
        ];
        "glob@7.1.2" = f "glob" "7.1.2" y "c19c9df9a028702d678612384a6552404c636d15" [
          (s."fs.realpath@^1.0.0")
          (s."inflight@^1.0.4")
          (s."inherits@2")
          (s."minimatch@^3.0.4")
          (s."once@^1.3.0")
          (s."path-is-absolute@^1.0.0")
        ];
        "glob@^5.0.15" = s."glob@5.0.15";
        "glob@^5.0.5" = s."glob@5.0.15";
        "glob@^7.0" = s."glob@7.1.2";
        "glob@^7.0.5" = s."glob@7.1.2";
        "glob@^7.1.0" = s."glob@7.1.2";
        "glob@^7.1.1" = s."glob@7.1.2";
        "globals@6.4.1" = f "globals" "6.4.1" y "8498032b3b6d1cc81eebc5f79690d8fe29fabf4f" [];
        "globals@^6.4.0" = s."globals@6.4.1";
        "got@4.2.0" = f "got" "4.2.0" y "af59f461834bfafd722cba01acf4c14a9dd5da06" [
          (s."create-error-class@^2.0.0")
          (s."duplexify@^3.2.0")
          (s."is-plain-obj@^1.0.0")
          (s."is-redirect@^1.0.0")
          (s."is-stream@^1.0.0")
          (s."lowercase-keys@^1.0.0")
          (s."node-status-codes@^1.0.0")
          (s."object-assign@^3.0.0")
          (s."parse-json@^2.1.0")
          (s."pinkie-promise@^1.0.0")
          (s."prepend-http@^1.0.0")
          (s."read-all-stream@^3.0.0")
          (s."timed-out@^2.0.0")
          (s."unzip-response@^1.0.0")
        ];
        "got@^4.1.1" = s."got@4.2.0";
        "graceful-fs@4.1.11" = f "graceful-fs" "4.1.11" y "0e8bdfe4d1ddb8854d64e04ea7c00e2a026e5658" [];
        "graceful-fs@^4.1.2" = s."graceful-fs@4.1.11";
        "graceful-fs@^4.1.3" = s."graceful-fs@4.1.11";
        "graceful-fs@^4.1.4" = s."graceful-fs@4.1.11";
        "graceful-fs@^4.1.6" = s."graceful-fs@4.1.11";
        "graceful-fs@^4.1.9" = s."graceful-fs@4.1.11";
        "graceful-readlink@1.0.1" = f "graceful-readlink" "1.0.1" y "4cafad76bc62f02fa039b2f94e9a3dd3a391a725" [];
        "graceful-readlink@>= 1.0.0" = s."graceful-readlink@1.0.1";
        "growl@1.9.2" = f "growl" "1.9.2" y "0ea7743715db8d8de2c5ede1775e1b45ac85c02f" [];
        "har-schema@2.0.0" = f "har-schema" "2.0.0" y "a94c2224ebcac04782a0d9035521f24735b7ec92" [];
        "har-schema@^2.0.0" = s."har-schema@2.0.0";
        "har-validator@5.0.3" = f "har-validator" "5.0.3" y "ba402c266194f15956ef15e0fcf242993f6a7dfd" [
          (s."ajv@^5.1.0")
          (s."har-schema@^2.0.0")
        ];
        "har-validator@~5.0.3" = s."har-validator@5.0.3";
        "has-ansi@2.0.0" = f "has-ansi" "2.0.0" y "34f5049ce1ecdf2b0649af3ef24e45ed35416d91" [
          (s."ansi-regex@^2.0.0")
        ];
        "has-ansi@^2.0.0" = s."has-ansi@2.0.0";
        "has-flag@1.0.0" = f "has-flag" "1.0.0" y "9d9e793165ce017a00f00418c43f942a7b1d11fa" [];
        "has-flag@^1.0.0" = s."has-flag@1.0.0";
        "has-unicode@2.0.1" = f "has-unicode" "2.0.1" y "e0e6fe6a28cf51138855e086d1691e771de2a8b9" [];
        "has-unicode@^2.0.0" = s."has-unicode@2.0.1";
        "has-value@0.3.1" = f "has-value" "0.3.1" y "7b1f58bada62ca827ec0a2078025654845995e1f" [
          (s."get-value@^2.0.3")
          (s."has-values@^0.1.4")
          (s."isobject@^2.0.0")
        ];
        "has-value@1.0.0" = f "has-value" "1.0.0" y "18b281da585b1c5c51def24c930ed29a0be6b177" [
          (s."get-value@^2.0.6")
          (s."has-values@^1.0.0")
          (s."isobject@^3.0.0")
        ];
        "has-value@^0.3.1" = s."has-value@0.3.1";
        "has-value@^1.0.0" = s."has-value@1.0.0";
        "has-values@0.1.4" = f "has-values" "0.1.4" y "6d61de95d91dfca9b9a02089ad384bff8f62b771" [];
        "has-values@1.0.0" = f "has-values" "1.0.0" y "95b0b63fec2146619a6fe57fe75628d5a39efe4f" [
          (s."is-number@^3.0.0")
          (s."kind-of@^4.0.0")
        ];
        "has-values@^0.1.4" = s."has-values@0.1.4";
        "has-values@^1.0.0" = s."has-values@1.0.0";
        "has@1.0.1" = f "has" "1.0.1" y "8461733f538b0837c9361e39a9ab9e9704dc2f28" [
          (s."function-bind@^1.0.2")
        ];
        "has@^1.0.0" = s."has@1.0.1";
        "hash-base@3.0.4" = f "hash-base" "3.0.4" y "5fc8686847ecd73499403319a6b0a3f3f6ae4918" [
          (s."inherits@^2.0.1")
          (s."safe-buffer@^5.0.1")
        ];
        "hash-base@^3.0.0" = s."hash-base@3.0.4";
        "hash.js@1.1.3" = f "hash.js" "1.1.3" y "340dedbe6290187151c1ea1d777a3448935df846" [
          (s."inherits@^2.0.3")
          (s."minimalistic-assert@^1.0.0")
        ];
        "hash.js@^1.0.0" = s."hash.js@1.1.3";
        "hash.js@^1.0.3" = s."hash.js@1.1.3";
        "hawk@6.0.2" = f "hawk" "6.0.2" y "af4d914eb065f9b5ce4d9d11c1cb2126eecc3038" [
          (s."boom@4.x.x")
          (s."cryptiles@3.x.x")
          (s."hoek@4.x.x")
          (s."sntp@2.x.x")
        ];
        "hawk@~6.0.2" = s."hawk@6.0.2";
        "he@1.1.1" = f "he" "1.1.1" y "93410fd21b009735151f8868c2f271f3427e23fd" [];
        "hmac-drbg@1.0.1" = f "hmac-drbg" "1.0.1" y "d2745701025a6c775a6c545793ed502fc0c649a1" [
          (s."hash.js@^1.0.3")
          (s."minimalistic-assert@^1.0.0")
          (s."minimalistic-crypto-utils@^1.0.1")
        ];
        "hmac-drbg@^1.0.0" = s."hmac-drbg@1.0.1";
        "hoek@4.2.1" = f "hoek" "4.2.1" y "9634502aa12c445dd5a7c5734b572bb8738aacbb" [];
        "hoek@4.x.x" = s."hoek@4.2.1";
        "home-or-tmp@1.0.0" = f "home-or-tmp" "1.0.0" y "4b9f1e40800c3e50c6c27f781676afcce71f3985" [
          (s."os-tmpdir@^1.0.1")
          (s."user-home@^1.1.1")
        ];
        "home-or-tmp@^1.0.0" = s."home-or-tmp@1.0.0";
        "hosted-git-info@2.6.0" = f "hosted-git-info" "2.6.0" y "23235b29ab230c576aab0d4f13fc046b0b038222" [];
        "hosted-git-info@^2.1.4" = s."hosted-git-info@2.6.0";
        "htmlescape@1.1.1" = f "htmlescape" "1.1.1" y "3a03edc2214bca3b66424a3e7959349509cb0351" [];
        "htmlescape@^1.1.0" = s."htmlescape@1.1.1";
        "htmlparser2@3.8.3" = f "htmlparser2" "3.8.3" y "996c28b191516a8be86501a7d79757e5c70c1068" [
          (s."domelementtype@1")
          (s."domhandler@2.3")
          (s."domutils@1.5")
          (s."entities@1.0")
          (s."readable-stream@1.1")
        ];
        "htmlparser2@3.8.x" = s."htmlparser2@3.8.3";
        "http-signature@1.2.0" = f "http-signature" "1.2.0" y "9aecd925114772f3d95b65a60abb8f7c18fbace1" [
          (s."assert-plus@^1.0.0")
          (s."jsprim@^1.2.2")
          (s."sshpk@^1.7.0")
        ];
        "http-signature@~1.2.0" = s."http-signature@1.2.0";
        "https-browserify@0.0.1" = f "https-browserify" "0.0.1" y "3f91365cabe60b77ed0ebba24b454e3e09d95a82" [];
        "https-browserify@~0.0.0" = s."https-browserify@0.0.1";
        "iconv-lite@0.4.21" = f "iconv-lite" "0.4.21" y "c47f8733d02171189ebc4a400f3218d348094798" [
          (s."safer-buffer@^2.1.0")
        ];
        "iconv-lite@^0.4.4" = s."iconv-lite@0.4.21";
        "iconv-lite@^0.4.5" = s."iconv-lite@0.4.21";
        "ieee754@1.1.11" = f "ieee754" "1.1.11" y "c16384ffe00f5b7835824e67b6f2bd44a5229455" [];
        "ieee754@^1.1.4" = s."ieee754@1.1.11";
        "ignore-walk@3.0.1" = f "ignore-walk" "3.0.1" y "a83e62e7d272ac0e3b551aaa82831a19b69f82f8" [
          (s."minimatch@^3.0.4")
        ];
        "ignore-walk@^3.0.1" = s."ignore-walk@3.0.1";
        "ignore@3.3.8" = f "ignore" "3.3.8" y "3f8e9c35d38708a3a7e0e9abb6c73e7ee7707b2b" [];
        "ignore@^3.3.8" = s."ignore@3.3.8";
        "indent-string@2.1.0" = f "indent-string" "2.1.0" y "8e2d48348742121b4a8218b7a137e9a52049dc80" [
          (s."repeating@^2.0.0")
        ];
        "indent-string@^2.1.0" = s."indent-string@2.1.0";
        "indexof@0.0.1" = f "indexof" "0.0.1" y "82dc336d232b9062179d05ab3293a66059fd435d" [];
        "inflight@1.0.6" = f "inflight" "1.0.6" y "49bd6331d7d02d0c09bc910a1075ba8165b56df9" [
          (s."once@^1.3.0")
          (s."wrappy@1")
        ];
        "inflight@^1.0.4" = s."inflight@1.0.6";
        "inherits@2" = s."inherits@2.0.3";
        "inherits@2.0.1" = f "inherits" "2.0.1" y "b17d08d326b4423e568eff719f91b0b1cbdf69f1" [];
        "inherits@2.0.3" = f "inherits" "2.0.3" y "633c2c83e3da42a502f52466022480f4208261de" [];
        "inherits@^2.0.1" = s."inherits@2.0.3";
        "inherits@^2.0.3" = s."inherits@2.0.3";
        "inherits@~2.0.0" = s."inherits@2.0.3";
        "inherits@~2.0.1" = s."inherits@2.0.3";
        "inherits@~2.0.3" = s."inherits@2.0.3";
        "ini@1.3.5" = f "ini" "1.3.5" y "eee25f56db1c9ec6085e0c22778083f596abf927" [];
        "ini@~1.3.0" = s."ini@1.3.5";
        "inline-source-map@0.6.2" = f "inline-source-map" "0.6.2" y "f9393471c18a79d1724f863fa38b586370ade2a5" [
          (s."source-map@~0.5.3")
        ];
        "inline-source-map@~0.6.0" = s."inline-source-map@0.6.2";
        "insert-module-globals@7.0.6" = f "insert-module-globals" "7.0.6" y "15a31d9d394e76d08838b9173016911d7fd4ea1b" [
          (s."JSONStream@^1.0.3")
          (s."combine-source-map@^0.8.0")
          (s."concat-stream@^1.6.1")
          (s."is-buffer@^1.1.0")
          (s."lexical-scope@^1.2.0")
          (s."path-is-absolute@^1.0.1")
          (s."process@~0.11.0")
          (s."through2@^2.0.0")
          (s."xtend@^4.0.0")
        ];
        "insert-module-globals@^7.0.0" = s."insert-module-globals@7.0.6";
        "invert-kv@1.0.0" = f "invert-kv" "1.0.0" y "104a8e4aaca6d3d8cd157a8ef8bfab2d7a3ffdb6" [];
        "invert-kv@^1.0.0" = s."invert-kv@1.0.0";
        "is-accessor-descriptor@0.1.6" = f "is-accessor-descriptor" "0.1.6" y "a9e12cb3ae8d876727eeef3843f8a0897b5c98d6" [
          (s."kind-of@^3.0.2")
        ];
        "is-accessor-descriptor@1.0.0" = f "is-accessor-descriptor" "1.0.0" y "169c2f6d3df1f992618072365c9b0ea1f6878656" [
          (s."kind-of@^6.0.0")
        ];
        "is-accessor-descriptor@^0.1.6" = s."is-accessor-descriptor@0.1.6";
        "is-accessor-descriptor@^1.0.0" = s."is-accessor-descriptor@1.0.0";
        "is-arrayish@0.2.1" = f "is-arrayish" "0.2.1" y "77c99840527aa8ecb1a8ba697b80645a7a926a9d" [];
        "is-arrayish@^0.2.1" = s."is-arrayish@0.2.1";
        "is-binary-path@1.0.1" = f "is-binary-path" "1.0.1" y "75f16642b480f187a711c814161fd3a4a7655898" [
          (s."binary-extensions@^1.0.0")
        ];
        "is-binary-path@^1.0.0" = s."is-binary-path@1.0.1";
        "is-buffer@1.1.6" = f "is-buffer" "1.1.6" y "efaa2ea9daa0d7ab2ea13a97b2b8ad51fefbe8be" [];
        "is-buffer@^1.1.0" = s."is-buffer@1.1.6";
        "is-buffer@^1.1.5" = s."is-buffer@1.1.6";
        "is-builtin-module@1.0.0" = f "is-builtin-module" "1.0.0" y "540572d34f7ac3119f8f76c30cbc1b1e037affbe" [
          (s."builtin-modules@^1.0.0")
        ];
        "is-builtin-module@^1.0.0" = s."is-builtin-module@1.0.0";
        "is-data-descriptor@0.1.4" = f "is-data-descriptor" "0.1.4" y "0b5ee648388e2c860282e793f1856fec3f301b56" [
          (s."kind-of@^3.0.2")
        ];
        "is-data-descriptor@1.0.0" = f "is-data-descriptor" "1.0.0" y "d84876321d0e7add03990406abbbbd36ba9268c7" [
          (s."kind-of@^6.0.0")
        ];
        "is-data-descriptor@^0.1.4" = s."is-data-descriptor@0.1.4";
        "is-data-descriptor@^1.0.0" = s."is-data-descriptor@1.0.0";
        "is-descriptor@0.1.6" = f "is-descriptor" "0.1.6" y "366d8240dde487ca51823b1ab9f07a10a78251ca" [
          (s."is-accessor-descriptor@^0.1.6")
          (s."is-data-descriptor@^0.1.4")
          (s."kind-of@^5.0.0")
        ];
        "is-descriptor@1.0.2" = f "is-descriptor" "1.0.2" y "3b159746a66604b04f8c81524ba365c5f14d86ec" [
          (s."is-accessor-descriptor@^1.0.0")
          (s."is-data-descriptor@^1.0.0")
          (s."kind-of@^6.0.2")
        ];
        "is-descriptor@^0.1.0" = s."is-descriptor@0.1.6";
        "is-descriptor@^1.0.0" = s."is-descriptor@1.0.2";
        "is-descriptor@^1.0.2" = s."is-descriptor@1.0.2";
        "is-dotfile@1.0.3" = f "is-dotfile" "1.0.3" y "a6a2f32ffd2dfb04f5ca25ecd0f6b83cf798a1e1" [];
        "is-dotfile@^1.0.0" = s."is-dotfile@1.0.3";
        "is-equal-shallow@0.1.3" = f "is-equal-shallow" "0.1.3" y "2238098fc221de0bcfa5d9eac4c45d638aa1c534" [
          (s."is-primitive@^2.0.0")
        ];
        "is-equal-shallow@^0.1.3" = s."is-equal-shallow@0.1.3";
        "is-extendable@0.1.1" = f "is-extendable" "0.1.1" y "62b110e289a471418e3ec36a617d472e301dfc89" [];
        "is-extendable@1.0.1" = f "is-extendable" "1.0.1" y "a7470f9e426733d81bd81e1155264e3a3507cab4" [
          (s."is-plain-object@^2.0.4")
        ];
        "is-extendable@^0.1.0" = s."is-extendable@0.1.1";
        "is-extendable@^0.1.1" = s."is-extendable@0.1.1";
        "is-extendable@^1.0.1" = s."is-extendable@1.0.1";
        "is-extglob@1.0.0" = f "is-extglob" "1.0.0" y "ac468177c4943405a092fc8f29760c6ffc6206c0" [];
        "is-extglob@2.1.1" = f "is-extglob" "2.1.1" y "a88c02535791f02ed37c76a1b9ea9773c833f8c2" [];
        "is-extglob@^1.0.0" = s."is-extglob@1.0.0";
        "is-extglob@^2.1.0" = s."is-extglob@2.1.1";
        "is-extglob@^2.1.1" = s."is-extglob@2.1.1";
        "is-finite@1.0.2" = f "is-finite" "1.0.2" y "cc6677695602be550ef11e8b4aa6305342b6d0aa" [
          (s."number-is-nan@^1.0.0")
        ];
        "is-finite@^1.0.0" = s."is-finite@1.0.2";
        "is-fullwidth-code-point@1.0.0" = f "is-fullwidth-code-point" "1.0.0" y "ef9e31386f031a7f0d643af82fde50c457ef00cb" [
          (s."number-is-nan@^1.0.0")
        ];
        "is-fullwidth-code-point@^1.0.0" = s."is-fullwidth-code-point@1.0.0";
        "is-glob@2.0.1" = f "is-glob" "2.0.1" y "d096f926a3ded5600f3fdfd91198cb0888c2d863" [
          (s."is-extglob@^1.0.0")
        ];
        "is-glob@3.1.0" = f "is-glob" "3.1.0" y "7ba5ae24217804ac70707b96922567486cc3e84a" [
          (s."is-extglob@^2.1.0")
        ];
        "is-glob@4.0.0" = f "is-glob" "4.0.0" y "9521c76845cc2610a85203ddf080a958c2ffabc0" [
          (s."is-extglob@^2.1.1")
        ];
        "is-glob@^2.0.0" = s."is-glob@2.0.1";
        "is-glob@^2.0.1" = s."is-glob@2.0.1";
        "is-glob@^3.1.0" = s."is-glob@3.1.0";
        "is-glob@^4.0.0" = s."is-glob@4.0.0";
        "is-integer@1.0.7" = f "is-integer" "1.0.7" y "6bde81aacddf78b659b6629d629cadc51a886d5c" [
          (s."is-finite@^1.0.0")
        ];
        "is-integer@^1.0.4" = s."is-integer@1.0.7";
        "is-number@2.1.0" = f "is-number" "2.1.0" y "01fcbbb393463a548f2f466cce16dece49db908f" [
          (s."kind-of@^3.0.2")
        ];
        "is-number@3.0.0" = f "is-number" "3.0.0" y "24fd6201a4782cf50561c810276afc7d12d71195" [
          (s."kind-of@^3.0.2")
        ];
        "is-number@4.0.0" = f "is-number" "4.0.0" y "0026e37f5454d73e356dfe6564699867c6a7f0ff" [];
        "is-number@^2.1.0" = s."is-number@2.1.0";
        "is-number@^3.0.0" = s."is-number@3.0.0";
        "is-number@^4.0.0" = s."is-number@4.0.0";
        "is-odd@2.0.0" = f "is-odd" "2.0.0" y "7646624671fd7ea558ccd9a2795182f2958f1b24" [
          (s."is-number@^4.0.0")
        ];
        "is-odd@^2.0.0" = s."is-odd@2.0.0";
        "is-plain-obj@1.1.0" = f "is-plain-obj" "1.1.0" y "71a50c8429dfca773c92a390a4a03b39fcd51d3e" [];
        "is-plain-obj@^1.0.0" = s."is-plain-obj@1.1.0";
        "is-plain-object@2.0.4" = f "is-plain-object" "2.0.4" y "2c163b3fafb1b606d9d17928f05c2a1c38e07677" [
          (s."isobject@^3.0.1")
        ];
        "is-plain-object@^2.0.1" = s."is-plain-object@2.0.4";
        "is-plain-object@^2.0.3" = s."is-plain-object@2.0.4";
        "is-plain-object@^2.0.4" = s."is-plain-object@2.0.4";
        "is-posix-bracket@0.1.1" = f "is-posix-bracket" "0.1.1" y "3334dc79774368e92f016e6fbc0a88f5cd6e6bc4" [];
        "is-posix-bracket@^0.1.0" = s."is-posix-bracket@0.1.1";
        "is-primitive@2.0.0" = f "is-primitive" "2.0.0" y "207bab91638499c07b2adf240a41a87210034575" [];
        "is-primitive@^2.0.0" = s."is-primitive@2.0.0";
        "is-redirect@1.0.0" = f "is-redirect" "1.0.0" y "1d03dded53bd8db0f30c26e4f95d36fc7c87dc24" [];
        "is-redirect@^1.0.0" = s."is-redirect@1.0.0";
        "is-stream@1.1.0" = f "is-stream" "1.1.0" y "12d4a3dd4e68e0b79ceb8dbc84173ae80d91ca44" [];
        "is-stream@^1.0.0" = s."is-stream@1.1.0";
        "is-typedarray@1.0.0" = f "is-typedarray" "1.0.0" y "e479c80858df0c1b11ddda6940f96011fcda4a9a" [];
        "is-typedarray@~1.0.0" = s."is-typedarray@1.0.0";
        "is-utf8@0.2.1" = f "is-utf8" "0.2.1" y "4b0da1442104d1b336340e80797e865cf39f7d72" [];
        "is-utf8@^0.2.0" = s."is-utf8@0.2.1";
        "is-windows@1.0.2" = f "is-windows" "1.0.2" y "d1850eb9791ecd18e6182ce12a30f396634bb19d" [];
        "is-windows@^1.0.2" = s."is-windows@1.0.2";
        "isarray@0.0.1" = f "isarray" "0.0.1" y "8a18acfca9a8f4177e09abfc6038939b05d1eedf" [];
        "isarray@1.0.0" = f "isarray" "1.0.0" y "bb935d48582cba168c06834957a54a3e07124f11" [];
        "isarray@2.0.4" = f "isarray" "2.0.4" y "38e7bcbb0f3ba1b7933c86ba1894ddfc3781bbb7" [];
        "isarray@^1.0.0" = s."isarray@1.0.0";
        "isarray@^2.0.4" = s."isarray@2.0.4";
        "isarray@~1.0.0" = s."isarray@1.0.0";
        "isexe@2.0.0" = f "isexe" "2.0.0" y "e8fbf374dc556ff8947a10dcb0572d633f2cfa10" [];
        "isexe@^2.0.0" = s."isexe@2.0.0";
        "isobject@2.1.0" = f "isobject" "2.1.0" y "f065561096a3f1da2ef46272f815c840d87e0c89" [
          (s."isarray@1.0.0")
        ];
        "isobject@3.0.1" = f "isobject" "3.0.1" y "4e431e92b11a9731636aa1f9c8d1ccbcfdab78df" [];
        "isobject@^2.0.0" = s."isobject@2.1.0";
        "isobject@^3.0.0" = s."isobject@3.0.1";
        "isobject@^3.0.1" = s."isobject@3.0.1";
        "isstream@0.1.2" = f "isstream" "0.1.2" y "47e63f7af55afa6f92e1500e690eb8b8529c099a" [];
        "isstream@~0.1.2" = s."isstream@0.1.2";
        "js-tokens@1.0.1" = f "js-tokens" "1.0.1" y "cc435a5c8b94ad15acb7983140fc80182c89aeae" [];
        "jsbn@0.1.1" = f "jsbn" "0.1.1" y "a5e654c2e5a2deb5f201d96cefbca80c0ef2f513" [];
        "jsbn@~0.1.0" = s."jsbn@0.1.1";
        "jsesc@0.5.0" = f "jsesc" "0.5.0" y "e7dee66e35d6fc16f710fe91d5cf69f70f08911d" [];
        "jsesc@~0.5.0" = s."jsesc@0.5.0";
        "jshint@2.9.5" = f "jshint" "2.9.5" y "1e7252915ce681b40827ee14248c46d34e9aa62c" [
          (s."cli@~1.0.0")
          (s."console-browserify@1.1.x")
          (s."exit@0.1.x")
          (s."htmlparser2@3.8.x")
          (s."lodash@3.7.x")
          (s."minimatch@~3.0.2")
          (s."shelljs@0.3.x")
          (s."strip-json-comments@1.0.x")
        ];
        "jshint@^2.8.0" = s."jshint@2.9.5";
        "json-schema-traverse@0.3.1" = f "json-schema-traverse" "0.3.1" y "349a6d44c53a51de89b40805c5d5e59b417d3340" [];
        "json-schema-traverse@^0.3.0" = s."json-schema-traverse@0.3.1";
        "json-schema@0.2.3" = f "json-schema" "0.2.3" y "b480c892e59a2f05954ce727bd3f2a4e882f9e13" [];
        "json-stable-stringify@0.0.1" = f "json-stable-stringify" "0.0.1" y "611c23e814db375527df851193db59dd2af27f45" [
          (s."jsonify@~0.0.0")
        ];
        "json-stable-stringify@~0.0.0" = s."json-stable-stringify@0.0.1";
        "json-stringify-safe@5.0.1" = f "json-stringify-safe" "5.0.1" y "1296a2d58fd45f19a0f6ce01d65701e2c735b6eb" [];
        "json-stringify-safe@~5.0.1" = s."json-stringify-safe@5.0.1";
        "json3@3.3.2" = f "json3" "3.3.2" y "3c0434743df93e2f5c42aee7b19bcb483575f4e1" [];
        "json5@0.4.0" = f "json5" "0.4.0" y "054352e4c4c80c86c0923877d449de176a732c8d" [];
        "json5@^0.4.0" = s."json5@0.4.0";
        "jsonfile@2.4.0" = f "jsonfile" "2.4.0" y "3736a2b428b87bbda0cc83b53fa3d633a35c2ae8" [
          (s."graceful-fs@^4.1.6")
        ];
        "jsonfile@^2.1.0" = s."jsonfile@2.4.0";
        "jsonify@0.0.0" = f "jsonify" "0.0.0" y "2c74b6ee41d93ca51b7b5aaee8f503631d252a73" [];
        "jsonify@~0.0.0" = s."jsonify@0.0.0";
        "jsonparse@0.0.5" = f "jsonparse" "0.0.5" y "330542ad3f0a654665b778f3eb2d9a9fa507ac64" [];
        "jsonparse@1.3.1" = f "jsonparse" "1.3.1" y "3f4dae4a91fac315f71062f8521cc239f1366280" [];
        "jsonparse@^1.2.0" = s."jsonparse@1.3.1";
        "jsprim@1.4.1" = f "jsprim" "1.4.1" y "313e66bc1e5cc06e438bc1b7499c2e5c56acb6a2" [
          (s."assert-plus@1.0.0")
          (s."extsprintf@1.3.0")
          (s."json-schema@0.2.3")
          (s."verror@1.10.0")
        ];
        "jsprim@^1.2.2" = s."jsprim@1.4.1";
        "kind-of@3.2.2" = f "kind-of" "3.2.2" y "31ea21a734bab9bbb0f32466d893aea51e4a3c64" [
          (s."is-buffer@^1.1.5")
        ];
        "kind-of@4.0.0" = f "kind-of" "4.0.0" y "20813df3d712928b207378691a45066fae72dd57" [
          (s."is-buffer@^1.1.5")
        ];
        "kind-of@5.1.0" = f "kind-of" "5.1.0" y "729c91e2d857b7a419a1f9aa65685c4c33f5845d" [];
        "kind-of@6.0.2" = f "kind-of" "6.0.2" y "01146b36a6218e64e58f3a8d66de5d7fc6f6d051" [];
        "kind-of@^3.0.2" = s."kind-of@3.2.2";
        "kind-of@^3.0.3" = s."kind-of@3.2.2";
        "kind-of@^3.2.0" = s."kind-of@3.2.2";
        "kind-of@^4.0.0" = s."kind-of@4.0.0";
        "kind-of@^5.0.0" = s."kind-of@5.1.0";
        "kind-of@^6.0.0" = s."kind-of@6.0.2";
        "kind-of@^6.0.2" = s."kind-of@6.0.2";
        "klaw@1.3.1" = f "klaw" "1.3.1" y "4088433b46b3b1ba259d78785d8e96f73ba02439" [
          (s."graceful-fs@^4.1.9")
        ];
        "klaw@^1.0.0" = s."klaw@1.3.1";
        "labeled-stream-splicer@2.0.1" = f "labeled-stream-splicer" "2.0.1" y "9cffa32fd99e1612fd1d86a8db962416d5292926" [
          (s."inherits@^2.0.1")
          (s."isarray@^2.0.4")
          (s."stream-splicer@^2.0.0")
        ];
        "labeled-stream-splicer@^2.0.0" = s."labeled-stream-splicer@2.0.1";
        "lazy-cache@1.0.4" = f "lazy-cache" "1.0.4" y "a1d78fc3a50474cb80845d3b3b6e1da49a446e8e" [];
        "lazy-cache@^1.0.3" = s."lazy-cache@1.0.4";
        "lcid@1.0.0" = f "lcid" "1.0.0" y "308accafa0bc483a3867b4b6f2b9506251d1b835" [
          (s."invert-kv@^1.0.0")
        ];
        "lcid@^1.0.0" = s."lcid@1.0.0";
        "leven@1.0.2" = f "leven" "1.0.2" y "9144b6eebca5f1d0680169f1a6770dcea60b75c3" [];
        "leven@^1.0.2" = s."leven@1.0.2";
        "lexical-scope@1.2.0" = f "lexical-scope" "1.2.0" y "fcea5edc704a4b3a8796cdca419c3a0afaf22df4" [
          (s."astw@^2.0.0")
        ];
        "lexical-scope@^1.2.0" = s."lexical-scope@1.2.0";
        "load-json-file@1.1.0" = f "load-json-file" "1.1.0" y "956905708d58b4bab4c2261b04f59f31c99374c0" [
          (s."graceful-fs@^4.1.2")
          (s."parse-json@^2.2.0")
          (s."pify@^2.0.0")
          (s."pinkie-promise@^2.0.0")
          (s."strip-bom@^2.0.0")
        ];
        "load-json-file@^1.0.0" = s."load-json-file@1.1.0";
        "lodash._baseassign@3.2.0" = f "lodash._baseassign" "3.2.0" y "8c38a099500f215ad09e59f1722fd0c52bfe0a4e" [
          (s."lodash._basecopy@^3.0.0")
          (s."lodash.keys@^3.0.0")
        ];
        "lodash._baseassign@^3.0.0" = s."lodash._baseassign@3.2.0";
        "lodash._basecopy@3.0.1" = f "lodash._basecopy" "3.0.1" y "8da0e6a876cf344c0ad8a54882111dd3c5c7ca36" [];
        "lodash._basecopy@^3.0.0" = s."lodash._basecopy@3.0.1";
        "lodash._basecreate@3.0.3" = f "lodash._basecreate" "3.0.3" y "1bc661614daa7fc311b7d03bf16806a0213cf821" [];
        "lodash._basecreate@^3.0.0" = s."lodash._basecreate@3.0.3";
        "lodash._getnative@3.9.1" = f "lodash._getnative" "3.9.1" y "570bc7dede46d61cdcde687d65d3eecbaa3aaff5" [];
        "lodash._getnative@^3.0.0" = s."lodash._getnative@3.9.1";
        "lodash._isiterateecall@3.0.9" = f "lodash._isiterateecall" "3.0.9" y "5203ad7ba425fae842460e696db9cf3e6aac057c" [];
        "lodash._isiterateecall@^3.0.0" = s."lodash._isiterateecall@3.0.9";
        "lodash.create@3.1.1" = f "lodash.create" "3.1.1" y "d7f2849f0dbda7e04682bb8cd72ab022461debe7" [
          (s."lodash._baseassign@^3.0.0")
          (s."lodash._basecreate@^3.0.0")
          (s."lodash._isiterateecall@^3.0.0")
        ];
        "lodash.isarguments@3.1.0" = f "lodash.isarguments" "3.1.0" y "2f573d85c6a24289ff00663b491c1d338ff3458a" [];
        "lodash.isarguments@^3.0.0" = s."lodash.isarguments@3.1.0";
        "lodash.isarray@3.0.4" = f "lodash.isarray" "3.0.4" y "79e4eb88c36a8122af86f844aa9bcd851b5fbb55" [];
        "lodash.isarray@^3.0.0" = s."lodash.isarray@3.0.4";
        "lodash.keys@3.1.2" = f "lodash.keys" "3.1.2" y "4dbc0472b156be50a0b286855d1bd0b0c656098a" [
          (s."lodash._getnative@^3.0.0")
          (s."lodash.isarguments@^3.0.0")
          (s."lodash.isarray@^3.0.0")
        ];
        "lodash.keys@^3.0.0" = s."lodash.keys@3.1.2";
        "lodash.memoize@3.0.4" = f "lodash.memoize" "3.0.4" y "2dcbd2c287cbc0a55cc42328bd0c736150d53e3f" [];
        "lodash.memoize@~3.0.3" = s."lodash.memoize@3.0.4";
        "lodash@3.10.1" = f "lodash" "3.10.1" y "5bf45e8e49ba4189e17d482789dfd15bd140b7b6" [];
        "lodash@3.7.0" = f "lodash" "3.7.0" y "3678bd8ab995057c07ade836ed2ef087da811d45" [];
        "lodash@3.7.x" = s."lodash@3.7.0";
        "lodash@4.17.10" = f "lodash" "4.17.10" y "1b7793cf7259ea38fb3661d4d38b3260af8ae4e7" [];
        "lodash@^3.10.0" = s."lodash@3.10.1";
        "lodash@^3.2.0" = s."lodash@3.10.1";
        "lodash@^3.9.3" = s."lodash@3.10.1";
        "lodash@^4.17.4" = s."lodash@4.17.10";
        "longest@1.0.1" = f "longest" "1.0.1" y "30a0b2da38f73770e8294a0d22e6625ed77d0097" [];
        "longest@^1.0.1" = s."longest@1.0.1";
        "loud-rejection@1.6.0" = f "loud-rejection" "1.6.0" y "5b46f80147edee578870f086d04821cf998e551f" [
          (s."currently-unhandled@^0.4.1")
          (s."signal-exit@^3.0.0")
        ];
        "loud-rejection@^1.0.0" = s."loud-rejection@1.6.0";
        "lowercase-keys@1.0.1" = f "lowercase-keys" "1.0.1" y "6f9e30b47084d971a7c820ff15a6c5167b74c26f" [];
        "lowercase-keys@^1.0.0" = s."lowercase-keys@1.0.1";
        "map-cache@0.2.2" = f "map-cache" "0.2.2" y "c32abd0bd6525d9b051645bb4f26ac5dc98a0dbf" [];
        "map-cache@^0.2.2" = s."map-cache@0.2.2";
        "map-obj@1.0.1" = f "map-obj" "1.0.1" y "d933ceb9205d82bdcf4886f6742bdc2b4dea146d" [];
        "map-obj@^1.0.0" = s."map-obj@1.0.1";
        "map-obj@^1.0.1" = s."map-obj@1.0.1";
        "map-visit@1.0.0" = f "map-visit" "1.0.0" y "ecdca8f13144e660f1b5bd41f12f3479d98dfb8f" [
          (s."object-visit@^1.0.0")
        ];
        "map-visit@^1.0.0" = s."map-visit@1.0.0";
        "md5.js@1.3.4" = f "md5.js" "1.3.4" y "e9bdbde94a20a5ac18b04340fc5764d5b09d901d" [
          (s."hash-base@^3.0.0")
          (s."inherits@^2.0.1")
        ];
        "md5.js@^1.3.4" = s."md5.js@1.3.4";
        "meow@3.7.0" = f "meow" "3.7.0" y "72cb668b425228290abbfa856892587308a801fb" [
          (s."camelcase-keys@^2.0.0")
          (s."decamelize@^1.1.2")
          (s."loud-rejection@^1.0.0")
          (s."map-obj@^1.0.1")
          (s."minimist@^1.1.3")
          (s."normalize-package-data@^2.3.4")
          (s."object-assign@^4.0.1")
          (s."read-pkg-up@^1.0.1")
          (s."redent@^1.0.0")
          (s."trim-newlines@^1.0.0")
        ];
        "meow@^3.1.0" = s."meow@3.7.0";
        "micromatch@2.3.11" = f "micromatch" "2.3.11" y "86677c97d1720b363431d04d0d15293bd38c1565" [
          (s."arr-diff@^2.0.0")
          (s."array-unique@^0.2.1")
          (s."braces@^1.8.2")
          (s."expand-brackets@^0.1.4")
          (s."extglob@^0.3.1")
          (s."filename-regex@^2.0.0")
          (s."is-extglob@^1.0.0")
          (s."is-glob@^2.0.1")
          (s."kind-of@^3.0.2")
          (s."normalize-path@^2.0.1")
          (s."object.omit@^2.0.0")
          (s."parse-glob@^3.0.4")
          (s."regex-cache@^0.4.2")
        ];
        "micromatch@3.1.10" = f "micromatch" "3.1.10" y "70859bc95c9840952f359a068a3fc49f9ecfac23" [
          (s."arr-diff@^4.0.0")
          (s."array-unique@^0.3.2")
          (s."braces@^2.3.1")
          (s."define-property@^2.0.2")
          (s."extend-shallow@^3.0.2")
          (s."extglob@^2.0.4")
          (s."fragment-cache@^0.2.1")
          (s."kind-of@^6.0.2")
          (s."nanomatch@^1.2.9")
          (s."object.pick@^1.3.0")
          (s."regex-not@^1.0.0")
          (s."snapdragon@^0.8.1")
          (s."to-regex@^3.0.2")
        ];
        "micromatch@^2.1.5" = s."micromatch@2.3.11";
        "micromatch@^3.1.4" = s."micromatch@3.1.10";
        "miller-rabin@4.0.1" = f "miller-rabin" "4.0.1" y "f080351c865b0dc562a8462966daa53543c78a4d" [
          (s."bn.js@^4.0.0")
          (s."brorand@^1.0.1")
        ];
        "miller-rabin@^4.0.0" = s."miller-rabin@4.0.1";
        "mime-db@1.33.0" = f "mime-db" "1.33.0" y "a3492050a5cb9b63450541e39d9788d2272783db" [];
        "mime-db@~1.33.0" = s."mime-db@1.33.0";
        "mime-types@2.1.18" = f "mime-types" "2.1.18" y "6f323f60a83d11146f831ff11fd66e2fe5503bb8" [
          (s."mime-db@~1.33.0")
        ];
        "mime-types@^2.1.12" = s."mime-types@2.1.18";
        "mime-types@~2.1.17" = s."mime-types@2.1.18";
        "mime@1.6.0" = f "mime" "1.6.0" y "32cd9e5c64553bd58d19a568af452acff04981b1" [];
        "mime@^1.2.9" = s."mime@1.6.0";
        "minimalistic-assert@1.0.1" = f "minimalistic-assert" "1.0.1" y "2e194de044626d4a10e7f7fbc00ce73e83e4d5c7" [];
        "minimalistic-assert@^1.0.0" = s."minimalistic-assert@1.0.1";
        "minimalistic-crypto-utils@1.0.1" = f "minimalistic-crypto-utils" "1.0.1" y "f6c00c1c0b082246e5c4d99dfb8c7c083b2b582a" [];
        "minimalistic-crypto-utils@^1.0.0" = s."minimalistic-crypto-utils@1.0.1";
        "minimalistic-crypto-utils@^1.0.1" = s."minimalistic-crypto-utils@1.0.1";
        "minimatch@2 || 3" = s."minimatch@3.0.4";
        "minimatch@2.0.10" = f "minimatch" "2.0.10" y "8d087c39c6b38c001b97fca7ce6d0e1e80afbac7" [
          (s."brace-expansion@^1.0.0")
        ];
        "minimatch@3.0.4" = f "minimatch" "3.0.4" y "5166e286457f03306064be5497e8dbb0c3d32083" [
          (s."brace-expansion@^1.1.7")
        ];
        "minimatch@^2.0.3" = s."minimatch@2.0.10";
        "minimatch@^3.0.2" = s."minimatch@3.0.4";
        "minimatch@^3.0.3" = s."minimatch@3.0.4";
        "minimatch@^3.0.4" = s."minimatch@3.0.4";
        "minimatch@~3.0.2" = s."minimatch@3.0.4";
        "minimist@0.0.10" = f "minimist" "0.0.10" y "de3f98543dbf96082be48ad1a0c7cda836301dcf" [];
        "minimist@0.0.8" = f "minimist" "0.0.8" y "857fcabfc3397d2625b8228262e86aa7a011b05d" [];
        "minimist@1.2.0" = f "minimist" "1.2.0" y "a35008b20f41383eec1fb914f4cd5df79a264284" [];
        "minimist@^1.1.0" = s."minimist@1.2.0";
        "minimist@^1.1.3" = s."minimist@1.2.0";
        "minimist@^1.2.0" = s."minimist@1.2.0";
        "minimist@~0.0.1" = s."minimist@0.0.10";
        "minipass@2.2.4" = f "minipass" "2.2.4" y "03c824d84551ec38a8d1bb5bc350a5a30a354a40" [
          (s."safe-buffer@^5.1.1")
          (s."yallist@^3.0.0")
        ];
        "minipass@^2.2.1" = s."minipass@2.2.4";
        "minipass@^2.2.4" = s."minipass@2.2.4";
        "minizlib@1.1.0" = f "minizlib" "1.1.0" y "11e13658ce46bc3a70a267aac58359d1e0c29ceb" [
          (s."minipass@^2.2.1")
        ];
        "minizlib@^1.1.0" = s."minizlib@1.1.0";
        "mixin-deep@1.3.1" = f "mixin-deep" "1.3.1" y "a49e7268dce1a0d9698e45326c5626df3543d0fe" [
          (s."for-in@^1.0.2")
          (s."is-extendable@^1.0.1")
        ];
        "mixin-deep@^1.2.0" = s."mixin-deep@1.3.1";
        "mkdirp@0.5.1" = f "mkdirp" "0.5.1" y "30057438eac6cf7f8c4767f38648d6697d75c903" [
          (s."minimist@0.0.8")
        ];
        "mkdirp@>=0.5 0" = s."mkdirp@0.5.1";
        "mkdirp@^0.5.0" = s."mkdirp@0.5.1";
        "mkdirp@^0.5.1" = s."mkdirp@0.5.1";
        "mocha@3.5.3" = f "mocha" "3.5.3" y "1e0480fe36d2da5858d1eb6acc38418b26eaa20d" [
          (s."browser-stdout@1.3.0")
          (s."commander@2.9.0")
          (s."debug@2.6.8")
          (s."diff@3.2.0")
          (s."escape-string-regexp@1.0.5")
          (s."glob@7.1.1")
          (s."growl@1.9.2")
          (s."he@1.1.1")
          (s."json3@3.3.2")
          (s."lodash.create@3.1.1")
          (s."mkdirp@0.5.1")
          (s."supports-color@3.1.2")
        ];
        "mocha@^3.1.2" = s."mocha@3.5.3";
        "module-deps@4.1.1" = f "module-deps" "4.1.1" y "23215833f1da13fd606ccb8087b44852dcb821fd" [
          (s."JSONStream@^1.0.3")
          (s."browser-resolve@^1.7.0")
          (s."cached-path-relative@^1.0.0")
          (s."concat-stream@~1.5.0")
          (s."defined@^1.0.0")
          (s."detective@^4.0.0")
          (s."duplexer2@^0.1.2")
          (s."inherits@^2.0.1")
          (s."parents@^1.0.0")
          (s."readable-stream@^2.0.2")
          (s."resolve@^1.1.3")
          (s."stream-combiner2@^1.1.1")
          (s."subarg@^1.0.0")
          (s."through2@^2.0.0")
          (s."xtend@^4.0.0")
        ];
        "module-deps@^4.0.8" = s."module-deps@4.1.1";
        "mold-source-map@0.4.0" = f "mold-source-map" "0.4.0" y "cf67e0b31c47ab9badb5c9c25651862127bb8317" [
          (s."convert-source-map@^1.1.0")
          (s."through@~2.2.7")
        ];
        "mold-source-map@^0.4.0" = s."mold-source-map@0.4.0";
        "ms@2.0.0" = f "ms" "2.0.0" y "5608aeadfc00be6c2901df5f9861788de0d597c8" [];
        "mute-stream@0.0.7" = f "mute-stream" "0.0.7" y "3075ce93bc21b8fab43e1bc4da7e8115ed1e7bab" [];
        "mute-stream@~0.0.4" = s."mute-stream@0.0.7";
        "mz@2.7.0" = f "mz" "2.7.0" y "95008057a56cafadc2bc63dde7f9ff6955948e32" [
          (s."any-promise@^1.0.0")
          (s."object-assign@^4.0.1")
          (s."thenify-all@^1.0.0")
        ];
        "mz@^2.3.1" = s."mz@2.7.0";
        "nan@2.10.0" = f "nan" "2.10.0" y "96d0cd610ebd58d4b4de9cc0c6828cda99c7548f" [];
        "nan@^2.9.2" = s."nan@2.10.0";
        "nanomatch@1.2.9" = f "nanomatch" "1.2.9" y "879f7150cb2dab7a471259066c104eee6e0fa7c2" [
          (s."arr-diff@^4.0.0")
          (s."array-unique@^0.3.2")
          (s."define-property@^2.0.2")
          (s."extend-shallow@^3.0.2")
          (s."fragment-cache@^0.2.1")
          (s."is-odd@^2.0.0")
          (s."is-windows@^1.0.2")
          (s."kind-of@^6.0.2")
          (s."object.pick@^1.3.0")
          (s."regex-not@^1.0.0")
          (s."snapdragon@^0.8.1")
          (s."to-regex@^3.0.1")
        ];
        "nanomatch@^1.2.9" = s."nanomatch@1.2.9";
        "needle@2.2.1" = f "needle" "2.2.1" y "b5e325bd3aae8c2678902fa296f729455d1d3a7d" [
          (s."debug@^2.1.2")
          (s."iconv-lite@^0.4.4")
          (s."sax@^1.2.4")
        ];
        "needle@^2.2.0" = s."needle@2.2.1";
        "neo-async@2.5.1" = f "neo-async" "2.5.1" y "acb909e327b1e87ec9ef15f41b8a269512ad41ee" [];
        "neo-async@^2.5.0" = s."neo-async@2.5.1";
        "node-pre-gyp@0.9.1" = f "node-pre-gyp" "0.9.1" y "f11c07516dd92f87199dbc7e1838eab7cd56c9e0" [
          (s."detect-libc@^1.0.2")
          (s."mkdirp@^0.5.1")
          (s."needle@^2.2.0")
          (s."nopt@^4.0.1")
          (s."npm-packlist@^1.1.6")
          (s."npmlog@^4.0.2")
          (s."rc@^1.1.7")
          (s."rimraf@^2.6.1")
          (s."semver@^5.3.0")
          (s."tar@^4")
        ];
        "node-pre-gyp@^0.9.0" = s."node-pre-gyp@0.9.1";
        "node-static@0.7.10" = f "node-static" "0.7.10" y "a1ddb72027c7f67179fb33487807b57e8bc7d2e7" [
          (s."colors@>=0.6.0")
          (s."mime@^1.2.9")
          (s."optimist@>=0.3.4")
        ];
        "node-static@^0.7.9" = s."node-static@0.7.10";
        "node-status-codes@1.0.0" = f "node-status-codes" "1.0.0" y "5ae5541d024645d32a58fcddc9ceecea7ae3ac2f" [];
        "node-status-codes@^1.0.0" = s."node-status-codes@1.0.0";
        "nopt@1.0.10" = f "nopt" "1.0.10" y "6ddd21bd2a31417b92727dd585f8a6f37608ebee" [
          (s."abbrev@1")
        ];
        "nopt@4.0.1" = f "nopt" "4.0.1" y "d0d4685afd5415193c8c7505602d0d17cd64474d" [
          (s."abbrev@1")
          (s."osenv@^0.1.4")
        ];
        "nopt@^4.0.1" = s."nopt@4.0.1";
        "nopt@~1.0.10" = s."nopt@1.0.10";
        "normalize-package-data@2.4.0" = f "normalize-package-data" "2.4.0" y "12f95a307d58352075a04907b84ac8be98ac012f" [
          (s."hosted-git-info@^2.1.4")
          (s."is-builtin-module@^1.0.0")
          (s."semver@2 || 3 || 4 || 5")
          (s."validate-npm-package-license@^3.0.1")
        ];
        "normalize-package-data@^2.3.2" = s."normalize-package-data@2.4.0";
        "normalize-package-data@^2.3.4" = s."normalize-package-data@2.4.0";
        "normalize-path@2.1.1" = f "normalize-path" "2.1.1" y "1ab28b556e198363a8c1a6f7e6fa20137fe6aed9" [
          (s."remove-trailing-separator@^1.0.1")
        ];
        "normalize-path@^2.0.0" = s."normalize-path@2.1.1";
        "normalize-path@^2.0.1" = s."normalize-path@2.1.1";
        "normalize-path@^2.1.1" = s."normalize-path@2.1.1";
        "npm-bundled@1.0.3" = f "npm-bundled" "1.0.3" y "7e71703d973af3370a9591bafe3a63aca0be2308" [];
        "npm-bundled@^1.0.1" = s."npm-bundled@1.0.3";
        "npm-packlist@1.1.10" = f "npm-packlist" "1.1.10" y "1039db9e985727e464df066f4cf0ab6ef85c398a" [
          (s."ignore-walk@^3.0.1")
          (s."npm-bundled@^1.0.1")
        ];
        "npm-packlist@^1.1.6" = s."npm-packlist@1.1.10";
        "npmlog@4.1.2" = f "npmlog" "4.1.2" y "08a7f2a8bf734604779a9efa4ad5cc717abb954b" [
          (s."are-we-there-yet@~1.1.2")
          (s."console-control-strings@~1.1.0")
          (s."gauge@~2.7.3")
          (s."set-blocking@~2.0.0")
        ];
        "npmlog@^4.0.2" = s."npmlog@4.1.2";
        "nugget@1.6.2" = f "nugget" "1.6.2" y "88ca6e03ba5706a99173f5da0902593d6bcae107" [
          (s."debug@^2.1.3")
          (s."minimist@^1.1.0")
          (s."pretty-bytes@^1.0.2")
          (s."progress-stream@^1.1.0")
          (s."request@^2.45.0")
          (s."single-line-log@^0.4.1")
          (s."throttleit@0.0.2")
        ];
        "nugget@^1.5.4" = s."nugget@1.6.2";
        "number-is-nan@1.0.1" = f "number-is-nan" "1.0.1" y "097b602b53422a522c1afb8790318336941a011d" [];
        "number-is-nan@^1.0.0" = s."number-is-nan@1.0.1";
        "oauth-sign@0.8.2" = f "oauth-sign" "0.8.2" y "46a6ab7f0aead8deae9ec0565780b7d4efeb9d43" [];
        "oauth-sign@~0.8.2" = s."oauth-sign@0.8.2";
        "object-assign@3.0.0" = f "object-assign" "3.0.0" y "9bedd5ca0897949bca47e7ff408062d549f587f2" [];
        "object-assign@4.1.1" = f "object-assign" "4.1.1" y "2109adc7965887cfc05cbbd442cac8bfbb360863" [];
        "object-assign@^3.0.0" = s."object-assign@3.0.0";
        "object-assign@^4.0.1" = s."object-assign@4.1.1";
        "object-assign@^4.1.0" = s."object-assign@4.1.1";
        "object-copy@0.1.0" = f "object-copy" "0.1.0" y "7e7d858b781bd7c991a41ba975ed3812754e998c" [
          (s."copy-descriptor@^0.1.0")
          (s."define-property@^0.2.5")
          (s."kind-of@^3.0.3")
        ];
        "object-copy@^0.1.0" = s."object-copy@0.1.0";
        "object-keys@0.4.0" = f "object-keys" "0.4.0" y "28a6aae7428dd2c3a92f3d95f21335dd204e0336" [];
        "object-keys@~0.4.0" = s."object-keys@0.4.0";
        "object-visit@1.0.1" = f "object-visit" "1.0.1" y "f79c4493af0c5377b59fe39d395e41042dd045bb" [
          (s."isobject@^3.0.0")
        ];
        "object-visit@^1.0.0" = s."object-visit@1.0.1";
        "object.omit@2.0.1" = f "object.omit" "2.0.1" y "1a9c744829f39dbb858c76ca3579ae2a54ebd1fa" [
          (s."for-own@^0.1.4")
          (s."is-extendable@^0.1.1")
        ];
        "object.omit@^2.0.0" = s."object.omit@2.0.1";
        "object.pick@1.3.0" = f "object.pick" "1.3.0" y "87a10ac4c1694bd2e1cbf53591a66141fb5dd747" [
          (s."isobject@^3.0.1")
        ];
        "object.pick@^1.3.0" = s."object.pick@1.3.0";
        "once@1.4.0" = f "once" "1.4.0" y "583b1aa775961d4b113ac17d9c50baef9dd76bd1" [
          (s."wrappy@1")
        ];
        "once@^1.3.0" = s."once@1.4.0";
        "once@^1.4.0" = s."once@1.4.0";
        "optimist@0.6.1" = f "optimist" "0.6.1" y "da3ea74686fa21a19a111c326e90eb15a0196686" [
          (s."minimist@~0.0.1")
          (s."wordwrap@~0.0.2")
        ];
        "optimist@>=0.3.4" = s."optimist@0.6.1";
        "os-browserify@0.1.2" = f "os-browserify" "0.1.2" y "49ca0293e0b19590a5f5de10c7f265a617d8fe54" [];
        "os-browserify@~0.1.1" = s."os-browserify@0.1.2";
        "os-homedir@1.0.2" = f "os-homedir" "1.0.2" y "ffbc4988336e0e833de0c168c7ef152121aa7fb3" [];
        "os-homedir@^1.0.0" = s."os-homedir@1.0.2";
        "os-locale@1.4.0" = f "os-locale" "1.4.0" y "20f9f17ae29ed345e8bde583b13d2009803c14d9" [
          (s."lcid@^1.0.0")
        ];
        "os-locale@^1.4.0" = s."os-locale@1.4.0";
        "os-tmpdir@1.0.2" = f "os-tmpdir" "1.0.2" y "bbe67406c79aa85c5cfec766fe5734555dfa1274" [];
        "os-tmpdir@^1.0.0" = s."os-tmpdir@1.0.2";
        "os-tmpdir@^1.0.1" = s."os-tmpdir@1.0.2";
        "osenv@0.1.5" = f "osenv" "0.1.5" y "85cdfafaeb28e8677f416e287592b5f3f49ea410" [
          (s."os-homedir@^1.0.0")
          (s."os-tmpdir@^1.0.0")
        ];
        "osenv@^0.1.4" = s."osenv@0.1.5";
        "output-file-sync@1.1.2" = f "output-file-sync" "1.1.2" y "d0a33eefe61a205facb90092e826598d5245ce76" [
          (s."graceful-fs@^4.1.4")
          (s."mkdirp@^0.5.1")
          (s."object-assign@^4.1.0")
        ];
        "output-file-sync@^1.1.0" = s."output-file-sync@1.1.2";
        "pako@0.2.9" = f "pako" "0.2.9" y "f3f7522f4ef782348da8161bad9ecfd51bf83a75" [];
        "pako@~0.2.0" = s."pako@0.2.9";
        "parents@1.0.1" = f "parents" "1.0.1" y "fedd4d2bf193a77745fe71e371d73c3307d9c751" [
          (s."path-platform@~0.11.15")
        ];
        "parents@^1.0.0" = s."parents@1.0.1";
        "parents@^1.0.1" = s."parents@1.0.1";
        "parse-asn1@5.1.1" = f "parse-asn1" "5.1.1" y "f6bf293818332bd0dab54efb16087724745e6ca8" [
          (s."asn1.js@^4.0.0")
          (s."browserify-aes@^1.0.0")
          (s."create-hash@^1.1.0")
          (s."evp_bytestokey@^1.0.0")
          (s."pbkdf2@^3.0.3")
        ];
        "parse-asn1@^5.0.0" = s."parse-asn1@5.1.1";
        "parse-glob@3.0.4" = f "parse-glob" "3.0.4" y "b2c376cfb11f35513badd173ef0bb6e3a388391c" [
          (s."glob-base@^0.3.0")
          (s."is-dotfile@^1.0.0")
          (s."is-extglob@^1.0.0")
          (s."is-glob@^2.0.0")
        ];
        "parse-glob@^3.0.4" = s."parse-glob@3.0.4";
        "parse-json@2.2.0" = f "parse-json" "2.2.0" y "f480f40434ef80741f8469099f8dea18f55a4dc9" [
          (s."error-ex@^1.2.0")
        ];
        "parse-json@^2.1.0" = s."parse-json@2.2.0";
        "parse-json@^2.2.0" = s."parse-json@2.2.0";
        "pascalcase@0.1.1" = f "pascalcase" "0.1.1" y "b363e55e8006ca6fe21784d2db22bd15d7917f14" [];
        "pascalcase@^0.1.1" = s."pascalcase@0.1.1";
        "path-browserify@0.0.0" = f "path-browserify" "0.0.0" y "a0b870729aae214005b7d5032ec2cbbb0fb4451a" [];
        "path-browserify@~0.0.0" = s."path-browserify@0.0.0";
        "path-dirname@1.0.2" = f "path-dirname" "1.0.2" y "cc33d24d525e099a5388c0336c6e32b9160609e0" [];
        "path-dirname@^1.0.0" = s."path-dirname@1.0.2";
        "path-exists@1.0.0" = f "path-exists" "1.0.0" y "d5a8998eb71ef37a74c34eb0d9eba6e878eea081" [];
        "path-exists@2.1.0" = f "path-exists" "2.1.0" y "0feb6c64f0fc518d9a754dd5efb62c7022761f4b" [
          (s."pinkie-promise@^2.0.0")
        ];
        "path-exists@^1.0.0" = s."path-exists@1.0.0";
        "path-exists@^2.0.0" = s."path-exists@2.1.0";
        "path-is-absolute@1.0.1" = f "path-is-absolute" "1.0.1" y "174b9268735534ffbc7ace6bf53a5a9e1b5c5f5f" [];
        "path-is-absolute@^1.0.0" = s."path-is-absolute@1.0.1";
        "path-is-absolute@^1.0.1" = s."path-is-absolute@1.0.1";
        "path-parse@1.0.5" = f "path-parse" "1.0.5" y "3c1adf871ea9cd6c9431b6ea2bd74a0ff055c4c1" [];
        "path-parse@^1.0.5" = s."path-parse@1.0.5";
        "path-platform@0.11.15" = f "path-platform" "0.11.15" y "e864217f74c36850f0852b78dc7bf7d4a5721bf2" [];
        "path-platform@~0.11.15" = s."path-platform@0.11.15";
        "path-type@1.1.0" = f "path-type" "1.1.0" y "59c44f7ee491da704da415da5a4070ba4f8fe441" [
          (s."graceful-fs@^4.1.2")
          (s."pify@^2.0.0")
          (s."pinkie-promise@^2.0.0")
        ];
        "path-type@^1.0.0" = s."path-type@1.1.0";
        "pbkdf2@3.0.16" = f "pbkdf2" "3.0.16" y "7404208ec6b01b62d85bf83853a8064f8d9c2a5c" [
          (s."create-hash@^1.1.2")
          (s."create-hmac@^1.1.4")
          (s."ripemd160@^2.0.1")
          (s."safe-buffer@^5.0.1")
          (s."sha.js@^2.4.8")
        ];
        "pbkdf2@^3.0.3" = s."pbkdf2@3.0.16";
        "performance-now@2.1.0" = f "performance-now" "2.1.0" y "6309f4e0e5fa913ec1c69307ae364b4b377c9e7b" [];
        "performance-now@^2.1.0" = s."performance-now@2.1.0";
        "pify@2.3.0" = f "pify" "2.3.0" y "ed141a6ac043a849ea588498e7dca8b15330e90c" [];
        "pify@^2.0.0" = s."pify@2.3.0";
        "pinkie-promise@1.0.0" = f "pinkie-promise" "1.0.0" y "d1da67f5482563bb7cf57f286ae2822ecfbf3670" [
          (s."pinkie@^1.0.0")
        ];
        "pinkie-promise@2.0.1" = f "pinkie-promise" "2.0.1" y "2135d6dfa7a358c069ac9b178776288228450ffa" [
          (s."pinkie@^2.0.0")
        ];
        "pinkie-promise@^1.0.0" = s."pinkie-promise@1.0.0";
        "pinkie-promise@^2.0.0" = s."pinkie-promise@2.0.1";
        "pinkie@1.0.0" = f "pinkie" "1.0.0" y "5a47f28ba1015d0201bda7bf0f358e47bec8c7e4" [];
        "pinkie@2.0.4" = f "pinkie" "2.0.4" y "72556b80cfa0d48a974e80e77248e80ed4f7f870" [];
        "pinkie@^1.0.0" = s."pinkie@1.0.0";
        "pinkie@^2.0.0" = s."pinkie@2.0.4";
        "posix-character-classes@0.1.1" = f "posix-character-classes" "0.1.1" y "01eac0fe3b5af71a2a6c02feabb8c1fef7e00eab" [];
        "posix-character-classes@^0.1.0" = s."posix-character-classes@0.1.1";
        "prepend-http@1.0.4" = f "prepend-http" "1.0.4" y "d4f4562b0ce3696e41ac52d0e002e57a635dc6dc" [];
        "prepend-http@^1.0.0" = s."prepend-http@1.0.4";
        "preserve@0.2.0" = f "preserve" "0.2.0" y "815ed1f6ebc65926f865b310c0713bcb3315ce4b" [];
        "preserve@^0.2.0" = s."preserve@0.2.0";
        "pretty-bytes@1.0.4" = f "pretty-bytes" "1.0.4" y "0a22e8210609ad35542f8c8d5d2159aff0751c84" [
          (s."get-stdin@^4.0.1")
          (s."meow@^3.1.0")
        ];
        "pretty-bytes@^1.0.2" = s."pretty-bytes@1.0.4";
        "private@0.1.8" = f "private" "0.1.8" y "2381edb3689f7a53d653190060fcf822d2f368ff" [];
        "private@^0.1.6" = s."private@0.1.8";
        "private@~0.1.5" = s."private@0.1.8";
        "process-nextick-args@1.0.7" = f "process-nextick-args" "1.0.7" y "150e20b756590ad3f91093f25a4f2ad8bff30ba3" [];
        "process-nextick-args@2.0.0" = f "process-nextick-args" "2.0.0" y "a37d732f4271b4ab1ad070d35508e8290788ffaa" [];
        "process-nextick-args@~1.0.6" = s."process-nextick-args@1.0.7";
        "process-nextick-args@~2.0.0" = s."process-nextick-args@2.0.0";
        "process@0.11.10" = f "process" "0.11.10" y "7332300e840161bda3e69a1d1d91a7d4bc16f182" [];
        "process@~0.11.0" = s."process@0.11.10";
        "progress-stream@1.2.0" = f "progress-stream" "1.2.0" y "2cd3cfea33ba3a89c9c121ec3347abe9ab125f77" [
          (s."speedometer@~0.1.2")
          (s."through2@~0.2.3")
        ];
        "progress-stream@^1.1.0" = s."progress-stream@1.2.0";
        "psvm@0.1.5" = f "psvm" "0.1.5" y "39a1717e61e81931ab673b8faae1ddc25354acdc" [
          (s."bluebird@^2.9.34")
          (s."cliparse@^0.2.6")
          (s."glob@^7.0")
          (s."got@^4.1.1")
          (s."nugget@^1.5.4")
          (s."ramda@^0.17.1")
          (s."rimraf@^2.4.2")
          (s."tar@2.2.1")
          (s."tarball-extract@0.0.3")
        ];
        "psvm@^0.1.4" = s."psvm@0.1.5";
        "public-encrypt@4.0.2" = f "public-encrypt" "4.0.2" y "46eb9107206bf73489f8b85b69d91334c6610994" [
          (s."bn.js@^4.1.0")
          (s."browserify-rsa@^4.0.0")
          (s."create-hash@^1.1.0")
          (s."parse-asn1@^5.0.0")
          (s."randombytes@^2.0.1")
        ];
        "public-encrypt@^4.0.0" = s."public-encrypt@4.0.2";
        "pulp@12.2.0" = f "pulp" "12.2.0" y "f0705e4a2ac5e62651b87f3f266cf603de449631" [
          (s."browserify@^13.1.0")
          (s."browserify-incremental@^3.0.1")
          (s."concat-stream@^1.4.6")
          (s."glob@^7.1.1")
          (s."minimatch@^3.0.3")
          (s."mold-source-map@^0.4.0")
          (s."node-static@^0.7.9")
          (s."read@^1.0.7")
          (s."sorcery@^0.10.0")
          (s."string-stream@0.0.7")
          (s."temp@^0.8.1")
          (s."through@^2.3.8")
          (s."tree-kill@^1.0.0")
          (s."watchpack@^1.0.1")
          (s."which@^1.2.1")
          (s."wordwrap@1.0.0")
        ];
        "pulp@^12.2.0" = s."pulp@12.2.0";
        "punycode@1.3.2" = f "punycode" "1.3.2" y "9653a036fb7c1ee42342f2325cceefea3926c48d" [];
        "punycode@1.4.1" = f "punycode" "1.4.1" y "c0d5a63b2718800ad8e1eb0fa5269c84dd41845e" [];
        "punycode@^1.3.2" = s."punycode@1.4.1";
        "punycode@^1.4.1" = s."punycode@1.4.1";
        "purescript-psa@0.5.1" = f "purescript-psa" "0.5.1" y "2e435eef22bd2f57eba182cbff120022ca0f265f" [];
        "purescript-psa@^0.5.0" = s."purescript-psa@0.5.1";
        "q@1.5.1" = f "q" "1.5.1" y "7e32f75b41381291d04611f1bf14109ac00651d7" [];
        "q@^1.1.2" = s."q@1.5.1";
        "qs@6.5.1" = f "qs" "6.5.1" y "349cdf6eef89ec45c12d7d5eb3fc0c870343a6d8" [];
        "qs@~6.5.1" = s."qs@6.5.1";
        "querystring-es3@0.2.1" = f "querystring-es3" "0.2.1" y "9ec61f79049875707d69414596fd907a4d711e73" [];
        "querystring-es3@~0.2.0" = s."querystring-es3@0.2.1";
        "querystring@0.2.0" = f "querystring" "0.2.0" y "b209849203bb25df820da756e747005878521620" [];
        "ramda@0.17.1" = f "ramda" "0.17.1" y "4c198147d3ab54e8c15255f11730e2116f6e6073" [];
        "ramda@^0.17.1" = s."ramda@0.17.1";
        "randomatic@1.1.7" = f "randomatic" "1.1.7" y "c7abe9cc8b87c0baa876b19fde83fd464797e38c" [
          (s."is-number@^3.0.0")
          (s."kind-of@^4.0.0")
        ];
        "randomatic@^1.1.3" = s."randomatic@1.1.7";
        "randombytes@2.0.6" = f "randombytes" "2.0.6" y "d302c522948588848a8d300c932b44c24231da80" [
          (s."safe-buffer@^5.1.0")
        ];
        "randombytes@^2.0.0" = s."randombytes@2.0.6";
        "randombytes@^2.0.1" = s."randombytes@2.0.6";
        "randombytes@^2.0.5" = s."randombytes@2.0.6";
        "randomfill@1.0.4" = f "randomfill" "1.0.4" y "c92196fc86ab42be983f1bf31778224931d61458" [
          (s."randombytes@^2.0.5")
          (s."safe-buffer@^5.1.0")
        ];
        "randomfill@^1.0.3" = s."randomfill@1.0.4";
        "rc@1.2.7" = f "rc" "1.2.7" y "8a10ca30d588d00464360372b890d06dacd02297" [
          (s."deep-extend@^0.5.1")
          (s."ini@~1.3.0")
          (s."minimist@^1.2.0")
          (s."strip-json-comments@~2.0.1")
        ];
        "rc@^1.1.7" = s."rc@1.2.7";
        "read-all-stream@3.1.0" = f "read-all-stream" "3.1.0" y "35c3e177f2078ef789ee4bfafa4373074eaef4fa" [
          (s."pinkie-promise@^2.0.0")
          (s."readable-stream@^2.0.0")
        ];
        "read-all-stream@^3.0.0" = s."read-all-stream@3.1.0";
        "read-only-stream@2.0.0" = f "read-only-stream" "2.0.0" y "2724fd6a8113d73764ac288d4386270c1dbf17f0" [
          (s."readable-stream@^2.0.2")
        ];
        "read-only-stream@^2.0.0" = s."read-only-stream@2.0.0";
        "read-pkg-up@1.0.1" = f "read-pkg-up" "1.0.1" y "9d63c13276c065918d57f002a57f40a1b643fb02" [
          (s."find-up@^1.0.0")
          (s."read-pkg@^1.0.0")
        ];
        "read-pkg-up@^1.0.1" = s."read-pkg-up@1.0.1";
        "read-pkg@1.1.0" = f "read-pkg" "1.1.0" y "f5ffaa5ecd29cb31c0474bca7d756b6bb29e3f28" [
          (s."load-json-file@^1.0.0")
          (s."normalize-package-data@^2.3.2")
          (s."path-type@^1.0.0")
        ];
        "read-pkg@^1.0.0" = s."read-pkg@1.1.0";
        "read@1.0.7" = f "read" "1.0.7" y "b3da19bd052431a97671d44a42634adf710b40c4" [
          (s."mute-stream@~0.0.4")
        ];
        "read@^1.0.7" = s."read@1.0.7";
        "readable-stream@1.1" = s."readable-stream@1.1.13";
        "readable-stream@1.1.13" = f "readable-stream" "1.1.13" y "f6eef764f514c89e2b9e23146a75ba106756d23e" [
          (s."core-util-is@~1.0.0")
          (s."inherits@~2.0.1")
          (s."isarray@0.0.1")
          (s."string_decoder@~0.10.x")
        ];
        "readable-stream@1.1.14" = f "readable-stream" "1.1.14" y "7cf4c54ef648e3813084c636dd2079e166c081d9" [
          (s."core-util-is@~1.0.0")
          (s."inherits@~2.0.1")
          (s."isarray@0.0.1")
          (s."string_decoder@~0.10.x")
        ];
        "readable-stream@2.0.6" = f "readable-stream" "2.0.6" y "8f90341e68a53ccc928788dacfcd11b36eb9b78e" [
          (s."core-util-is@~1.0.0")
          (s."inherits@~2.0.1")
          (s."isarray@~1.0.0")
          (s."process-nextick-args@~1.0.6")
          (s."string_decoder@~0.10.x")
          (s."util-deprecate@~1.0.1")
        ];
        "readable-stream@2.3.6" = f "readable-stream" "2.3.6" y "b11c27d88b8ff1fbe070643cf94b0c79ae1b0aaf" [
          (s."core-util-is@~1.0.0")
          (s."inherits@~2.0.3")
          (s."isarray@~1.0.0")
          (s."process-nextick-args@~2.0.0")
          (s."safe-buffer@~5.1.1")
          (s."string_decoder@~1.1.1")
          (s."util-deprecate@~1.0.1")
        ];
        "readable-stream@^2.0.0" = s."readable-stream@2.3.6";
        "readable-stream@^2.0.2" = s."readable-stream@2.3.6";
        "readable-stream@^2.0.6" = s."readable-stream@2.3.6";
        "readable-stream@^2.1.5" = s."readable-stream@2.3.6";
        "readable-stream@^2.2.2" = s."readable-stream@2.3.6";
        "readable-stream@^2.3.3" = s."readable-stream@2.3.6";
        "readable-stream@~1.1.9" = s."readable-stream@1.1.14";
        "readable-stream@~2.0.0" = s."readable-stream@2.0.6";
        "readdirp@2.1.0" = f "readdirp" "2.1.0" y "4ed0ad060df3073300c48440373f72d1cc642d78" [
          (s."graceful-fs@^4.1.2")
          (s."minimatch@^3.0.2")
          (s."readable-stream@^2.0.2")
          (s."set-immediate-shim@^1.0.1")
        ];
        "readdirp@^2.0.0" = s."readdirp@2.1.0";
        "recast@0.10.33" = f "recast" "0.10.33" y "942808f7aa016f1fa7142c461d7e5704aaa8d697" [
          (s."ast-types@0.8.12")
          (s."esprima-fb@~15001.1001.0-dev-harmony-fb")
          (s."private@~0.1.5")
          (s."source-map@~0.5.0")
        ];
        "recast@0.10.43" = f "recast" "0.10.43" y "b95d50f6d60761a5f6252e15d80678168491ce7f" [
          (s."ast-types@0.8.15")
          (s."esprima-fb@~15001.1001.0-dev-harmony-fb")
          (s."private@~0.1.5")
          (s."source-map@~0.5.0")
        ];
        "recast@0.11.23" = f "recast" "0.11.23" y "451fd3004ab1e4df9b4e4b66376b2a21912462d3" [
          (s."ast-types@0.9.6")
          (s."esprima@~3.1.0")
          (s."private@~0.1.5")
          (s."source-map@~0.5.0")
        ];
        "recast@^0.10.10" = s."recast@0.10.43";
        "recast@^0.11.17" = s."recast@0.11.23";
        "redent@1.0.0" = f "redent" "1.0.0" y "cf916ab1fd5f1f16dfb20822dd6ec7f730c2afde" [
          (s."indent-string@^2.1.0")
          (s."strip-indent@^1.0.1")
        ];
        "redent@^1.0.0" = s."redent@1.0.0";
        "regenerate@1.3.3" = f "regenerate" "1.3.3" y "0c336d3980553d755c39b586ae3b20aa49c82b7f" [];
        "regenerate@^1.2.1" = s."regenerate@1.3.3";
        "regenerator@0.8.40" = f "regenerator" "0.8.40" y "a0e457c58ebdbae575c9f8cd75127e93756435d8" [
          (s."commoner@~0.10.3")
          (s."defs@~1.1.0")
          (s."esprima-fb@~15001.1001.0-dev-harmony-fb")
          (s."private@~0.1.5")
          (s."recast@0.10.33")
          (s."through@~2.3.8")
        ];
        "regex-cache@0.4.4" = f "regex-cache" "0.4.4" y "75bdc58a2a1496cec48a12835bc54c8d562336dd" [
          (s."is-equal-shallow@^0.1.3")
        ];
        "regex-cache@^0.4.2" = s."regex-cache@0.4.4";
        "regex-not@1.0.2" = f "regex-not" "1.0.2" y "1f4ece27e00b0b65e0247a6810e6a85d83a5752c" [
          (s."extend-shallow@^3.0.2")
          (s."safe-regex@^1.1.0")
        ];
        "regex-not@^1.0.0" = s."regex-not@1.0.2";
        "regex-not@^1.0.2" = s."regex-not@1.0.2";
        "regexpu@1.3.0" = f "regexpu" "1.3.0" y "e534dc991a9e5846050c98de6d7dd4a55c9ea16d" [
          (s."esprima@^2.6.0")
          (s."recast@^0.10.10")
          (s."regenerate@^1.2.1")
          (s."regjsgen@^0.2.0")
          (s."regjsparser@^0.1.4")
        ];
        "regexpu@^1.3.0" = s."regexpu@1.3.0";
        "regjsgen@0.2.0" = f "regjsgen" "0.2.0" y "6c016adeac554f75823fe37ac05b92d5a4edb1f7" [];
        "regjsgen@^0.2.0" = s."regjsgen@0.2.0";
        "regjsparser@0.1.5" = f "regjsparser" "0.1.5" y "7ee8f84dc6fa792d3fd0ae228d24bd949ead205c" [
          (s."jsesc@~0.5.0")
        ];
        "regjsparser@^0.1.4" = s."regjsparser@0.1.5";
        "remove-trailing-separator@1.1.0" = f "remove-trailing-separator" "1.1.0" y "c24bce2a283adad5bc3f58e0d48249b92379d8ef" [];
        "remove-trailing-separator@^1.0.1" = s."remove-trailing-separator@1.1.0";
        "repeat-element@1.1.2" = f "repeat-element" "1.1.2" y "ef089a178d1483baae4d93eb98b4f9e4e11d990a" [];
        "repeat-element@^1.1.2" = s."repeat-element@1.1.2";
        "repeat-string@1.6.1" = f "repeat-string" "1.6.1" y "8dcae470e1c88abc2d600fff4a776286da75e637" [];
        "repeat-string@^1.5.2" = s."repeat-string@1.6.1";
        "repeat-string@^1.6.1" = s."repeat-string@1.6.1";
        "repeating@1.1.3" = f "repeating" "1.1.3" y "3d4114218877537494f97f77f9785fab810fa4ac" [
          (s."is-finite@^1.0.0")
        ];
        "repeating@2.0.1" = f "repeating" "2.0.1" y "5214c53a926d3552707527fbab415dbc08d06dda" [
          (s."is-finite@^1.0.0")
        ];
        "repeating@^1.1.0" = s."repeating@1.1.3";
        "repeating@^1.1.2" = s."repeating@1.1.3";
        "repeating@^2.0.0" = s."repeating@2.0.1";
        "request@2.85.0" = f "request" "2.85.0" y "5a03615a47c61420b3eb99b7dba204f83603e1fa" [
          (s."aws-sign2@~0.7.0")
          (s."aws4@^1.6.0")
          (s."caseless@~0.12.0")
          (s."combined-stream@~1.0.5")
          (s."extend@~3.0.1")
          (s."forever-agent@~0.6.1")
          (s."form-data@~2.3.1")
          (s."har-validator@~5.0.3")
          (s."hawk@~6.0.2")
          (s."http-signature@~1.2.0")
          (s."is-typedarray@~1.0.0")
          (s."isstream@~0.1.2")
          (s."json-stringify-safe@~5.0.1")
          (s."mime-types@~2.1.17")
          (s."oauth-sign@~0.8.2")
          (s."performance-now@^2.1.0")
          (s."qs@~6.5.1")
          (s."safe-buffer@^5.1.1")
          (s."stringstream@~0.0.5")
          (s."tough-cookie@~2.3.3")
          (s."tunnel-agent@^0.6.0")
          (s."uuid@^3.1.0")
        ];
        "request@^2.45.0" = s."request@2.85.0";
        "resolve-url@0.2.1" = f "resolve-url" "0.2.1" y "2c637fe77c893afd2a663fe21aa9080068e2052a" [];
        "resolve-url@^0.2.1" = s."resolve-url@0.2.1";
        "resolve@1.1.7" = f "resolve" "1.1.7" y "203114d82ad2c5ed9e8e0411b3932875e889e97b" [];
        "resolve@1.7.1" = f "resolve" "1.7.1" y "aadd656374fd298aee895bc026b8297418677fd3" [
          (s."path-parse@^1.0.5")
        ];
        "resolve@^1.1.3" = s."resolve@1.7.1";
        "resolve@^1.1.4" = s."resolve@1.7.1";
        "resolve@^1.1.6" = s."resolve@1.7.1";
        "ret@0.1.15" = f "ret" "0.1.15" y "b8a4825d5bdb1fc3f6f53c2bc33f81388681c7bc" [];
        "ret@~0.1.10" = s."ret@0.1.15";
        "right-align@0.1.3" = f "right-align" "0.1.3" y "61339b722fe6a3515689210d24e14c96148613ef" [
          (s."align-text@^0.1.1")
        ];
        "right-align@^0.1.1" = s."right-align@0.1.3";
        "rimraf@2" = s."rimraf@2.6.2";
        "rimraf@2.2.8" = f "rimraf" "2.2.8" y "e439be2aaee327321952730f99a8929e4fc50582" [];
        "rimraf@2.6.2" = f "rimraf" "2.6.2" y "2ed8150d24a16ea8651e6d6ef0f47c4158ce7a36" [
          (s."glob@^7.0.5")
        ];
        "rimraf@^2.2.8" = s."rimraf@2.6.2";
        "rimraf@^2.4.2" = s."rimraf@2.6.2";
        "rimraf@^2.5.2" = s."rimraf@2.6.2";
        "rimraf@^2.6.1" = s."rimraf@2.6.2";
        "rimraf@~2.2.6" = s."rimraf@2.2.8";
        "ripemd160@2.0.2" = f "ripemd160" "2.0.2" y "a1c1a6f624751577ba5d07914cbc92850585890c" [
          (s."hash-base@^3.0.0")
          (s."inherits@^2.0.1")
        ];
        "ripemd160@^2.0.0" = s."ripemd160@2.0.2";
        "ripemd160@^2.0.1" = s."ripemd160@2.0.2";
        "safe-buffer@5.1.2" = f "safe-buffer" "5.1.2" y "991ec69d296e0313747d59bdfd2b745c35f8828d" [];
        "safe-buffer@^5.0.1" = s."safe-buffer@5.1.2";
        "safe-buffer@^5.1.0" = s."safe-buffer@5.1.2";
        "safe-buffer@^5.1.1" = s."safe-buffer@5.1.2";
        "safe-buffer@^5.1.2" = s."safe-buffer@5.1.2";
        "safe-buffer@~5.1.0" = s."safe-buffer@5.1.2";
        "safe-buffer@~5.1.1" = s."safe-buffer@5.1.2";
        "safe-regex@1.1.0" = f "safe-regex" "1.1.0" y "40a3669f3b077d1e943d44629e157dd48023bf2e" [
          (s."ret@~0.1.10")
        ];
        "safe-regex@^1.1.0" = s."safe-regex@1.1.0";
        "safer-buffer@2.1.2" = f "safer-buffer" "2.1.2" y "44fa161b0187b9549dd84bb91802f9bd8385cd6a" [];
        "safer-buffer@^2.1.0" = s."safer-buffer@2.1.2";
        "sander@0.5.1" = f "sander" "0.5.1" y "741e245e231f07cafb6fdf0f133adfa216a502ad" [
          (s."es6-promise@^3.1.2")
          (s."graceful-fs@^4.1.3")
          (s."mkdirp@^0.5.1")
          (s."rimraf@^2.5.2")
        ];
        "sander@^0.5.0" = s."sander@0.5.1";
        "sax@1.2.4" = f "sax" "1.2.4" y "2816234e2378bddc4e5354fab5caa895df7100d9" [];
        "sax@^1.2.4" = s."sax@1.2.4";
        "semver@2 || 3 || 4 || 5" = s."semver@5.5.0";
        "semver@5.5.0" = f "semver" "5.5.0" y "dc4bbc7a6ca9d916dee5d43516f0092b58f7b8ab" [];
        "semver@^5.1.0" = s."semver@5.5.0";
        "semver@^5.3.0" = s."semver@5.5.0";
        "set-blocking@2.0.0" = f "set-blocking" "2.0.0" y "045f9782d011ae9a6803ddd382b24392b3d890f7" [];
        "set-blocking@~2.0.0" = s."set-blocking@2.0.0";
        "set-immediate-shim@1.0.1" = f "set-immediate-shim" "1.0.1" y "4b2b1b27eb808a9f8dcc481a58e5e56f599f3f61" [];
        "set-immediate-shim@^1.0.1" = s."set-immediate-shim@1.0.1";
        "set-value@0.4.3" = f "set-value" "0.4.3" y "7db08f9d3d22dc7f78e53af3c3bf4666ecdfccf1" [
          (s."extend-shallow@^2.0.1")
          (s."is-extendable@^0.1.1")
          (s."is-plain-object@^2.0.1")
          (s."to-object-path@^0.3.0")
        ];
        "set-value@2.0.0" = f "set-value" "2.0.0" y "71ae4a88f0feefbbf52d1ea604f3fb315ebb6274" [
          (s."extend-shallow@^2.0.1")
          (s."is-extendable@^0.1.1")
          (s."is-plain-object@^2.0.3")
          (s."split-string@^3.0.1")
        ];
        "set-value@^0.4.3" = s."set-value@0.4.3";
        "set-value@^2.0.0" = s."set-value@2.0.0";
        "sha.js@2.4.11" = f "sha.js" "2.4.11" y "37a5cf0b81ecbc6943de109ba2960d1b26584ae7" [
          (s."inherits@^2.0.1")
          (s."safe-buffer@^5.0.1")
        ];
        "sha.js@^2.4.0" = s."sha.js@2.4.11";
        "sha.js@^2.4.8" = s."sha.js@2.4.11";
        "sha.js@~2.4.4" = s."sha.js@2.4.11";
        "shasum@1.0.2" = f "shasum" "1.0.2" y "e7012310d8f417f4deb5712150e5678b87ae565f" [
          (s."json-stable-stringify@~0.0.0")
          (s."sha.js@~2.4.4")
        ];
        "shasum@^1.0.0" = s."shasum@1.0.2";
        "shebang-regex@1.0.0" = f "shebang-regex" "1.0.0" y "da42f49740c0b42db2ca9728571cb190c98efea3" [];
        "shebang-regex@^1.0.0" = s."shebang-regex@1.0.0";
        "shell-quote@1.6.1" = f "shell-quote" "1.6.1" y "f4781949cce402697127430ea3b3c5476f481767" [
          (s."array-filter@~0.0.0")
          (s."array-map@~0.0.0")
          (s."array-reduce@~0.0.0")
          (s."jsonify@~0.0.0")
        ];
        "shell-quote@^1.6.1" = s."shell-quote@1.6.1";
        "shelljs@0.3.0" = f "shelljs" "0.3.0" y "3596e6307a781544f591f37da618360f31db57b1" [];
        "shelljs@0.3.x" = s."shelljs@0.3.0";
        "signal-exit@3.0.2" = f "signal-exit" "3.0.2" y "b5fdc08f1287ea1178628e415e25132b73646c6d" [];
        "signal-exit@^3.0.0" = s."signal-exit@3.0.2";
        "simple-fmt@0.1.0" = f "simple-fmt" "0.1.0" y "191bf566a59e6530482cb25ab53b4a8dc85c3a6b" [];
        "simple-fmt@~0.1.0" = s."simple-fmt@0.1.0";
        "simple-is@0.2.0" = f "simple-is" "0.2.0" y "2abb75aade39deb5cc815ce10e6191164850baf0" [];
        "simple-is@~0.2.0" = s."simple-is@0.2.0";
        "single-line-log@0.4.1" = f "single-line-log" "0.4.1" y "87a55649f749d783ec0dcd804e8140d9873c7cee" [];
        "single-line-log@^0.4.1" = s."single-line-log@0.4.1";
        "slash@1.0.0" = f "slash" "1.0.0" y "c41f2f6c39fc16d1cd17ad4b5d896114ae470d55" [];
        "slash@^1.0.0" = s."slash@1.0.0";
        "snapdragon-node@2.1.1" = f "snapdragon-node" "2.1.1" y "6c175f86ff14bdb0724563e8f3c1b021a286853b" [
          (s."define-property@^1.0.0")
          (s."isobject@^3.0.0")
          (s."snapdragon-util@^3.0.1")
        ];
        "snapdragon-node@^2.0.1" = s."snapdragon-node@2.1.1";
        "snapdragon-util@3.0.1" = f "snapdragon-util" "3.0.1" y "f956479486f2acd79700693f6f7b805e45ab56e2" [
          (s."kind-of@^3.2.0")
        ];
        "snapdragon-util@^3.0.1" = s."snapdragon-util@3.0.1";
        "snapdragon@0.8.2" = f "snapdragon" "0.8.2" y "64922e7c565b0e14204ba1aa7d6964278d25182d" [
          (s."base@^0.11.1")
          (s."debug@^2.2.0")
          (s."define-property@^0.2.5")
          (s."extend-shallow@^2.0.1")
          (s."map-cache@^0.2.2")
          (s."source-map@^0.5.6")
          (s."source-map-resolve@^0.5.0")
          (s."use@^3.1.0")
        ];
        "snapdragon@^0.8.1" = s."snapdragon@0.8.2";
        "sntp@2.1.0" = f "sntp" "2.1.0" y "2c6cec14fedc2222739caf9b5c3d85d1cc5a2cc8" [
          (s."hoek@4.x.x")
        ];
        "sntp@2.x.x" = s."sntp@2.1.0";
        "sorcery@0.10.0" = f "sorcery" "0.10.0" y "8ae90ad7d7cb05fc59f1ab0c637845d5c15a52b7" [
          (s."buffer-crc32@^0.2.5")
          (s."minimist@^1.2.0")
          (s."sander@^0.5.0")
          (s."sourcemap-codec@^1.3.0")
        ];
        "sorcery@^0.10.0" = s."sorcery@0.10.0";
        "source-map-resolve@0.5.1" = f "source-map-resolve" "0.5.1" y "7ad0f593f2281598e854df80f19aae4b92d7a11a" [
          (s."atob@^2.0.0")
          (s."decode-uri-component@^0.2.0")
          (s."resolve-url@^0.2.1")
          (s."source-map-url@^0.4.0")
          (s."urix@^0.1.0")
        ];
        "source-map-resolve@^0.5.0" = s."source-map-resolve@0.5.1";
        "source-map-support@0.2.10" = f "source-map-support" "0.2.10" y "ea5a3900a1c1cb25096a0ae8cc5c2b4b10ded3dc" [
          (s."source-map@0.1.32")
        ];
        "source-map-support@^0.2.10" = s."source-map-support@0.2.10";
        "source-map-url@0.4.0" = f "source-map-url" "0.4.0" y "3e935d7ddd73631b97659956d55128e87b5084a3" [];
        "source-map-url@^0.4.0" = s."source-map-url@0.4.0";
        "source-map@0.1.32" = f "source-map" "0.1.32" y "c8b6c167797ba4740a8ea33252162ff08591b266" [
          (s."amdefine@>=0.0.4")
        ];
        "source-map@0.5.7" = f "source-map" "0.5.7" y "8a039d2d1021d22d1ea14c80d8ea468ba2ef3fcc" [];
        "source-map@^0.5.0" = s."source-map@0.5.7";
        "source-map@^0.5.6" = s."source-map@0.5.7";
        "source-map@~0.5.0" = s."source-map@0.5.7";
        "source-map@~0.5.3" = s."source-map@0.5.7";
        "sourcemap-codec@1.4.1" = f "sourcemap-codec" "1.4.1" y "c8fd92d91889e902a07aee392bdd2c5863958ba2" [];
        "sourcemap-codec@^1.3.0" = s."sourcemap-codec@1.4.1";
        "spdx-correct@3.0.0" = f "spdx-correct" "3.0.0" y "05a5b4d7153a195bc92c3c425b69f3b2a9524c82" [
          (s."spdx-expression-parse@^3.0.0")
          (s."spdx-license-ids@^3.0.0")
        ];
        "spdx-correct@^3.0.0" = s."spdx-correct@3.0.0";
        "spdx-exceptions@2.1.0" = f "spdx-exceptions" "2.1.0" y "2c7ae61056c714a5b9b9b2b2af7d311ef5c78fe9" [];
        "spdx-exceptions@^2.1.0" = s."spdx-exceptions@2.1.0";
        "spdx-expression-parse@3.0.0" = f "spdx-expression-parse" "3.0.0" y "99e119b7a5da00e05491c9fa338b7904823b41d0" [
          (s."spdx-exceptions@^2.1.0")
          (s."spdx-license-ids@^3.0.0")
        ];
        "spdx-expression-parse@^3.0.0" = s."spdx-expression-parse@3.0.0";
        "spdx-license-ids@3.0.0" = f "spdx-license-ids" "3.0.0" y "7a7cd28470cc6d3a1cfe6d66886f6bc430d3ac87" [];
        "spdx-license-ids@^3.0.0" = s."spdx-license-ids@3.0.0";
        "speedometer@0.1.4" = f "speedometer" "0.1.4" y "9876dbd2a169d3115402d48e6ea6329c8816a50d" [];
        "speedometer@~0.1.2" = s."speedometer@0.1.4";
        "split-string@3.1.0" = f "split-string" "3.1.0" y "7cb09dda3a86585705c64b39a6466038682e8fe2" [
          (s."extend-shallow@^3.0.0")
        ];
        "split-string@^3.0.1" = s."split-string@3.1.0";
        "split-string@^3.0.2" = s."split-string@3.1.0";
        "sshpk@1.14.1" = f "sshpk" "1.14.1" y "130f5975eddad963f1d56f92b9ac6c51fa9f83eb" [
          (s."asn1@~0.2.3")
          (s."assert-plus@^1.0.0")
          (s."dashdash@^1.12.0")
          (s."getpass@^0.1.1")
          (s."bcrypt-pbkdf@^1.0.0")
          (s."ecc-jsbn@~0.1.1")
          (s."jsbn@~0.1.0")
          (s."tweetnacl@~0.14.0")
        ];
        "sshpk@^1.7.0" = s."sshpk@1.14.1";
        "stable@0.1.8" = f "stable" "0.1.8" y "836eb3c8382fe2936feaf544631017ce7d47a3cf" [];
        "stable@~0.1.3" = s."stable@0.1.8";
        "static-extend@0.1.2" = f "static-extend" "0.1.2" y "60809c39cbff55337226fd5e0b520f341f1fb5c6" [
          (s."define-property@^0.2.5")
          (s."object-copy@^0.1.0")
        ];
        "static-extend@^0.1.1" = s."static-extend@0.1.2";
        "stream-browserify@2.0.1" = f "stream-browserify" "2.0.1" y "66266ee5f9bdb9940a4e4514cafb43bb71e5c9db" [
          (s."inherits@~2.0.1")
          (s."readable-stream@^2.0.2")
        ];
        "stream-browserify@^2.0.0" = s."stream-browserify@2.0.1";
        "stream-combiner2@1.1.1" = f "stream-combiner2" "1.1.1" y "fb4d8a1420ea362764e21ad4780397bebcb41cbe" [
          (s."duplexer2@~0.1.0")
          (s."readable-stream@^2.0.2")
        ];
        "stream-combiner2@^1.1.1" = s."stream-combiner2@1.1.1";
        "stream-http@2.8.1" = f "stream-http" "2.8.1" y "d0441be1a457a73a733a8a7b53570bebd9ef66a4" [
          (s."builtin-status-codes@^3.0.0")
          (s."inherits@^2.0.1")
          (s."readable-stream@^2.3.3")
          (s."to-arraybuffer@^1.0.0")
          (s."xtend@^4.0.0")
        ];
        "stream-http@^2.0.0" = s."stream-http@2.8.1";
        "stream-shift@1.0.0" = f "stream-shift" "1.0.0" y "d5c752825e5367e786f78e18e445ea223a155952" [];
        "stream-shift@^1.0.0" = s."stream-shift@1.0.0";
        "stream-splicer@2.0.0" = f "stream-splicer" "2.0.0" y "1b63be438a133e4b671cc1935197600175910d83" [
          (s."inherits@^2.0.1")
          (s."readable-stream@^2.0.2")
        ];
        "stream-splicer@^2.0.0" = s."stream-splicer@2.0.0";
        "string-stream@0.0.7" = f "string-stream" "0.0.7" y "cfcde82799fa62f303429aaa79336ee8834332fe" [];
        "string-width@1.0.2" = f "string-width" "1.0.2" y "118bdf5b8cdc51a2a7e70d211e07e2b0b9b107d3" [
          (s."code-point-at@^1.0.0")
          (s."is-fullwidth-code-point@^1.0.0")
          (s."strip-ansi@^3.0.0")
        ];
        "string-width@^1.0.1" = s."string-width@1.0.2";
        "string-width@^1.0.2" = s."string-width@1.0.2";
        "string_decoder@0.10.31" = f "string_decoder" "0.10.31" y "62e203bc41766c6c28c9fc84301dab1c5310fa94" [];
        "string_decoder@1.1.1" = f "string_decoder" "1.1.1" y "9cf1611ba62685d7030ae9e4ba34149c3af03fc8" [
          (s."safe-buffer@~5.1.0")
        ];
        "string_decoder@~0.10.0" = s."string_decoder@0.10.31";
        "string_decoder@~0.10.x" = s."string_decoder@0.10.31";
        "string_decoder@~1.1.1" = s."string_decoder@1.1.1";
        "stringmap@0.2.2" = f "stringmap" "0.2.2" y "556c137b258f942b8776f5b2ef582aa069d7d1b1" [];
        "stringmap@~0.2.2" = s."stringmap@0.2.2";
        "stringset@0.2.1" = f "stringset" "0.2.1" y "ef259c4e349344377fcd1c913dd2e848c9c042b5" [];
        "stringset@~0.2.1" = s."stringset@0.2.1";
        "stringstream@0.0.5" = f "stringstream" "0.0.5" y "4e484cd4de5a0bbbee18e46307710a8a81621878" [];
        "stringstream@~0.0.5" = s."stringstream@0.0.5";
        "strip-ansi@3.0.1" = f "strip-ansi" "3.0.1" y "6a385fb8853d952d5ff05d0e8aaf94278dc63dcf" [
          (s."ansi-regex@^2.0.0")
        ];
        "strip-ansi@^3.0.0" = s."strip-ansi@3.0.1";
        "strip-ansi@^3.0.1" = s."strip-ansi@3.0.1";
        "strip-bom@2.0.0" = f "strip-bom" "2.0.0" y "6219a85616520491f35788bdbf1447a99c7e6b0e" [
          (s."is-utf8@^0.2.0")
        ];
        "strip-bom@^2.0.0" = s."strip-bom@2.0.0";
        "strip-indent@1.0.1" = f "strip-indent" "1.0.1" y "0c7962a6adefa7bbd4ac366460a638552ae1a0a2" [
          (s."get-stdin@^4.0.1")
        ];
        "strip-indent@^1.0.1" = s."strip-indent@1.0.1";
        "strip-json-comments@1.0.4" = f "strip-json-comments" "1.0.4" y "1e15fbcac97d3ee99bf2d73b4c656b082bbafb91" [];
        "strip-json-comments@1.0.x" = s."strip-json-comments@1.0.4";
        "strip-json-comments@2.0.1" = f "strip-json-comments" "2.0.1" y "3c531942e908c2697c0ec344858c286c7ca0a60a" [];
        "strip-json-comments@~2.0.1" = s."strip-json-comments@2.0.1";
        "subarg@1.0.0" = f "subarg" "1.0.0" y "f62cf17581e996b48fc965699f54c06ae268b8d2" [
          (s."minimist@^1.1.0")
        ];
        "subarg@^1.0.0" = s."subarg@1.0.0";
        "supports-color@2.0.0" = f "supports-color" "2.0.0" y "535d045ce6b6363fa40117084629995e9df324c7" [];
        "supports-color@3.1.2" = f "supports-color" "3.1.2" y "72a262894d9d408b956ca05ff37b2ed8a6e2a2d5" [
          (s."has-flag@^1.0.0")
        ];
        "supports-color@^2.0.0" = s."supports-color@2.0.0";
        "syntax-error@1.4.0" = f "syntax-error" "1.4.0" y "2d9d4ff5c064acb711594a3e3b95054ad51d907c" [
          (s."acorn-node@^1.2.0")
        ];
        "syntax-error@^1.1.1" = s."syntax-error@1.4.0";
        "tar@*" = s."tar@4.4.2";
        "tar@2.2.1" = f "tar" "2.2.1" y "8e4d2a256c0e2185c6b18ad694aec968b83cb1d1" [
          (s."block-stream@*")
          (s."fstream@^1.0.2")
          (s."inherits@2")
        ];
        "tar@4.4.2" = f "tar" "4.4.2" y "60685211ba46b38847b1ae7ee1a24d744a2cd462" [
          (s."chownr@^1.0.1")
          (s."fs-minipass@^1.2.5")
          (s."minipass@^2.2.4")
          (s."minizlib@^1.1.0")
          (s."mkdirp@^0.5.0")
          (s."safe-buffer@^5.1.2")
          (s."yallist@^3.0.2")
        ];
        "tar@^4" = s."tar@4.4.2";
        "tarball-extract@0.0.3" = f "tarball-extract" "0.0.3" y "f9685258bfbfae97ff006618ab318913d18d7a94" [
          (s."tar@*")
          (s."wget@*")
        ];
        "temp@0.8.3" = f "temp" "0.8.3" y "e0c6bc4d26b903124410e4fed81103014dfc1f59" [
          (s."os-tmpdir@^1.0.0")
          (s."rimraf@~2.2.6")
        ];
        "temp@^0.8.1" = s."temp@0.8.3";
        "thenify-all@1.6.0" = f "thenify-all" "1.6.0" y "1a1918d402d8fc3f98fbf234db0bcc8cc10e9726" [
          (s."thenify@>= 3.1.0 < 4")
        ];
        "thenify-all@^1.0.0" = s."thenify-all@1.6.0";
        "thenify-all@^1.6.0" = s."thenify-all@1.6.0";
        "thenify@3.3.0" = f "thenify" "3.3.0" y "e69e38a1babe969b0108207978b9f62b88604839" [
          (s."any-promise@^1.0.0")
        ];
        "thenify@>= 3.1.0 < 4" = s."thenify@3.3.0";
        "throttleit@0.0.2" = f "throttleit" "0.0.2" y "cfedf88e60c00dd9697b61fdd2a8343a9b680eaf" [];
        "through2@0.2.3" = f "through2" "0.2.3" y "eb3284da4ea311b6cc8ace3653748a52abf25a3f" [
          (s."readable-stream@~1.1.9")
          (s."xtend@~2.1.1")
        ];
        "through2@2.0.3" = f "through2" "2.0.3" y "0004569b37c7c74ba39c43f3ced78d1ad94140be" [
          (s."readable-stream@^2.1.5")
          (s."xtend@~4.0.1")
        ];
        "through2@^2.0.0" = s."through2@2.0.3";
        "through2@~0.2.3" = s."through2@0.2.3";
        "through@2.2.7" = f "through" "2.2.7" y "6e8e21200191d4eb6a99f6f010df46aa1c6eb2bd" [];
        "through@2.3.8" = f "through" "2.3.8" y "0dd4c9ffaabc357960b1b724115d7e0e86a2e1f5" [];
        "through@>=2.2.7 <3" = s."through@2.3.8";
        "through@^2.3.8" = s."through@2.3.8";
        "through@~2.2.7" = s."through@2.2.7";
        "through@~2.3.8" = s."through@2.3.8";
        "timed-out@2.0.0" = f "timed-out" "2.0.0" y "f38b0ae81d3747d628001f41dafc652ace671c0a" [];
        "timed-out@^2.0.0" = s."timed-out@2.0.0";
        "timers-browserify@1.4.2" = f "timers-browserify" "1.4.2" y "c9c58b575be8407375cb5e2462dacee74359f41d" [
          (s."process@~0.11.0")
        ];
        "timers-browserify@^1.0.1" = s."timers-browserify@1.4.2";
        "to-arraybuffer@1.0.1" = f "to-arraybuffer" "1.0.1" y "7d229b1fcc637e466ca081180836a7aabff83f43" [];
        "to-arraybuffer@^1.0.0" = s."to-arraybuffer@1.0.1";
        "to-fast-properties@1.0.3" = f "to-fast-properties" "1.0.3" y "b83571fa4d8c25b82e231b06e3a3055de4ca1a47" [];
        "to-fast-properties@^1.0.0" = s."to-fast-properties@1.0.3";
        "to-object-path@0.3.0" = f "to-object-path" "0.3.0" y "297588b7b0e7e0ac08e04e672f85c1f4999e17af" [
          (s."kind-of@^3.0.2")
        ];
        "to-object-path@^0.3.0" = s."to-object-path@0.3.0";
        "to-regex-range@2.1.1" = f "to-regex-range" "2.1.1" y "7c80c17b9dfebe599e27367e0d4dd5590141db38" [
          (s."is-number@^3.0.0")
          (s."repeat-string@^1.6.1")
        ];
        "to-regex-range@^2.1.0" = s."to-regex-range@2.1.1";
        "to-regex@3.0.2" = f "to-regex" "3.0.2" y "13cfdd9b336552f30b51f33a8ae1b42a7a7599ce" [
          (s."define-property@^2.0.2")
          (s."extend-shallow@^3.0.2")
          (s."regex-not@^1.0.2")
          (s."safe-regex@^1.1.0")
        ];
        "to-regex@^3.0.1" = s."to-regex@3.0.2";
        "to-regex@^3.0.2" = s."to-regex@3.0.2";
        "touch@1.0.0" = f "touch" "1.0.0" y "449cbe2dbae5a8c8038e30d71fa0ff464947c4de" [
          (s."nopt@~1.0.10")
        ];
        "touch@^1.0.0" = s."touch@1.0.0";
        "tough-cookie@2.3.4" = f "tough-cookie" "2.3.4" y "ec60cee38ac675063ffc97a5c18970578ee83655" [
          (s."punycode@^1.4.1")
        ];
        "tough-cookie@~2.3.3" = s."tough-cookie@2.3.4";
        "tree-kill@1.2.0" = f "tree-kill" "1.2.0" y "5846786237b4239014f05db156b643212d4c6f36" [];
        "tree-kill@^1.0.0" = s."tree-kill@1.2.0";
        "trim-newlines@1.0.0" = f "trim-newlines" "1.0.0" y "5887966bb582a4503a41eb524f7d35011815a613" [];
        "trim-newlines@^1.0.0" = s."trim-newlines@1.0.0";
        "trim-right@1.0.1" = f "trim-right" "1.0.1" y "cb2e1203067e0c8de1f614094b9fe45704ea6003" [];
        "trim-right@^1.0.0" = s."trim-right@1.0.1";
        "try-resolve@1.0.1" = f "try-resolve" "1.0.1" y "cfde6fabd72d63e5797cfaab873abbe8e700e912" [];
        "try-resolve@^1.0.0" = s."try-resolve@1.0.1";
        "tryor@0.1.2" = f "tryor" "0.1.2" y "8145e4ca7caff40acde3ccf946e8b8bb75b4172b" [];
        "tryor@~0.1.2" = s."tryor@0.1.2";
        "tty-browserify@0.0.1" = f "tty-browserify" "0.0.1" y "3f05251ee17904dfd0677546670db9651682b811" [];
        "tty-browserify@~0.0.0" = s."tty-browserify@0.0.1";
        "tunnel-agent@0.6.0" = f "tunnel-agent" "0.6.0" y "27a5dea06b36b04a0a9966774b290868f0fc40fd" [
          (s."safe-buffer@^5.0.1")
        ];
        "tunnel-agent@^0.6.0" = s."tunnel-agent@0.6.0";
        "tunnel@0.0.2" = f "tunnel" "0.0.2" y "f23bcd8b7a7b8a864261b2084f66f93193396334" [];
        "tweetnacl@0.14.5" = f "tweetnacl" "0.14.5" y "5ae68177f192d4456269d108afa93ff8743f4f64" [];
        "tweetnacl@^0.14.3" = s."tweetnacl@0.14.5";
        "tweetnacl@~0.14.0" = s."tweetnacl@0.14.5";
        "type-detect@0.1.1" = f "type-detect" "0.1.1" y "0ba5ec2a885640e470ea4e8505971900dac58822" [];
        "type-detect@1.0.0" = f "type-detect" "1.0.0" y "762217cc06db258ec48908a1298e8b95121e8ea2" [];
        "type-detect@^1.0.0" = s."type-detect@1.0.0";
        "typedarray@0.0.6" = f "typedarray" "0.0.6" y "867ac74e3864187b1d3d47d996a78ec5c8830777" [];
        "typedarray@^0.0.6" = s."typedarray@0.0.6";
        "typedarray@~0.0.5" = s."typedarray@0.0.6";
        "umd@3.0.3" = f "umd" "3.0.3" y "aa9fe653c42b9097678489c01000acb69f0b26cf" [];
        "umd@^3.0.0" = s."umd@3.0.3";
        "union-value@1.0.0" = f "union-value" "1.0.0" y "5c71c34cb5bad5dcebe3ea0cd08207ba5aa1aea4" [
          (s."arr-union@^3.1.0")
          (s."get-value@^2.0.6")
          (s."is-extendable@^0.1.1")
          (s."set-value@^0.4.3")
        ];
        "union-value@^1.0.0" = s."union-value@1.0.0";
        "unset-value@1.0.0" = f "unset-value" "1.0.0" y "8376873f7d2335179ffb1e6fc3a8ed0dfc8ab559" [
          (s."has-value@^0.3.1")
          (s."isobject@^3.0.0")
        ];
        "unset-value@^1.0.0" = s."unset-value@1.0.0";
        "unzip-response@1.0.2" = f "unzip-response" "1.0.2" y "b984f0877fc0a89c2c773cc1ef7b5b232b5b06fe" [];
        "unzip-response@^1.0.0" = s."unzip-response@1.0.2";
        "upath@1.0.5" = f "upath" "1.0.5" y "02cab9ecebe95bbec6d5fc2566325725ab6d1a73" [];
        "upath@^1.0.0" = s."upath@1.0.5";
        "urix@0.1.0" = f "urix" "0.1.0" y "da937f7a62e21fec1fd18d49b35c2935067a6c72" [];
        "urix@^0.1.0" = s."urix@0.1.0";
        "url@0.11.0" = f "url" "0.11.0" y "3838e97cfc60521eb73c525a8e55bfdd9e2e28f1" [
          (s."punycode@1.3.2")
          (s."querystring@0.2.0")
        ];
        "url@~0.11.0" = s."url@0.11.0";
        "use@3.1.0" = f "use" "3.1.0" y "14716bf03fdfefd03040aef58d8b4b85f3a7c544" [
          (s."kind-of@^6.0.2")
        ];
        "use@^3.1.0" = s."use@3.1.0";
        "user-home@1.1.1" = f "user-home" "1.1.1" y "2b5be23a32b63a7c9deb8d0f28d485724a3df190" [];
        "user-home@^1.1.1" = s."user-home@1.1.1";
        "util-deprecate@1.0.2" = f "util-deprecate" "1.0.2" y "450d4dc9fa70de732762fbd2d4a28981419a0ccf" [];
        "util-deprecate@~1.0.1" = s."util-deprecate@1.0.2";
        "util@0.10.3" = f "util" "0.10.3" y "7afb1afe50805246489e3db7fe0ed379336ac0f9" [
          (s."inherits@2.0.1")
        ];
        "util@~0.10.1" = s."util@0.10.3";
        "uuid@3.2.1" = f "uuid" "3.2.1" y "12c528bb9d58d0b9265d9a2f6f0fe8be17ff1f14" [];
        "uuid@^3.1.0" = s."uuid@3.2.1";
        "validate-npm-package-license@3.0.3" = f "validate-npm-package-license" "3.0.3" y "81643bcbef1bdfecd4623793dc4648948ba98338" [
          (s."spdx-correct@^3.0.0")
          (s."spdx-expression-parse@^3.0.0")
        ];
        "validate-npm-package-license@^3.0.1" = s."validate-npm-package-license@3.0.3";
        "verror@1.10.0" = f "verror" "1.10.0" y "3a105ca17053af55d6e270c1f8288682e18da400" [
          (s."assert-plus@^1.0.0")
          (s."core-util-is@1.0.2")
          (s."extsprintf@^1.2.0")
        ];
        "vm-browserify@0.0.4" = f "vm-browserify" "0.0.4" y "5d7ea45bbef9e4a6ff65f95438e0a87c357d5a73" [
          (s."indexof@0.0.1")
        ];
        "vm-browserify@~0.0.1" = s."vm-browserify@0.0.4";
        "watchpack@1.6.0" = f "watchpack" "1.6.0" y "4bc12c2ebe8aa277a71f1d3f14d685c7b446cd00" [
          (s."chokidar@^2.0.2")
          (s."graceful-fs@^4.1.2")
          (s."neo-async@^2.5.0")
        ];
        "watchpack@^1.0.1" = s."watchpack@1.6.0";
        "wget@*" = s."wget@0.0.1";
        "wget@0.0.1" = f "wget" "0.0.1" y "8bb81af0b8e60b5df262d3c81e5737e1f4931e53" [
          (s."tunnel@0.0.2")
        ];
        "which@1.3.0" = f "which" "1.3.0" y "ff04bdfc010ee547d780bec38e1ac1c2777d253a" [
          (s."isexe@^2.0.0")
        ];
        "which@^1.2.1" = s."which@1.3.0";
        "wide-align@1.1.2" = f "wide-align" "1.1.2" y "571e0f1b0604636ebc0dfc21b0339bbe31341710" [
          (s."string-width@^1.0.2")
        ];
        "wide-align@^1.1.0" = s."wide-align@1.1.2";
        "window-size@0.1.4" = f "window-size" "0.1.4" y "f8e1aa1ee5a53ec5bf151ffa09742a6ad7697876" [];
        "window-size@^0.1.2" = s."window-size@0.1.4";
        "wordwrap@0.0.2" = f "wordwrap" "0.0.2" y "b79669bb42ecb409f83d583cad52ca17eaa1643f" [];
        "wordwrap@0.0.3" = f "wordwrap" "0.0.3" y "a3d5da6cd5c0bc0008d37234bbaf1bed63059107" [];
        "wordwrap@1.0.0" = f "wordwrap" "1.0.0" y "27584810891456a4171c8d0226441ade90cbcaeb" [];
        "wordwrap@~0.0.2" = s."wordwrap@0.0.3";
        "wrappy@1" = s."wrappy@1.0.2";
        "wrappy@1.0.2" = f "wrappy" "1.0.2" y "b5243d8f3ec1aa35f1364605bc0d1036e30ab69f" [];
        "xtend@2.1.2" = f "xtend" "2.1.2" y "6efecc2a4dad8e6962c4901b337ce7ba87b5d28b" [
          (s."object-keys@~0.4.0")
        ];
        "xtend@4.0.1" = f "xtend" "4.0.1" y "a5c6d532be656e23db820efb943a1f04998d63af" [];
        "xtend@^4.0.0" = s."xtend@4.0.1";
        "xtend@^4.0.1" = s."xtend@4.0.1";
        "xtend@~2.1.1" = s."xtend@2.1.2";
        "xtend@~4.0.1" = s."xtend@4.0.1";
        "y18n@3.2.1" = f "y18n" "3.2.1" y "6d15fba884c08679c0d77e88e7759e811e07fa41" [];
        "y18n@^3.2.0" = s."y18n@3.2.1";
        "yallist@3.0.2" = f "yallist" "3.0.2" y "8452b4bb7e83c7c188d8041c1a837c773d6d8bb9" [];
        "yallist@^3.0.0" = s."yallist@3.0.2";
        "yallist@^3.0.2" = s."yallist@3.0.2";
        "yargs@3.27.0" = f "yargs" "3.27.0" y "21205469316e939131d59f2da0c6d7f98221ea40" [
          (s."camelcase@^1.2.1")
          (s."cliui@^2.1.0")
          (s."decamelize@^1.0.0")
          (s."os-locale@^1.4.0")
          (s."window-size@^0.1.2")
          (s."y18n@^3.2.0")
        ];
        "yargs@~3.27.0" = s."yargs@3.27.0";
      }