{ stdenv, requireFile, autoPatchelfHook, unzip, libX11, libXcomposite, glib
, libdrm, mesa, libXcursor, libXdamage, libXext, libXi, libXrender, libXtst, libxcb, nspr
, dbus, gdk-pixbuf, gtk3, pango, atk, cairo, expat, libxshmfence, libXrandr, libXScrnSaver
, alsaLib, at-spi2-core, cups, nss, ... }:

let
  zipfile = requireFile {
    name = "foundryvtt-0.8.6.zip";
    sha256 = "2ccad532c876dbdd1980d6ddaf6f8eb4a7267757dca2b3219633d4b4b30c12b0";
    url = "";
  };

in stdenv.mkDerivation rec {
  pname = "foundry-vtt";
  version = "0.8.6";
  src = zipfile;

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
