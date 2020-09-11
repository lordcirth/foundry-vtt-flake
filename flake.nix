{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-20.03";

  outputs = { self, nixpkgs }: rec {
    overlay = self: super: {
      foundry-vtt = nixpkgs.pkg.callPackage ./foundry-vtt-headless.nix { };
    };
  };
}
