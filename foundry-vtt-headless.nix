{ stdenv, requireFile, autoPatchelfHook, unzip, libX11, libXcomposite, glib
, libdrm, mesa, libXcursor, libXdamage, libXext, libXi, libXrender, libXtst, libxcb, nspr
, dbus, gdk-pixbuf, gtk3, pango, atk, cairo, expat, libxshmfence, libXrandr, libXScrnSaver
, alsa-lib, at-spi2-core, cups, nss, ... }:

let
  zipfile = requireFile {
    name = "FoundryVTT-Linux-13.347.zip";
    sha256 = "13bba5hmkcbgli96l2w75a14v8abn29mrkjskl0y74lzf3rqlsw1";
    url = "";
  };

in stdenv.mkDerivation rec {
  pname = "foundry-vtt";
  version = "13.347";
  src = zipfile;

  autoPatchelfIgnoreMissingDeps = true;

  buildInputs = [
    alsa-lib
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
