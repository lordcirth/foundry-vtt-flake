{ stdenv, requireFile, autoPatchelfHook, unzip, libX11, libXcomposite, glib
, libdrm, mesa, libXcursor, libXdamage, libXext, libXi, libXrender, libXtst, libxcb, nspr
, dbus, gdk-pixbuf, gtk3, pango, atk, cairo, expat, libxshmfence, libXrandr, libXScrnSaver
, alsaLib, at-spi2-core, cups, nss, ... }:

let
  zipfile = requireFile {
    name = "FoundryVTT-11.308.zip";
    sha256 = "04jckd3i81a3jdq86cqp7s6b3gpsx9d1q8sbcca4fzk37yr2c53c";
    url = "";
  };

in stdenv.mkDerivation rec {
  pname = "foundry-vtt";
  version = "11.308";
  src = zipfile;

  #autoPatchelfIgnoreMissingDeps = [
  #  "libc.musl-x86_64.so.1"
  #];

  autoPatchelfIgnoreMissingDeps = true;

  buildInputs = [
    alsaLib
    at-spi2-core
    atk
    autoPatchelfHook
    cairo
    cups
    dbus
    expat
    gdk-pixbuf
    glib
    gtk3
    libxshmfence
    libdrm
    libX11
    libXScrnSaver
    libXcomposite
    libXcursor
    libXdamage
    libXext
    libXi
    libXrandr
    libXrender
    libXrender
    libXtst
    libxcb
    nspr
    nss
    mesa
    pango
    unzip
  ];

  unpackPhase = ''
    unzip ${src} -d src
  '';

  installPhase = ''
    cp -r src $out
  '';
}
