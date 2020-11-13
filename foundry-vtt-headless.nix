{ stdenv, requireFile, autoPatchelfHook, unzip, libX11, libXcomposite, glib
, libXcursor, libXdamage, libXext, libXi, libXrender, libXtst, libxcb, nspr
, dbus, gdk-pixbuf, gtk3, pango, atk, cairo, expat, libXrandr, libXScrnSaver
, alsaLib, at-spi2-core, cups, nss, ... }:

let
  zipfile = requireFile {
    name = "foundry-vtt-nodejs-0.7.6.zip";
    sha256 = "d7223111797f48a3b39be7679c041d9619e9786cd15894e21b8134f346098821";
    url = "";
  };

in stdenv.mkDerivation rec {
  pname = "foundry-vtt";
  version = "0.7.6";
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
