{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-20.03";

  outputs = { self, nixpkgs }: rec {
    overlay = self: super: {
      foundry-vtt = callPackage ./foundry-vtt-headless.nix { };
    };
  };
}
