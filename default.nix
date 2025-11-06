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
    description = "Pseudo boolean counter based on addmc";
    homepage = "https://github.com/grab/pbcount";
    license = lib.licenses.mit;
    platforms = lib.platforms.unix;
  };
}
