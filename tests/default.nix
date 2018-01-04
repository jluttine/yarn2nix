{ yarn2nix }:
with builtins;
let
  build = names: map buildEntry names;
  buildEntry = name: {
    inherit name;
    value = yarn2nix.mkYarnPackage { src = ./. + "/${name}"; };
  };
in
listToAttrs (build ["daedalus" "wetty" "weave-front-end"])
