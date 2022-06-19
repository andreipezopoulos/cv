{ }:

let
  pkgs = import (builtins.fetchGit {
    name = "nixpkgs-22.05";
    url = "https://github.com/NixOS/nixpkgs";
    ref = "refs/tags/22.05";
    rev = "ce6aa13369b667ac2542593170993504932eb836";
  }) {};
in
pkgs.stdenv.mkDerivation {
  name = "mycv";
  version = "0.1";
  src = ./src;

  buildInputs = [
    pkgs.texlive.combined.scheme-full
    pkgs.python311
  ];

  configurePhase = ''
    python3 configure.py
  '';

  buildPhase = ''
     pdflatex -jobname=cv_eng "\input{personal_info.tex} \input{eng.tex} \input{cv.tex}"
     pdflatex -jobname=cv_pt "\input{personal_info.tex} \input{pt-br.tex} \input{cv.tex}"
  '';

  installPhase = ''
    mkdir $out
    mv cv_eng.pdf $out
    mv cv_pt.pdf $out
  '';
}
