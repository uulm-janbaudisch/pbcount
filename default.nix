{
  lib,
  stdenv,
  cmake,
  boost,
}:
stdenv.mkDerivation {
  pname = "pbcount";
  version = "1.0.0";

  src = ./.;

  nativeBuildInputs = [ cmake ];

  buildInputs = [
    boost.dev
  ];

  meta = {
    mainProgram = "pbcount";
    description = "pseudo boolean counter based on addmc";
    # TODO
    homepage = "https://github.com/SoftVarE-Group/d4v2";
    # TODO
    license = lib.licenses.lgpl21Plus;
    platforms = lib.platforms.unix;
  };
}
