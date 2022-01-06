{ stdenv, requireFile, autoPatchelfHook, unzip, libX11, libXcomposite, glib
, libdrm, mesa, libXcursor, libXdamage, libXext, libXi, libXrender, libXtst, libxcb, nspr
, dbus, gdk-pixbuf, gtk3, pango, atk, cairo, expat, libxshmfence, libXrandr, libXScrnSaver
, alsaLib, at-spi2-core, cups, nss, ... }:

let
  zipfile = requireFile {
    name = "foundryvtt-9.238.zip";
    sha256 = "0000000000000000000000000000000000000000000000000000";
    url = "";
  };

in stdenv.mkDerivation rec {
  pname = "foundry-vtt";
  version = "9.238";
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
